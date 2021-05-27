/// Encapsulate for route settings passing
///
/// Clinic information to reuse fresh query
/// Order information to load specific order query
///
class ReviewHistoricalOrderScreenArguments {
  const ReviewHistoricalOrderScreenArguments(
    this.clinicID,
    this.orderID,
  );

  /// Quick hacky solution
  /// Our quick validator to make sure the untyped route settings are valid
  /// for use in review order details screen
  factory ReviewHistoricalOrderScreenArguments.getValidatedFromRouteParamsArgs(
    Object? args,
  ) {
    if (args == null) {
      throw ArgumentError.notNull(
          'Unable to retrieve query information for route order details ');
    }
    final Map<String, String?> navParams = args as Map<String, String?>;

    // May throw runtime type errors on access instead of exception?
    final String clinicID = navParams['clinicID'] ?? '';
    final String orderID = navParams['orderID'] ?? '';

    if (clinicID.isEmpty || orderID.isEmpty) {
      throw const FormatException(
        'Invalid route details for order review',
      );
    }

    return ReviewHistoricalOrderScreenArguments(clinicID, orderID);
  }

  static ReviewHistoricalOrderScreenArguments? tryParse(
    Object? args,
  ) {
    try {
      return ReviewHistoricalOrderScreenArguments
          .getValidatedFromRouteParamsArgs(
        args,
      );
    } on Exception catch (_) {
      return null;
    }
  }

  /// Clinic information to reuse fresh query
  final String clinicID;

  /// Order information to load specific order query
  final String orderID;
}
