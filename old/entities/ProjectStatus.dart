import 'package:flutter/widgets.dart';
import 'package:xsoulspace/constants/ProjectStatuses.dart';

class ProjectStatus {
  late final int id;
  late final ProjectStatuses projectStatus;
  late final String statusName;
  late final Color color;
  ProjectStatus(
      {required this.id,
      required this.projectStatus,
      required this.statusName,
      required this.color});
}
