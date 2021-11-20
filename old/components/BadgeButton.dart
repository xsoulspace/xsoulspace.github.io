import 'package:flutter/material.dart';
import 'package:xsoulspace/functions/launchURL.dart';

class BadgeButton extends StatelessWidget {
  late final String? src;
  late final String? badgeImageSrc;
  BadgeButton({this.src, this.badgeImageSrc});
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: src != null,
      child: InkWell(
        onTap: () => launchURL(src: src ?? ''),
        child: SizedBox(
          height: 50,
          child: Image.network(
            badgeImageSrc ?? '',
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
