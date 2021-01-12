import 'package:flutter/material.dart';
import 'package:xsoulspace/constants/CustomColors.dart';
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
          : Material(
              borderRadius: BorderRadius.circular(4.0),
              color: CustomColors.primary,
              child: InkWell(
                borderRadius: BorderRadius.circular(4.0),
                focusColor: CustomColors.background.withOpacity(0.5),
                splashColor: CustomColors.background.withOpacity(0.4),
                onTap: () => launchURL(src: src),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  child: Text(
                    text ?? '',
                  ),
                ),
              ),
            ),
    );
  }
}
