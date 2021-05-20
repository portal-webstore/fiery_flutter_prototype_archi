import 'package:order_repository/order_repository.dart'
    show Order, PatientTreatmentProductItem;

/// {@template order_repository}
/// Repository which retrieves static order list
/// {@endtemplate}
abstract class OrderRepository {
  static const int arbitraryDocQueryCountLimit = 6;

  /// Create
  Future<void> addNewOrder(Order order);

  /// **Read**
  /// Get a single order
  Future<Order?> getOrder(String orderID);

  /// Read
  /// We have dynamic orders
  ///
  /// Potentially limited retention to four weeks ~ 31 days
  ///
  /// Stream of orders for ongoing reads listening?
  ///
  Stream<List<Order>> orders({
    int limitMostRecentCount = arbitraryDocQueryCountLimit,
  });

  /// Update
  Future<void> updateOrder(Order order);

  /// Delete
  Future<void> deleteOrder(Order order);
}
