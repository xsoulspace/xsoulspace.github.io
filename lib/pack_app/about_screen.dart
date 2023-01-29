import 'package:app_design_core/app_design_core.dart';
import 'package:flutter/material.dart';

void showAboutScreenDialog(final BuildContext context) {
  showAboutDialog(
    context: context,
    applicationName: 'XSoulSpace.io',
    applicationVersion: '3.0.0',
    children: [
      const AboutScreen(),
    ],
  );
}

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: const [
        SizedBox(height: 30),
        Text(
          "First of all - welcome and thank you for visiting xsoulspace. \n\nI'm Anton, software engineer and enthusiast with a hope to make useful apps with Flutter | Dart | Vue | Typescript.",
        ),
        SizedBox(height: 30),
        TextButton(
          onPressed: launchDiscordLink,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'To stay in touch - say hello in Discord',
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(height: 10),
        TextButton(
          onPressed: launchEmail,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'or contact me via email: anton@xsoulspace.dev',
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(height: 30),
        SelectableText(
          'Have a nice day!',
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
