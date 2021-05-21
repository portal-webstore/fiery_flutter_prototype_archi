import 'package:cloud_firestore/cloud_firestore.dart'
    show
        CollectionReference,
        DocumentReference,
        DocumentSnapshot,
        FirebaseFirestore,
        Query,
        QueryDocumentSnapshot,
        QuerySnapshot,
        WriteBatch;
import 'package:order_repository/order_repository.dart'
    show
        Order,
        OrderEntity,
        OrderPatientTreatmentProductItemRepository,
        OrderRepository,
        PatientTreatmentProductItem,
        PatientTreatmentProductItemEntity;

class FirebaseOrderRepository implements OrderRepository {
  static const int arbitraryDocQueryCountLimit = 6;

  /// - FIXME: These accessors should really be nested under clinic collection
  /// clinic/clinicID/orders/orderID/items/*
  static const String ordersPath = 'orders';

  /// Subcollection ID
  /// i.e. semantically, orders.<docID>.patientTreatmentProductItems.<docID> as
  /// the path to get the items subcollection arr
  static const String itemsPath = 'patientTreatmentProductItems';

  static const String orderCreatedAtEpochFieldName = 'createdAt';
  static const String statusFieldName = 'status';

  final CollectionReference<Map<String, dynamic>> orderCollection =
      FirebaseFirestore.instance.collection(ordersPath);

  @override
  Future<void> addNewOrder(Order order) {
    final Map<String, Object?> document = order.toEntity().toDocument();

    return orderCollection.add(document);
  }

  @override
  Future<void> deleteOrder(Order order) {
    return orderCollection.doc(order.orderID).delete();
  }

  @override
  Stream<List<Order>> orders({
    int limitMostRecentCount = arbitraryDocQueryCountLimit,
  }) {
    final Stream<QuerySnapshot<Map<String, dynamic>>> sortedSnapshots =
        orderCollection
            .orderBy(orderCreatedAtEpochFieldName, descending: true)
            .limit(limitMostRecentCount)
            .snapshots();

    final Stream<List<Order>> orderDocuments = sortedSnapshots.map(
      (querySnapshot) {
        final List<QueryDocumentSnapshot<Map<String, dynamic>>>
            ordersQuerySnapDocs = querySnapshot.docs;
        final List<Order> orders = ordersQuerySnapDocs
            .map(
              _getOrderFromSnapshot,
            )
            .toList();

        return orders;
      },
    );

    return orderDocuments;
  }

  @override
  Future<Order?> getOrder(
    String orderID,
  ) async {
    final DocumentReference<Map<String, dynamic>> orderDocRef =
        orderCollection.doc(orderID);
    final DocumentSnapshot<Map<String, dynamic>> orderSnap =
        await orderDocRef.get();

    final Order order = _getOrderFromSnapshot(orderSnap);

    return order;
  }

  /// Depending on UX flow of either searching by:
  ///
  /// No uniqueness restriction for the clinic's given order reference.
  /// They could potentially have multiple on same day with same free text ref
  /// they sort it out by looking at the time
  /// i.e. 8am treatment, 10am treatment, 1pm treatment.
  ///
  /// Potential WHERE fields to search/filter or sort by
  /// timestamp (order creation),
  /// delivery date
  /// or
  /// order reference free text first
  ///
  /// we could filter recents locally instead of through firestore query.
  ///
  @override
  Future<List<Order>> getOrders({
    required String orderReferenceFreeText,
  }) async {
    final Query<Map<String, dynamic>> orderQuery = orderCollection.where(
      'orderReference',
      isEqualTo: orderReferenceFreeText,
    );

    /// Snapshots Stream vs get() Future List
    final QuerySnapshot<Map<String, dynamic>> orderSnaps =
        await orderQuery.limit(arbitraryDocQueryCountLimit).get();

    final orders = orderSnaps.docs.map((
      QueryDocumentSnapshot<Map<String, dynamic>> orderSnap,
    ) {
      final Order order = _getOrderFromSnapshot(orderSnap);

      return order;
    }).toList();

    return orders;
  }

  /// Query a single item from the order's subcollection for Firestore efficiency.
  ///
  /// Otherwise we could reuse the bulk query items.
  @override
  Future<PatientTreatmentProductItem?> getItemFromOrder({
    required String orderID,
    required String orderItemID,
  }) async {
    try {
      final CollectionReference<Map<String, dynamic>> items =
          orderCollection.doc(orderID).collection(itemsPath);

      /// Clean code would prefere separate classes to safeguard the props
      /// For quick value: reuse the same PatientTreatmentProductItem class
      /// and add an optional **nullable* ID attribute for existing compatibility
      /// Then refactor back out the write vs read model adaptation
      ///
      /// i.e. Input model building the item up has no ID by necessity;
      /// however, it could potentially have an id in an edit use case.
      ///

      final DocumentReference<Map<String, dynamic>> itemDocRef =
          await items.doc(orderItemID);

      /// Use Future get document read.
      /// We do not need real-time updates
      ///
      /// Partitioned single user's view for drafts potential
      /// Otherwise historical doesn't change apart from clinic confirmation
      /// or twp internal status update tick
      ///
      final DocumentSnapshot<Map<String, dynamic>> itemSnap =
          await itemDocRef.get();

      final PatientTreatmentProductItem item = _getItemFromSnapshot(itemSnap);

      return item;
    } on Exception catch (exception) {
      print(exception);

      /// Flutter fire doc hover hints do not explicitly show the types of exception
      /// calls?
      ///
      /// Assuming that a non-existent path will break here
      ///
      return null;
    }
  }

