import 'package:flutter/material.dart';

/// Note elevated button primary use case in login screen.
/// Requires onPressed.
class LoginButton extends StatelessWidget {
  const LoginButton({Key? key, required this.onPressed}) : super(key: key);
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: const Key('loginForm_continue_raisedButton'),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        primary: const Color(0xFFFFD600),
      ),
      onPressed: onPressed,
      child: const Text('LOGIN'),
    );
  }
}
