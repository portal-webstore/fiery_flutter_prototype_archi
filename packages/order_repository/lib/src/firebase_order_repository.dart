import 'package:cloud_firestore/cloud_firestore.dart'
    show
        CollectionReference,
        DocumentReference,
        DocumentSnapshot,
        FirebaseFirestore,
        Query,
        QueryDocumentSnapshot,
        QuerySnapshot;
import 'package:order_repository/order_repository.dart'
    show
        Order,
        OrderEntity,
        OrderRepository,
        PatientTreatmentProductItemEntity,
        PatientTreatmentProductItem;

class FirebaseOrderRepository implements OrderRepository {
  static const int arbitraryDocQueryCountLimit = 6;

  static const String ordersPath = 'orders';

  /// i.e. semantically, orders.<docID>.patientTreatmentProductItems.<docID> as
  /// the path to get the items subcollection arr
  static const String orderPatientTreatmentProductItemsSubcollectionIDPath =
      'patientTreatmentProductItems';

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
        final List<Order> orders = ordersQuerySnapDocs.map(
          (QueryDocumentSnapshot<Map<String, dynamic>> doc) {
            return Order.fromEntity(
              OrderEntity.fromSnapshot(doc),
            );
          },
        ).toList();

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

    final OrderEntity orderEntity = OrderEntity.fromSnapshot(orderSnap);
    final Order order = Order.fromEntity(orderEntity);

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
  Stream<List<Order>> getOrders({
    required String orderReferenceFreeText,
  }) {
    final Query<Map<String, dynamic>> orderQuery = orderCollection.where(
      'orderReference',
      isEqualTo: orderReferenceFreeText,
    );

    /// Snapshots Stream vs get() Future List
    final Stream<QuerySnapshot<Map<String, dynamic>>> orderSnaps =
        orderQuery.limit(arbitraryDocQueryCountLimit).snapshots();

    final Stream<List<Order>> orders = orderSnaps.map((
      QuerySnapshot<Map<String, dynamic>> orderSnap,
    ) {
      final List<QueryDocumentSnapshot<Map<String, dynamic>>> orderSnapDocs =
          orderSnap.docs;

      final List<Order> orders =
          _getOrdersFromOrderQueryDocumentSnapshots(orderSnapDocs);

      return orders;
    });

    return orders;
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
  Stream<List<PatientTreatmentProductItem>> getItemsFromOrder({
    required String orderID,
  }) {
    final CollectionReference<Map<String, dynamic>> itemCollection =
        orderCollection
            .doc(
              orderID,
            )
            .collection(
              orderPatientTreatmentProductItemsSubcollectionIDPath,
            );

    final Stream<QuerySnapshot<Map<String, dynamic>>> itemSnaps =
        itemCollection.snapshots();

    final Stream<List<PatientTreatmentProductItem>> items =
        itemSnaps.map((QuerySnapshot<Map<String, dynamic>> itemSnap) {
      final List<QueryDocumentSnapshot<Map<String, dynamic>>> itemDocs =
          itemSnap.docs;

      final Iterable<PatientTreatmentProductItem> items =
          itemDocs.map((QueryDocumentSnapshot<Map<String, dynamic>> itemDoc) {
        final PatientTreatmentProductItemEntity itemEntity =
            PatientTreatmentProductItemEntity.fromFirestore(itemDoc);

        final PatientTreatmentProductItem item =
            PatientTreatmentProductItem.fromEntity(itemEntity);

        return item;
      });

      return items.toList();
    });

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
        order.toEntity().toDocument();

    return orderDocRef.update(
      orderDocDataToUpdateWith,
    );
  }
  /// Utility to help map common conversions from firestore entity to our
  /// business logical data model.
  static List<Order> _getOrdersFromOrderQueryDocumentSnapshots(
    List<QueryDocumentSnapshot<Map<String, dynamic>>> orderSnapDocs,
  ) {
    final Iterable<Order> ordersIterable = orderSnapDocs.map((
      QueryDocumentSnapshot<Map<String, dynamic>> orderSnapDoc,
    ) {
      final OrderEntity orderEntity = OrderEntity.fromSnapshot(orderSnapDoc);
      final Order order = Order.fromEntity(orderEntity);

      return order;
    });
    final List<Order> orders = ordersIterable.toList();

    return orders;
  }

  /// Subcollection access utility
  Future<List<PatientTreatmentProductItem>> _getItemsCollectionFromOrder(
    String orderID,
  ) async {
    final CollectionReference<Map<String, dynamic>> itemsCollection =
        orderCollection
            .doc(orderID)
            .collection(orderPatientTreatmentProductItemsSubcollectionIDPath);

    /// Convert into an entity while retaining ID if we so choose to update
    /// specific item one at a time
    /// or update item status field
    ///

    final QuerySnapshot<Map<String, dynamic>> itemQuerySnapshot =
        await itemsCollection.get();

    final List<QueryDocumentSnapshot<Map<String, dynamic>>> itemDocSnaps =
        itemQuerySnapshot.docs;

    final List<PatientTreatmentProductItem> items = itemDocSnaps
        .map((QueryDocumentSnapshot<Map<String, dynamic>> itemDocSnap) {
      final PatientTreatmentProductItemEntity itemEntity =
          PatientTreatmentProductItemEntity.fromSnapshot(itemDocSnap);

      final PatientTreatmentProductItem item =
          PatientTreatmentProductItem.fromEntity(itemEntity);

      return item;
    }).toList();

    return items;
  }
}
