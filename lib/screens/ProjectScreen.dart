import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:xsoulspace/components/GridProjectButton.dart';
import 'package:xsoulspace/components/ProjectStatusWidget.dart';
import 'package:xsoulspace/constants/CustomColors.dart';
import 'package:xsoulspace/models/ProjectStatusesModel.dart';
import 'package:xsoulspace/models/ProjectsModel.dart';

class ProjectScreen extends StatelessWidget {
  final bool isOpen;
  ProjectScreen({required this.isOpen});
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    var projectsModel = Provider.of<ProjectsModel>(context);
    var projectStatusesModel = Provider.of<ProjectStatusesModel>(context);
    var selectedProjectStatus = projectStatusesModel.getByStatus(
        projectStatuses: projectsModel.selectedProjectStatus);

    return Container(
        padding: EdgeInsets.only(left: 10, bottom: 0.14 * _size.height, top: 5),
        decoration: BoxDecoration(
          border: isOpen
              ? Border.all(
                  color: CustomColors.primary.withOpacity(0.2),
                  width: 0.7,
                )
              : null,
          gradient: LinearGradient(
              colors: [
                isOpen
                    ? CustomColors.background.withOpacity(0.4)
                    : CustomColors.background,
                isOpen
                    ? CustomColors.background.withOpacity(0.4)
                    : CustomColors.primary,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0, 1]),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(children: [
          Row(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    ...projectStatusesModel.allStatuses.map(
                      (e) => ProjectStatusWidget(
                        enabled: projectsModel.getIsProjectsExists(
                            projectStatuses: e.projectStatus),
                        isActive: projectsModel.selectedProjectStatus ==
                                e.projectStatus &&
                            !projectsModel.isAllProjectsInCategoryShown,
                        projectStatus: e,
                        onPressed: () {
                          projectsModel.selectedProjectStatus = e.projectStatus;
                          projectsModel.isAllProjectsInCategoryShown = false;
                        },
                      ),
                    )
                  ],
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.circle,
                  color: projectsModel.isAllProjectsInCategoryShown
                      ? CustomColors.primary
                      : CustomColors.primary.withOpacity(0.4),
                ),
                tooltip: 'Show all projects',
                onPressed: () {
                  projectsModel.isAllProjectsInCategoryShown = true;
                },
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      selectedProjectStatus.statusName,
                      style:
                          TextStyle(color: CustomColors.primary, fontSize: 24),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: _size.width <= 600 || _size.height <= 600 ? 0 : 42),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: CustomColors.primary.withOpacity(0.2),
                    width: 0.7,
                  ),
                  color: CustomColors.primary.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Wrap(
                    alignment: WrapAlignment.start,
                    spacing: 35,
                    runSpacing: 35,
                    direction: Axis.horizontal,
                    children: [
                      ...(projectsModel.isAllProjectsInCategoryShown
                              ? projectsModel.allProjectsInCategory
                              : projectsModel.filteredProjects)
                          .map((e) =>
                              SizedBox(child: GridProjectButton(project: e)))
                          .toList(),
                    ]),
              ),
            ),
          ),
        ]));
  }
}
