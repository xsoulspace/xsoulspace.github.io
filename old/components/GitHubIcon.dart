import 'package:flutter/material.dart';
import 'package:xsoulspace/constants/CustomColors.dart';
import 'package:xsoulspace/constants/PathFinder.dart';
import 'package:xsoulspace/functions/launchURL.dart';

class GitHubIcon extends StatelessWidget {
  late final String? gitHubLink;
  GitHubIcon({this.gitHubLink});
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: gitHubLink != null,
      child: InkWell(
        hoverColor: CustomColors.background.withOpacity(0.4),
        radius: 15,
        borderRadius: BorderRadius.circular(15),
        splashColor: CustomColors.background.withOpacity(0.4),
        onTap: () => launchURL(src: gitHubLink),
        child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 15,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                PathFinder.iconGitHub,
                fit: BoxFit.fitHeight,
              ),
            )),
      ),
    );
  }
}
