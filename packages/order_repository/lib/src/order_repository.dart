import 'package:order_repository/order_repository.dart' show Order;

/// {@template order_repository}
/// Repository which retrieves static order list
/// {@endtemplate}
abstract class OrderRepository {
  /// Create
  Future<void> addNewOrder(Order order);

  /// Delete
  Future<void> deleteOrder(Order order);

  /// Read
  /// We have dynamic orders
  ///
  /// Potentially limited retention to four weeks ~ 31 days
  Stream<List<Order>> orders();

  /// Update
  Future<void> updateOrder(Order order);
}
