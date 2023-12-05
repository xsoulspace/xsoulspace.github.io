import 'package:url_launcher/url_launcher_string.dart' as url_launcher_string;

Future<void> launchPrivacyPolicy() async {
  await url_launcher_string.launchUrlString(
    'https://github.com/xsoulspace/xsoulspace.github.io/blob/master/PRIVACY_POLICY.md',
    // 'https://raw.githubusercontent.com/xsoulspace/xsoulspace.github.io/master/PRIVACY_POLICY.md',
  );
}
