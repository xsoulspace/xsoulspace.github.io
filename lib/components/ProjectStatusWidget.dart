import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:xsoulspace/entities/ProjectStatus.dart';

class ProjectStatusWidget extends StatelessWidget {
  final Function() onPressed;
  final ProjectStatus projectStatus;
  final bool enabled;
  final bool isActive;
  ProjectStatusWidget(
      {@required this.onPressed,
      @required this.projectStatus,
      this.enabled = true,
      @required this.isActive});
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: enabled,
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: SizedBox(
          width: 20,
          height: 20,
          child: Tooltip(
            message: 'Show ${projectStatus.statusName}',
            child: FlatButton(
              color: isActive
                  ? projectStatus.color
                  : projectStatus.color.withOpacity(0.3),
              child: Container(),
              onPressed: onPressed,
              shape: CircleBorder(),
            ),
          ),
        ),
      ),
    );
  }
}
