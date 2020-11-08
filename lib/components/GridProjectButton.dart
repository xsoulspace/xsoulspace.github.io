import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:xsoulspace/components/BadgeButton.dart';
import 'package:xsoulspace/components/GitHubIcon.dart';
import 'package:xsoulspace/components/LinkButton.dart';
import 'package:xsoulspace/constants/PathFinder.dart';
import 'package:xsoulspace/entities/Project.dart';

class GridProjectButton extends StatelessWidget {
  final Project project;
  GridProjectButton({@required this.project});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: Container(
        padding: EdgeInsets.all(2.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Material(
              color: Colors.transparent,
              child: ListTile(
                  leading: project.iconAssetPath != null
                      ? CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 15,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              project.iconAssetPath ?? '',
                              fit: BoxFit.fitHeight,
                            ),
                          ))
                      : null,
                  title: Text(
                    project.name,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.left,
                    maxLines: 2,
                  ),
                  trailing: GitHubIcon(
                    gitHubLink: project.githubLink,
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              // direction: Axis.horizontal,
              children: [
                Flexible(
                  flex: 4,
                  child: Text(
                    project.description,
                    softWrap: true,
                    textAlign: TextAlign.justify,
                  ),
                ),
                Flexible(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.only(left: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          LinkButton(
                            src: project.liveSiteLink,
                            text: 'Live',
                          ),
                          BadgeButton(
                            badgeImageSrc: PathFinder.googlePlayBadge,
                            src: project.googlePlayLink,
                          ),
                          BadgeButton(
                            badgeImageSrc: PathFinder.snapstoreBadge,
                            src: project.snapstoreLink,
                          ),
                        ],
                      ),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
