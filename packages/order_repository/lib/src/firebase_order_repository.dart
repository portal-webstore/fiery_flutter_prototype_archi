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
  static const String orderCreatedAtEpochFieldName = 'createdAt';

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
}
