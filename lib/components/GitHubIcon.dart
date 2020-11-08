import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xsoulspace/constants/CustomColors.dart';
import 'package:xsoulspace/constants/PathFinder.dart';

class GitHubIcon extends StatelessWidget {
  final String gitHubLink;
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
        onTap: _launchURL,
        child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 15,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                PathFinder.iconGitHub ?? '',
                fit: BoxFit.fitHeight,
              ),
            )),
      ),
    );
  }

  _launchURL() async {
    if (await canLaunch(gitHubLink)) {
      await launch(gitHubLink);
    } else {
      throw 'Could not launch $gitHubLink';
    }
  }
}
