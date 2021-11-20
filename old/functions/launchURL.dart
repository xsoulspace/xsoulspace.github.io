import 'package:url_launcher/url_launcher.dart';

void launchURL({String? src}) async {
  var link = src ?? '';
  if (await canLaunch(link)) {
    await launch(link);
  } else {
    throw 'Could not launch $link';
  }
}
