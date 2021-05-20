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

/// Outline spec for item accessors and mutators
///
/// Superficially breaking out for readability
/// Still tightly coupled as it is part of the order
/// somewhat coupled with Firestore implementation details
///
abstract class OrderPatientTreatmentProductItemRepository {
  /// **Create**
  ///
  /// Strange intricacies due to firestore implementation details
  ///
  /// smelly coupled code
  ///
  /// Item can only be added to the order doc !?
  ///
  /// Should we not then return the updated Order
  ///
  ///
  Future<void> addItemToOrder(
    Order order,
    PatientTreatmentProductItem item,
  );

  /// **Read**
  Future<PatientTreatmentProductItem?> getItemFromOrder({
    required String orderID,
    required String orderItemID,
  });

  /// **Read**
  Future<List<PatientTreatmentProductItem>> getItemsFromOrder({
    required String orderID,
  });

  /// **Update**
  ///
  /// **we only want to update the status**
  /// Item ID should be known in this case.
  ///
  /// We should lock in firestore security rules
  Future<void> updateItemStatusWithinOrder(
    Order order,
    PatientTreatmentProductItem item,
  );

  /// Update
  /// we only want to update the status.
  /// Item ID should be known in this case.
  Future<void> updateItemWithinOrder(
    Order order,
    PatientTreatmentProductItem item,
  );

  /// **Delete**
  ///
  /// Remove item from order
  Future<void> deleteItemFromOrder({
    Order order,
    PatientTreatmentProductItem item,
  });
}

/// Should probably be separated and let concretions decide to compose their
/// own interface usage;
///
/// Tightly coupled anyway as subcollection is dependent on parent document type
/// which is PatientTreatmentProductItem / Entity -> Order / OrderEntity
abstract class OrderAndPatientTreatmentProductItemRepository
    implements OrderRepository, OrderPatientTreatmentProductItemRepository {}
