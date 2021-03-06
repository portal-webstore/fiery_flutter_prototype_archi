import 'package:flutter/material.dart';

class MenuHeaderTitle extends StatelessWidget {
  const MenuHeaderTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
