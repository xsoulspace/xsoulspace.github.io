import 'package:flutter/widgets.dart';
import 'package:xsoulspace/constants/ProjectStatuses.dart';

class ProjectStatus {
  final int id;
  final ProjectStatuses projectStatus;
  final String statusName;
  final Color color;
  ProjectStatus(
      {@required this.id,
      @required this.projectStatus,
      @required this.statusName,
      @required this.color});
}
