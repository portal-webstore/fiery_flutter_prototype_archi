import 'package:fiery_flutter_prototype_archi/order/review_historical_order/molecules/patient_treatment_product_item_description.dart'
    show PatientTreatmentProductItemDescription;
import 'package:flutter/material.dart';
import 'package:order_repository/order_repository.dart'
    show ItemOrderStatusCode, ItemOrderStatusText, getStatusCodeViewModelText;

class PatientTreatmentProductListItem extends StatelessWidget {
  const PatientTreatmentProductListItem({
    Key? key,
    required this.treatmentProductStatusCode,
    required this.patientNameTitleLine,
    required this.multiProductAndQuantityContentLines,
  }) : super(key: key);

  /// Code only so we can evaluate the logic inside this item.
  /// Handle the admin interface within this widget for fun and profit.
  /// Pass out the code status back out - for data logic and not presentation
  /// (if it was used for presentation then we have an even bigger design issue)
  /// For reusing the same status code to viewmodel text function in parent and
  /// callee
  final String treatmentProductStatusCode;
  final String patientNameTitleLine;
  final String multiProductAndQuantityContentLines;

  @override
  Widget build(BuildContext context) {
    final String? undoStatusCode = getUndoStatusCode(
      treatmentProductStatusCode,
    );

    final bool isStatusCodeSteppable = isValidAdminStatusCodeAdjustableTickable(
      treatmentProductStatusCode,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        /// There is no cheap auto row fit to dynamic content.
        /// SizedBox fixed height is the Flutter way to do it.
        /// IntrinsicHeight is performance-heavy
        /// ? Potentially count the number of lines and calc height?
        /// Though uncertain performance copmarison of build calc vs intrinsic
        height: 120,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Status

            AspectRatio(
              aspectRatio: 1.0,
              child: Text(
                getStatusCodeViewModelText(treatmentProductStatusCode),
              ),
            ),

            if (isStatusCodeSteppable)
              ElevatedButton(
                onPressed: () {
                  /// Do callback to update firestore snapshot for single docID.prop

                  // We could pass in the next status code on button press.
                  // Trigger update callback from smart parent firestore to
                  // progress the item to the next status
                },
                // Could make a static "list" of colours or objects for standard
                // statuses.

                child: Text(
                  'Step to next status: '
                  '${getNextStatusCodeForAdminToTick(treatmentProductStatusCode)}',
                ),
              )
            else
              Container(),

            if (undoStatusCode != null)
              ElevatedButton(
                onPressed: () {
                  /// Trigger undo callback from smart parent firestore
                },
                child: Text(
                  'Undo back to previous status: ${getStatusCodeViewModelText(
                    undoStatusCode,
                  )}',
                ),
              )
            else
              Container(),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 2.0, 0.0),
                child: PatientTreatmentProductItemDescription(
                  patientNameTitleLine: patientNameTitleLine,
                  multiProductAndQuantityContentLines:
                      multiProductAndQuantityContentLines,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

/// Check current status of the treatment product to see if we can progress it
bool isValidAdminStatusCodeAdjustableTickable(
  String code,
) {
  switch (code) {
    // We could rely on switch-case fall-through... Riskier for minimal reason
    // awaiting (clinic) -> pending (admin) -> manufacture (admin) -> shipped
    case ItemOrderStatusCode.pendingReviewNotReviewedYet:
      // -> Reviewed/In-manufacture
      return true;
    case ItemOrderStatusCode.inManufacture:
      // in-manufacture -> quality-released/shipped
      return true;
    default:
      return false;
  }
}

/// Going backwards
String? getUndoStatusCode(
  String code,
) {
  switch (code) {
    case ItemOrderStatusCode.inManufacture:
      // We skip back straight to pending review mode
      // OCS integration update should be automatic with intermediary steps
      // and therefore no longer needs this interface anyway.

      // Might have been nicer to encapsulate business logic in separate API endpoint
      // microservice decoupled without requiring app update
      // call `.next()`

      return ItemOrderStatusCode.pendingReviewNotReviewedYet;

    case ItemOrderStatusCode.shippedDispatched:
      return ItemOrderStatusCode.inManufacture;
    default:
      return null;
  }
}

/// The 'no admin' text codes should not show up if we guarded correctly.
///
/// We could add checkers for each instance to consume cycles all up until we take it away in the next update...
/// True safeguarding would mean checking at the data security rules layer
/// Otherwise network requests could still bypass
///
/// We use both this text switch case + bool isAdminTickable for more informative debugging
///
/// Otherwise we can accommodate with an optional String and take null as false
/// and valid String as the happy path logic
String getNextStatusCodeForAdminToTick(
  String code,
) {
  switch (code) {
    case ItemOrderStatusCode.cancelled:

      // No change. Clinic controlled finalised the cancel.
      return 'Cancelled. No admin';
    case ItemOrderStatusCode.awaitingConfirmation:

      // Clinic control. Not admin adjustable.
      return 'Awaiting clinic. No admin';

    case ItemOrderStatusCode.pendingReviewNotReviewedYet:
      // We review it and mark as reviewed / in manufacture
      // First stage reviewed + in-manufacture both coalesce to 'in manufacture'
      return ItemOrderStatusText.inManufacture;
    case ItemOrderStatusCode.reviewed:
      // Unused. We skip past reviewed straight to inManufacture.
      return 'Should be -> Manufacture. No admin';
    case ItemOrderStatusCode.inManufacture:
      return ItemOrderStatusText.shippedDispatched;
    case ItemOrderStatusCode.qualityReleased:

      /// Unused. Should skip straight to shipped.
      return 'Should be -> Shipped. No admin';
    case ItemOrderStatusCode.shippedDispatched:

    // Workflow finished. No more statuses

    default:
      return 'Unknown / Pending review';
  }
}

/// If we want to theme specific widgets in the future statically...
/// Otherwise unused
Text getStatusCodeTextWidget(
  String code,
) {
  switch (code) {
    case ItemOrderStatusCode.cancelled:
      return const Text(
        ItemOrderStatusText.cancelled,
      );
    case ItemOrderStatusCode.awaitingConfirmation:
      return const Text(
        ItemOrderStatusText.awaitingConfirmation,
      );

    case ItemOrderStatusCode.pendingReviewNotReviewedYet:
      return const Text(
        ItemOrderStatusText.pendingReviewNotReviewedYet,
      );

    case ItemOrderStatusCode.reviewed:
      // First stage reviewed + in-manufacture both coalesce to 'in manufacture'
      return const Text(
        ItemOrderStatusText.reviewed,
      );
    case ItemOrderStatusCode.inManufacture:

      // First stage reviewed + in-manufacture both coalesce to 'in manufacture'
      return const Text(
        ItemOrderStatusText.inManufacture,
      );

    case ItemOrderStatusCode.qualityReleased:

      /// First stage release + shipped coalesced to **shipped**.
      return const Text(
        ItemOrderStatusText.qualityReleased,
      );
    case ItemOrderStatusCode.shippedDispatched:

      /// First stage release + shipped coalesced to shipped.
      return const Text(
        ItemOrderStatusText.shippedDispatched,
      );

    default:
      return const Text(
        'Unknown / Pending review',
      );
  }
}
