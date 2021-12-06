part of pack_app;

Future<void> launchEmail() async {
  await launchURL(
    'mailto:anton@xsoulspace.dev?subject=hello_xsoulspace&body=Hey!',
  );
}

class AboutScreen extends StatelessWidget {
  const AboutScreen({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Column(
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
        )
      ],
    );
  }
}
