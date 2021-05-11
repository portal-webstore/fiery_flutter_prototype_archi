import 'package:flutter/material.dart';

class MenuListItemTitle extends StatelessWidget {
  const MenuListItemTitle(
    this.title, {
    Key? key,
    this.titleStyle,
  }) : super(key: key);

  final String title;
  final TextStyle? titleStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: titleStyle,
    );
  }
}
