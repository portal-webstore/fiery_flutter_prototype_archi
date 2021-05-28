/// Rather than screaming CAPS + underscores to users.
String getStatusCodeViewModelText(String code) {
  switch (code) {
    case ItemOrderStatusCode.cancelled:
      return ItemOrderStatusText.cancelled;
    case ItemOrderStatusCode.awaitingConfirmation:
      return ItemOrderStatusText.awaitingConfirmation;

    case ItemOrderStatusCode.pendingReviewNotReviewedYet:
      return ItemOrderStatusText.pendingReviewNotReviewedYet;

    case ItemOrderStatusCode.reviewed:
      // First stage reviewed + in-manufacture both coalesce to 'in manufacture'
      return ItemOrderStatusText.reviewed;
    case ItemOrderStatusCode.inManufacture:

      // First stage reviewed + in-manufacture both coalesce to 'in manufacture'
      return ItemOrderStatusText.inManufacture;

    case ItemOrderStatusCode.qualityReleased:

      /// First stage release + shipped coalesced to **shipped**.
      return ItemOrderStatusText.qualityReleased;
    case ItemOrderStatusCode.shippedDispatched:

      /// First stage release + shipped coalesced to shipped.
      return ItemOrderStatusText.shippedDispatched;

    default:
      return 'Pending review';
  }
}

class ItemOrderStatusCode {
  const ItemOrderStatusCode._();

  /// Cancelled
  static const String cancelled = 'CANCELLED';

  /// Item held back in advance order awaiting confirmation closer to the
  /// treatment date for go-ahead
  static const String awaitingConfirmation = 'AWAITING_CONFIRMATION';
  static const String pendingReviewNotReviewedYet = 'NOT_REVIEWED';

  /// Onco processed reviewed/manufacture on OCS print
  static const String reviewed = 'REVIEWED';

  /// Onco processed reviewed/manufacture on OCS print
  static const String inManufacture = 'IN_MANUFACTURE';

  /// Released/Shipped
  static const String qualityReleased = 'QUALITY_RELEASED';

  /// Released/Shipped
  static const String shippedDispatched = 'SHIPPED';
}

class ItemOrderStatusText {
  const ItemOrderStatusText._();

  static const String cancelled = 'Cancelled';

  /// Item held back in advance order awaiting confirmation closer to the
  /// treatment date for go-ahead
  static const String awaitingConfirmation = 'Awaiting confirmation';
  static const String pendingReviewNotReviewedYet = 'Pending review';
  static const String reviewed = 'Reviewed';
  static const String inManufacture = 'In manufacture';
  static const String qualityReleased = 'Quality-released';
  static const String shippedDispatched = 'Shipped';
}
