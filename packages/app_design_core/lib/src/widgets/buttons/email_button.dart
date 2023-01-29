import 'package:url_launcher/url_launcher_string.dart' as url_launcher_string;

Future<void> launchEmail() async {
  await url_launcher_string.launchUrlString(
    'mailto:anton@xsoulspace.dev?subject=hello_xsoulspace&body=Hey!',
  );
}
