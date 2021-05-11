import 'package:flutter/material.dart';

class MenuListItemIcon extends StatelessWidget {
  const MenuListItemIcon(
    this.icon, {
    Key? key,
    this.colour,
  }) : super(key: key);

  final IconData icon;
  final Color? colour;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: colour,
    );
  }
}
