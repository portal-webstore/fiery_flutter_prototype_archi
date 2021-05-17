import 'package:flutter/material.dart';

/// {@template currently_adding_drugs_treatment_products_for_text_atom}
/// Give ongoing indicator of current UX state/flow when in wizard pages
///
/// Which patient are we adding a treatment product to
///
/// Do we also need to see the current number of treatment product details
/// for the current patient?
///
/// {@endtemplate}
class PatientCurrentlyAddingTreatmentProductsFor extends StatelessWidget {
  /// {@macro currently_adding_drugs_treatment_products_for_text_atom}
  const PatientCurrentlyAddingTreatmentProductsFor({
    Key? key,
    required this.patientNameText,
  }) : super(key: key);

  /// e.g. "BLOGS, Joan"
  /// "Blogs, Joan"
  /// "Joan Blogs"
  ///
  /// Up to caller
  final String patientNameText;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Text(
      'Adding treatment products for: $patientNameText',
    );
  }
}
