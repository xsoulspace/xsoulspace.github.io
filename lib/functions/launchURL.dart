import 'package:url_launcher/url_launcher.dart';

void launchURL({String src}) async {
  if (await canLaunch(src)) {
    await launch(src);
  } else {
    throw 'Could not launch $src';
  }
}
