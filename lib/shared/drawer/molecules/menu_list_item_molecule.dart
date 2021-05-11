import 'package:fiery_flutter_prototype_archi/shared/drawer/atoms/atoms.dart'
    show MenuListItemIcon, MenuListItemTitle, menuListItemLeftLeadingPadding;
import 'package:flutter/material.dart';

class MenuListItem extends StatelessWidget {
  const MenuListItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.iconColour,
    this.itemTitleStyle,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final GestureTapCallback onTap;
  final Color? iconColour;
  final TextStyle? itemTitleStyle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: <Widget>[
          MenuListItemIcon(
            icon,
            colour: iconColour,
          ),
          Padding(
            padding: menuListItemLeftLeadingPadding,
            child: MenuListItemTitle(
              title,
              titleStyle: itemTitleStyle,
            ),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
