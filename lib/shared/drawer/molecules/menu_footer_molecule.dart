import 'package:fiery_flutter_prototype_archi/shared/app_info/app_info_text.dart'
    show FutureBuildAppInfoText;
import 'package:flutter/material.dart'
    show BuildContext, Key, ListTile, StatelessWidget, Widget;

class MenuFooter extends StatelessWidget {
  const MenuFooter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      title: FutureBuildAppInfoText(),
    );
  }
}
