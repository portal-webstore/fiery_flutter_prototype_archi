import 'package:fiery_flutter_prototype_archi/shared/drawer/atoms/atoms.dart'
    show MenuHeaderTitle, menuHeaderHeroImageDecoration;
import 'package:fiery_flutter_prototype_archi/shared/drawer/atoms/padding.dart'
    show paddingTwo;
import 'package:flutter/material.dart'
    show
        BuildContext,
        DrawerHeader,
        EdgeInsets,
        Key,
        Positioned,
        Stack,
        StatelessWidget,
        Widget;

class MenuHeader extends StatelessWidget {
  const MenuHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: menuHeaderHeroImageDecoration,
      child: Stack(
        children: const <Widget>[
          Positioned(
            bottom: paddingTwo,
            left: paddingTwo,
            child: MenuHeaderTitle(
              title: 'Webstore',
            ),
          )
        ],
      ),
    );
  }
}
