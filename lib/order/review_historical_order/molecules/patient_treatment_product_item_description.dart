import 'package:flutter/material.dart';

/// Single patient title
/// -- each treatment product item has doses per drug--
///
/// Only use the concatenated product name rather than drug doses.
/// Simplicity of text display
///
/// multiple product item descriptions with a quantity
///

class PatientTreatmentProductItemDescription extends StatelessWidget {
  const PatientTreatmentProductItemDescription({
    Key? key,
    required this.patientNameTitleLine,
    required this.multiProductAndQuantityContentLines,
  }) : super(key: key);

  final String patientNameTitleLine;
  final String multiProductAndQuantityContentLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                patientNameTitleLine,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 2.0)),
              Text(
                multiProductAndQuantityContentLines,
                maxLines: 6,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
