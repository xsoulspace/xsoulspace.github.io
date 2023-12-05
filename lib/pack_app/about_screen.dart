import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

void showAboutScreenDialog(final BuildContext context) {
  showAboutDialog(
    context: context,
    applicationName: 'XSoulSpace.dev',
    applicationVersion: '3.0.0',
    children: [
      const AboutScreen(),
    ],
  );
}

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(final BuildContext context) => const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 30),
          Text(
            "Hi! Welcome and thank you for visiting xsoulspace.dev. \n\nI'm Anton, self-taught, inspired by a technology and usability software engineer.\n\nIn my free time, I'm building applications with the hope to call them useful in everyday routine and also build fun games:)\nMany of my projects are open source, so you can find them here: https://github.com/xsoulspace\n\nHope you find some of the apps and content useful for you:)",
          ),
          SizedBox(height: 30),
          TextButton(
            onPressed: launchDiscordLink,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
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
              padding: EdgeInsets.symmetric(vertical: 8),
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
