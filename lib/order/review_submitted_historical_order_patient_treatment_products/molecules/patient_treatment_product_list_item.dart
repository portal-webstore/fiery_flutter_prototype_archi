import 'package:fiery_flutter_prototype_archi/order/review_submitted_historical_order_patient_treatment_products/molecules/patient_treatment_product_item_description.dart'
    show PatientTreatmentProductItemDescription;
import 'package:flutter/material.dart';

class PatientTreatmentProductListItem extends StatelessWidget {
  const PatientTreatmentProductListItem({
    Key? key,
    required this.treatmentProductStatus,
    required this.patientNameTitleLine,
    required this.multiProductAndQuantityContentLines,
  }) : super(key: key);

  final String treatmentProductStatus;
  final String patientNameTitleLine;
  final String multiProductAndQuantityContentLines;

  @override
  Widget build(BuildContext context) {
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
              child: Text(treatmentProductStatus),
            ),
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
