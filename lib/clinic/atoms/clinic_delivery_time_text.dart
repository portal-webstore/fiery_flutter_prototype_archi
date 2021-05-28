import 'package:flutter/material.dart';

class ClinicPresetDeliveryTimeText extends StatelessWidget {
  const ClinicPresetDeliveryTimeText({
    Key? key,
    required this.time,
  }) : super(key: key);

  /// @example 10:00
  /// Note earlier treatments may need to allow for another day prior delivery
  ///
  final String time;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Estimated delivery time for orders before the cut-off is $time',
    );
  }
}
