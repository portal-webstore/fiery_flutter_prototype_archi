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

  /// **Read**
  /// Search orders by a clinic-given order reference text
  ///
  /// Free text = no guarantees.
  Future<List<Order>> getOrders({
    required String orderReferenceFreeText,
  });

  /// Read
  /// We have dynamic orders
  ///
  /// Potentially limited retention to four weeks ~ 31 days
  ///
  /// Stream of orders for ongoing reads listening?
  ///
  @Deprecated(
    'See [getOrders] instead for simplicity of load. '
    'Note that the stream appears to load faster. '
    'Initially loads once with a single order (strange) and then listener '
    'returns another time (even though the orders all existed when the first '
    'query was called in the first place...'
    '\n Would expect all of the orders to have streamed in at once rather than'
    'streaming 1 then 1+2',
  )
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
    required Order order,
    required PatientTreatmentProductItem item,
  });
}

/// Should probably be separated and let concretions decide to compose their
/// own interface usage;
///
/// Tightly coupled anyway as subcollection is dependent on parent document type
/// which is PatientTreatmentProductItem / Entity -> Order / OrderEntity
abstract class OrderAndPatientTreatmentProductItemRepository
    implements OrderRepository, OrderPatientTreatmentProductItemRepository {}
