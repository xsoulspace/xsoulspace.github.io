import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:xsoulspace/constants/ProjectStatuses.dart';
import 'package:xsoulspace/entities/ProjectStatus.dart';

class ProjectStatusesModel extends ChangeNotifier {
  List<ProjectStatus> allStatuses = [
    ProjectStatus(
        id: 0,
        projectStatus: ProjectStatuses.released,
        statusName: 'Released projects',
        color: Colors.green),
    ProjectStatus(
      id: 1,
      projectStatus: ProjectStatuses.workInProgress,
      statusName: 'Work in progress',
      color: Colors.amber,
    ),
    ProjectStatus(
      id: 2,
      projectStatus: ProjectStatuses.planned,
      statusName: 'Planned projects',
      color: Colors.red,
    ),
  ];
  ProjectStatus getByStatus({required ProjectStatuses projectStatuses}) {
    return allStatuses
        .firstWhere((element) => element.projectStatus == projectStatuses);
  }
}
