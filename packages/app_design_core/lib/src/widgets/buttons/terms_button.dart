import 'package:url_launcher/url_launcher_string.dart' as url_launcher_string;

Future<void> launchTermsAndConditions() async {
  await url_launcher_string.launchUrlString(
    'https://github.com/xsoulspace/xsoulspace.github.io/blob/master/TERMS_AND_CONDITIONS.md',
  );
}
