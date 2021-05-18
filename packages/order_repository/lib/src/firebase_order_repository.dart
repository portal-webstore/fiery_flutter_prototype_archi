import 'package:cloud_firestore/cloud_firestore.dart'
    show
        CollectionReference,
        FirebaseFirestore,
        QueryDocumentSnapshot,
        QuerySnapshot;
import 'package:order_repository/order_repository.dart'
    show Order, OrderEntity, OrderRepository;

class FirebaseOrderRepository implements OrderRepository {
  static const String ordersPath = 'orders';

  final orderCollection = FirebaseFirestore.instance.collection(ordersPath);

  @override
  Future<void> addNewOrder(Order order) {
    final document = order.toEntity().toDocument();

    return orderCollection.add(document);
  }

  @override
  Future<void> deleteOrder(Order order) {
    return orderCollection.doc(order.orderID).delete();
  }

  @override
  Stream<List<Order>> orders() {
    final sortedSnapshots = orderCollection
        .orderBy('createdAt', descending: true)
        .limit(6)
        .snapshots();
    final Stream<List<Order>> orderDocuments = sortedSnapshots.map(
      (querySnapshot) {
        final ordersQuerySnapDocs = querySnapshot.docs;
        final orders = ordersQuerySnapDocs.map(
          (doc) {
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
  Future<void> updateOrder(Order order) {
    final orderDocRef = orderCollection.doc(order.orderID);
    final orderDocDataToUpdateWith = order.toEntity().toDocument();

    return orderDocRef.update(
      orderDocDataToUpdateWith,
    );
  }
}
