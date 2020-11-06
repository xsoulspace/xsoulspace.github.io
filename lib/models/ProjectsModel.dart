import 'package:flutter/foundation.dart';
import 'package:xsoulspace/constants/PathFinder.dart';
import 'package:xsoulspace/constants/ProjectStatuses.dart';
import 'package:xsoulspace/constants/ProjectTypes.dart';
import 'package:xsoulspace/entities/Project.dart';

class ProjectsModel extends ChangeNotifier {
  ProjectsModel(
      {@required ProjectStatuses selectedProjectStatus,
      @required ProjectTypes selectedProjectType}) {
    this._selectedProjectStatus = selectedProjectStatus;
    this._selectedProjectType = selectedProjectType;
    notifyListeners();
  }
  List<Project> allProjects = [
    Project(
      id: 0,
      name: 'Last Answer',
      // TODO: add description
      description: '',
      iconAssetPath: '${PathFinder.iconAsset}icon_last_answer.png',
      projectStatus: ProjectStatuses.released,
      projectType: ProjectTypes.application,
      githubLink: 'https://github.com/xsoulspace/last_answer',
      googlePlayLink:
          'https://play.google.com/store/apps/details?id=dev.xsoulspace.lastanswer&pcampaignid=pcampaignidMKT-Other-global-all-co-prtnr-py-PartBadge-Mar2515-1',
    ),
    Project(
      id: 1,
      name: 'Word by Word Game offline',
      // TODO: add description
      description: '',
      iconAssetPath: '${PathFinder.iconAsset}icon_word_by_word_game.png',
      projectStatus: ProjectStatuses.released,
      projectType: ProjectTypes.game,
      githubLink: 'https://github.com/xsoulspace/word_by_word_game',
      googlePlayLink:
          'https://play.google.com/store/apps/details?id=dev.xsoulspace.word_by_word_game&pcampaignid=pcampaignidMKT-Other-global-all-co-prtnr-py-PartBadge-Mar2515-1',
    ),
    Project(
      id: 2,
      name: 'Sheets Manager',
      // TODO: add description
      description: '',
      projectStatus: ProjectStatuses.workInProgress,
      projectType: ProjectTypes.excelAddin,
    )
    // TODO: add sheets concat
    // TODO: add link checker
  ];
  ProjectStatuses _selectedProjectStatus;

  ProjectStatuses get selectedProjectStatus => _selectedProjectStatus;
  set selectedProjectStatus(ProjectStatuses selectedProjectStatus) {
    _selectedProjectStatus = selectedProjectStatus;
    notifyListeners();
  }

  ProjectTypes _selectedProjectType;

  ProjectTypes get selectedProjectType => _selectedProjectType;

  set selectedProjectType(ProjectTypes selectedProjectType) {
    _selectedProjectType = selectedProjectType;
    notifyListeners();
  }

  List<Project> get filteredProjects {
    // groupping projects by menu name
    _isProjectAccepted(Project project) {
      List<ProjectTypes> _checkingProjectTypes = (() {
        switch (selectedProjectType) {
          case ProjectTypes.excelAddin:
          case ProjectTypes.excelVba:
            return [ProjectTypes.excelAddin, ProjectTypes.excelVba];
          case ProjectTypes.application:
          case ProjectTypes.game:
            return [ProjectTypes.application, ProjectTypes.game];
        }
      })();
      for (var projectType in _checkingProjectTypes) {
        if (project.projectType == projectType) return true;
      }
      return false;
    }

    return allProjects
        .where((project) =>
            _isProjectAccepted(project) &&
            project.projectStatus == selectedProjectStatus)
        .toList();
  }

  bool getIsProjectsExists({@required ProjectStatuses projectStatuses}) {
    return allProjects
            .where((element) =>
                element.projectType == selectedProjectType &&
                element.projectStatus == projectStatuses)
            .length >
        0;
  }
}
