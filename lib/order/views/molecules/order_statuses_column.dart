/// List order statuses
///
/// Predicated on the most restrictive item found in an order.
/// i.e. if any cancelled or awaiting confirmation or pending
/// Then whole order status^
///
/// 1. PENDING_REVIEW // Not relevant?
/// 2. REVIEWED
/// 3. IN_MANUFACTURE
/// 4. QUALITY_RELEASED
/// 5. SHIPPED
/// ---
/// AWAITING_CONFIRMATION
/// CANCELLED
///