  /// Get all the patient treatment product items found within the subcollection
  /// within order
  ///
  /// From subcollection?
  /// Or direct UUID searching orders
  ///
  /// Not reusing this for orderItem to keep the network request / firestore usage lean.
  ///
  ///
  /// Clean code prefers empty arrays as they can still be iterated + lazily
  /// vs a broad null with explicit checks;
  ///  :thinking:
  @override
  Future<List<PatientTreatmentProductItem>> getItemsFromOrder({
    required String orderID,
  }) async {
    final CollectionReference<Map<String, dynamic>> itemCollection =
        orderCollection
            .doc(
              orderID,
            )
            .collection(
              itemsPath,
            );

    final QuerySnapshot<Map<String, dynamic>> itemSnaps =
        await itemCollection.get();

    final List<PatientTreatmentProductItem> items = itemSnaps.docs
        .map(
          _getItemFromSnapshot,
        )
        .toList();

    /// ? Will need to be maintaining the orderID (doc id) and orderItemID (doc id)
    /// for its lifecycle in further calls... Code smell?
    ///
    /// And do not make the presentation logic code dependent on entity
    ///
    /// Could make optional identifier?
    /// An accessible view logic interface would, in the background, compare the
    /// whole array diff for the specific changes and only allow the specific
    /// doc to be updated in the subcollection here in the repo code.
    ///
    /// Would be technically cool.

    return items;
  }

  @override
  Future<void> updateOrder(Order order) {
    final DocumentReference<Map<String, dynamic>> orderDocRef =
        orderCollection.doc(order.orderID);
    final Map<String, Object?> orderDocDataToUpdateWith =
        _getDocumentFromOrder(order);

    return orderDocRef.update(
      orderDocDataToUpdateWith,
    );
  }

  @override
  Future<void> updateItemStatusWithinOrder(
    Order order,
    PatientTreatmentProductItem item,
  ) async {
    /// Much more readable as long as everything is working happy path
    /// Otherwise break out self-descriptive variables for debuggability and
    /// onboarding
    return await orderCollection
        .doc(order.orderID)
        .collection(itemsPath)
        .doc(item.patientTreatmentProductItemID)
        .update({statusFieldName: item.status});
  }

  static Order _getOrderFromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> orderSnap,
  ) {
    final OrderEntity orderEntity = OrderEntity.fromSnapshot(orderSnap);
    final Order order = Order.fromEntity(orderEntity);

    return order;
  }

  /// Utility to help map common conversions from firestore entity to our
  /// business logical data model.
  static List<Order> _getOrdersFromOrderDocumentSnapshots(
    List<DocumentSnapshot<Map<String, dynamic>>> orderSnapDocs,
  ) {
    final Iterable<Order> ordersIterable = orderSnapDocs.map(
      _getOrderFromSnapshot,
    );
    final List<Order> orders = ordersIterable.toList();

    return orders;
  }

  PatientTreatmentProductItem _getItemFromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> itemSnap,
  ) {
    final PatientTreatmentProductItemEntity itemEntity =
        PatientTreatmentProductItemEntity.fromSnapshot(itemSnap);
    final PatientTreatmentProductItem item =
        PatientTreatmentProductItem.fromEntity(itemEntity);

    return item;
  }

  /// Subcollection access utility
  Future<List<PatientTreatmentProductItem>> _getItemsCollectionFromOrder(
    String orderID,
  ) async {
    final CollectionReference<Map<String, dynamic>> itemsCollection =
        orderCollection
            .doc(
              orderID,
            )
            .collection(
              itemsPath,
            );

    /// Convert into an entity while retaining ID if we so choose to update
    /// specific item one at a time
    /// or update item status field
    ///

    final QuerySnapshot<Map<String, dynamic>> itemQuerySnapshot =
        await itemsCollection.get();
    final List<QueryDocumentSnapshot<Map<String, dynamic>>> itemDocSnaps =
        itemQuerySnapshot.docs;

    final List<PatientTreatmentProductItem> items = itemDocSnaps
        .map(
          _getItemFromSnapshot,
        )
        .toList();

    return items;
  }

  Map<String, dynamic> _getDocumentFromItem(PatientTreatmentProductItem item) =>
      item.toEntity().toDocument();

  Map<String, Object?> _getDocumentFromOrder(Order order) =>
      order.toEntity().toDocument();

}
