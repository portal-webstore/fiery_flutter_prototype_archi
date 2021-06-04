import 'package:flutter/material.dart';

/// Order cut-off time for processing and subsequent manufacturing
/// To make it to the next business day by the preset delivery time
///
/// Next-day delivery
///
/// Also note expiries logici
/// Mon-Thu are processing days
/// de-risk Friday to Sunday expiry
///
/// Also public holidays.
///
/// and off by two.
class ClinicDeliveryTimeDisclaimerText extends StatelessWidget {
  const ClinicDeliveryTimeDisclaimerText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'For orders where treatment time is before the expected delivery time, '
      'please allow an additional business day '
      'before placing your order',
    );
  }
}
