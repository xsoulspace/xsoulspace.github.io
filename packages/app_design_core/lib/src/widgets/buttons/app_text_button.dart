import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({required this.onPressed, required this.text, super.key});
  final VoidCallback onPressed;
  final String text;
  @override
  Widget build(final BuildContext context) {
    return TextButton(onPressed: onPressed, child: Text(text));
  }
}
