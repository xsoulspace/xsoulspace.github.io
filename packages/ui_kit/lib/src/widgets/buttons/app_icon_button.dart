import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart' as url_launcher_string;

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    required this.icon,
    required this.onPressed,
    super.key,
  });
  factory AppIconButton.url({
    required final Widget icon,
    required final String url,
    final Key? key,
  }) =>
      AppIconButton(
        icon: icon,
        onPressed: () async => url_launcher_string.canLaunchUrlString(url),
        key: key,
      );
  final Widget icon;
  final VoidCallback onPressed;
  @override
  Widget build(final BuildContext context) => TextButton(
        onPressed: onPressed,
        child: icon,
      );
}
