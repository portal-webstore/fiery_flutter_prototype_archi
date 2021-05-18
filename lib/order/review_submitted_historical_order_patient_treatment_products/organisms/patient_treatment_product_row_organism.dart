import 'package:flutter/material.dart';
import 'package:order_repository/order_repository.dart';

import '../molecules/patient_treatment_product_list_item.dart';

/// Use our data model and place into the strings of listItem
class PatientTreatmentProductRow extends StatelessWidget {
  const PatientTreatmentProductRow({
    Key? key,
    required this.patientTreatmentProductItem,
  }) : super(key: key);

  final PatientTreatmentProductItem patientTreatmentProductItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _orderStatusReviewedChecked(),
        _orderStatusShippedChecked(),
        _patientTreated(),
        _treatmentProductItemsForPatient(),

        /// Should only have multiple treatments under this whole patient row.
        /// Do not redeclare the title?
        /// Depending on grouping whether it would require another conversion
        ///
        PatientTreatmentProductListItem(
          treatmentProductStatusCode: patientTreatmentProductItem.status,
          patientNameTitleLine: 'McBlogs, Joan (1293123)',
          multiProductAndQuantityContentLines:
              '1prod Test, test test test tet test setestset es tsets \n'
              '2prod adae in dextr test test test',
        ),
      ],
    );
  }
}

Widget _patientTreated() {
  return const ListTile(
    title: Text('McBlogs, Joan'),
  );
}

/// At least one
/// or more
/// Most patients with one product
///
/// Seen patients with four products with varying quantities
/// i.e. initial loading dose + maintenance doses per day
Widget _treatmentProductItemsForPatient() {
  return const ListTile(
    title: Text(''),
  );
}

/// TWP Manufacturing would only have input IN_MANUFACTURE then SHIPPED
///
/// Clinic customer would only start with either awaiting confirmation (clinic),
/// cancelled or PENDING_REVIEW (NOT_REVIEWED)
///
/// Makes sense not to have a dropdown for this
/// Unless we wanted affordance for workarounds.
///
/// Will the reintegratino concurrency be an issue with multiple processing
/// technicians?
///
/// best to only check forward rather than allowing regressions/updates in those cases then
///
/// This should potentially be in a separate codebase / package for admin use
///
/// Firestore rules should block order_status strict literals?
///
Widget _orderStatusReviewedChecked() {
  return Checkbox(
      value: // Load from builder of the patient treatment products .status
          false,
      onChanged: (isChecked) {
        /// Update Firestore model through repository?
      });
}

Widget _orderStatusShippedChecked() {
  return Checkbox(
      // Load from builder of the patient treatment products .status
      value: false,
      onChanged: (isChecked) {
        /// Update Firestore model through repository?
      });
}
