/// {@template routes}
/// Static routes paths.
///
///
/// {@endtemplate}
/// See {@macro route_generator}
class Routes {
  /// "Static" class for namespacing
  const Routes._();

  static const String home = '/';
  static const String signUp = '/account/sign-up';
  static const String login = '/account/login';

  /// Show recent orders and orders that contain items AWAITING_CONFIRMATION?
  ///
  /// Minimalistic dashboard..
  ///
  static const String dashboard = '/dashboard';

  /// Searchable sortable filterable by order reference, timestamp, overallStatus
  /// only.
  ///
  /// We may only retain the last month anyway
  static const String orderHistory = '/order-history';

  static const String reviewSubmittedHistoricalOrder =
      '/review-submitted-order';

  /// Entry point for new orders.
  /// Draft order may reuse start from review-add-choice page as landing instead.
  static const String wizardCreateOrder = '/order/create';

  /// No granular edit. Draft order main purpose is to build up over time
  /// Potentially allow draft to remove patient and add again
  /// Lots of edge cases like what if only want to remove one item from a patient
  ///
  /// This is where we choose whether to add an existing clinic-patient or
  ///
  ///
  /// Do async debounce typeahead search by patient identifier-only first.
  /// Reduce query costs.
  ///
  ///
  /// Otherwise allow adding a structured free-text ad hoc patient.
  ///
  static const String wizardAddPatient = '/order/add-patient';

  /// Can add multiple treatment products to the same patient.
  /// Must be added to a patient
  ///
  /// Async debounce from existing products first
  ///
  /// Note that debounce will be at least 500ms wait after keystroke
  ///
  ///
  /// Otherwise allow adding a structured hard-coded dropdowns for free-text
  /// ad hoc patient addition.
  static const String wizardAddTreatmentProductItem =
      '/order/add-treatment-product-item';

  /// Review page as the landing page and finalisation page to continue or complete
  ///
  /// Choices navigator
  ///
  /// Decision priority
  /// 1. Add another treatment product to the same patient
  /// 2. Add another patient to the order
  /// 3. Go to order summary review screen
  ///
  /// Review to either save as draft or submit the complete order
  /// after conscientious review
  static const String wizardReviewAddChoice = '/order/review-add-more';

  /// Save to draft or submit complete order.
  static const String wizardReviewComplete = '/order/review-save-submit';

  /// - ADMIN:
  static const String searchClinic = '/manufacturing/search-clinic';
}
