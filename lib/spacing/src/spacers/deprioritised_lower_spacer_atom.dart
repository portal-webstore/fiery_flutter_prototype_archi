import 'package:fiery_flutter_prototype_archi/account/atoms/spacing.dart';
import 'package:flutter/material.dart'
    show BuildContext, Key, SizedBox, StatelessWidget, Widget;

class DeprioritisedLowerSpacer extends StatelessWidget {
  const DeprioritisedLowerSpacer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: Spacing.sizeSmall,
    );
  }
}
