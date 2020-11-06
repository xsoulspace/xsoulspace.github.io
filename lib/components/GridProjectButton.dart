import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:xsoulspace/entities/Project.dart';

class GridProjectButton extends StatefulWidget {
  final Project project;
  GridProjectButton({@required this.project});
  @override
  _GridProjectButtonState createState() =>
      _GridProjectButtonState(this.project);
}

class _GridProjectButtonState extends State<GridProjectButton> {
  final Project project;
  _GridProjectButtonState(this.project);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(30),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      color: Colors.white.withOpacity(0.9),
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // TODO: replace to feature graphic
            ListTile(
              leading: project.iconAssetPath != null
                  ? CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 20,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          project.iconAssetPath,
                          width: 70.0,
                          height: 70.0,
                          fit: BoxFit.fitHeight,
                        ),
                      ))
                  : Container(),
              title: Text(project.name),
            ),
          ],
        ),
      ),
    );
  }
}
