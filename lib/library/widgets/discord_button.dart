part of widgets;

Future<void> launchDiscordLink() async {
  await launchURL('https://discord.gg/y54DpJwmAn');
}

class DiscordButton extends StatelessWidget {
  const DiscordButton({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return CupertinoButton(
      minSize: 0,
      padding: EdgeInsets.zero,
      onPressed: launchDiscordLink,
      child: Assets.icons.discordLogoBlack.svg(
        width: 22,
        height: 22,
      ),
    );
  }
}
