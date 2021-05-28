import 'package:flutter/material.dart';

class PatientIdentifierText extends StatelessWidget {
  const PatientIdentifierText({
    Key? key,
    required this.patientIdentifier,
  }) : super(key: key);

  final String patientIdentifier;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Text(
      'Patient identifier: $patientIdentifier',
    );
  }
}
