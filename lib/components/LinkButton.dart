import 'package:flutter/material.dart';
import 'package:xsoulspace/functions/launchURL.dart';

class LinkButton extends StatelessWidget {
  late final String? src;
  late final String? text;
  LinkButton({this.src, this.text});
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: src != null,
      child: src == null
          ? Container()
          : InkWell(
              onTap: () => launchURL(src: src),
              child: Text(
                text ?? '',
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            ),
    );
  }
}
