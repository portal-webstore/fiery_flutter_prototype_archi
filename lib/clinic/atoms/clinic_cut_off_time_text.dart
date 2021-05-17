import 'package:flutter/material.dart';

/// Order cut-off time for processing and subsequent manufacturing
/// To make it to the next business day by the preset delivery time
class ClinicPresetCutOffTimeText extends StatelessWidget {
  const ClinicPresetCutOffTimeText({
    Key? key,
    required this.time,
  }) : super(key: key);

  final String time;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Please make sure to note the order cut-off time: $time',
    );
  }
}
