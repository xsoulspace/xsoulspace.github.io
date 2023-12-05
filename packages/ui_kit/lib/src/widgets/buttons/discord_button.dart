import 'package:url_launcher/url_launcher_string.dart' as url_launcher_string;

const kDiscordUrl = 'https://discord.gg/y54DpJwmAn';

Future<void> launchDiscordLink() async {
  await url_launcher_string.launchUrlString(kDiscordUrl);
}
