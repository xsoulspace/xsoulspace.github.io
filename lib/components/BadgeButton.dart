import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BadgeButton extends StatelessWidget {
  final String src;
  final String badgeImageSrc;
  BadgeButton({this.src, this.badgeImageSrc});
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: src != null,
      child: InkWell(
        onTap: _launchURL,
        child: SizedBox(
          height: 50,
          child: Image.network(
            badgeImageSrc,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  _launchURL() async {
    if (await canLaunch(src)) {
      await launch(src);
    } else {
      throw 'Could not launch $src';
    }
  }
}
