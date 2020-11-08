import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:xsoulspace/constants/AppConstraints.dart';
import 'package:xsoulspace/constants/CustomColors.dart';
import 'package:xsoulspace/constants/ProjectStatuses.dart';
import 'package:xsoulspace/constants/ProjectTypes.dart';
import 'package:xsoulspace/models/ProjectsModel.dart';
import 'package:xsoulspace/screens/AboutScreen.dart';
import 'package:xsoulspace/screens/TeamScreen.dart';

TextStyle _textStyle = TextStyle(color: CustomColors.primary);
double leftPadding = 16.0;

class MenuDrawerComponent extends StatelessWidget {
  final Function() onClose;
  MenuDrawerComponent({@required this.onClose});
  @override
  Widget build(BuildContext context) {
    var projectsModel = Provider.of<ProjectsModel>(context);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              CustomColors.background,
              CustomColors.primary,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0, 1]),
      ),
      child: Padding(
          padding: EdgeInsets.only(left: leftPadding, bottom: 16.0),
          child: Material(
            color: Colors.transparent,
            child: Stack(children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    width: AppConstraints.menuMinWidth - leftPadding,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                            leading: Icon(Icons.table_rows),
                            title: Text(
                              'Excel Addins',
                              style: _textStyle,
                            ),
                            onTap: () {
                              projectsModel.selectedProjectType =
                                  ProjectTypes.excelAddin;
                              projectsModel.selectedProjectStatus =
                                  ProjectStatuses.workInProgress;
                              onClose();
                            }),
                        ListTile(
                            leading: Icon(Icons.apps),
                            title: Text(
                              'Applications',
                              style: _textStyle,
                            ),
                            onTap: () {
                              projectsModel.selectedProjectType =
                                  ProjectTypes.application;
                              projectsModel.selectedProjectStatus =
                                  ProjectStatuses.released;
                              onClose();
                            }),
                        ListTile(
                          leading: Icon(Icons.people),
                          title: Text(
                            'Team',
                            style: _textStyle,
                          ),
                          onTap: () => showTeamScreen(context: context),
                        ),
                        ListTile(
                          leading: Icon(Icons.info),
                          title: Text(
                            'About',
                            style: _textStyle,
                          ),
                          onTap: () => showAboutScreen(context: context),
                        )
                      ],
                    ),
                  )),
            ]),
          )),
    );
  }

  showTeamScreen({BuildContext context}) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return TeamScreen();
        });
  }

  showAboutScreen({BuildContext context}) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return AboutScreen();
        });
  }
}
