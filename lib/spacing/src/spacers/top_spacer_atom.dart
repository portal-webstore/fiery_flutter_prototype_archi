import 'package:fiery_flutter_prototype_archi/spacing/src/spacing.dart'
    show Spacing;
import 'package:flutter/material.dart'
    show BuildContext, Key, SizedBox, StatelessWidget, Widget;

class TopSpacer extends StatelessWidget {
  const TopSpacer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: Spacing.sizeLarge,
    );
  }
}
