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
      description: ''' 
      A tool to solve problems complexity and thoughts understanding during project management and just to make easier each other ideas sharing & understanding.
      ''',
      iconAssetPath: '${PathFinder.iconAsset}icon_last_answer.png',
      projectStatus: ProjectStatuses.released,
      projectType: ProjectTypes.application,
      githubLink: 'https://github.com/xsoulspace/last_answer',
      googlePlayLink:
          'https://play.google.com/store/apps/details?id=dev.xsoulspace.lastanswer&pcampaignid=pcampaignidMKT-Other-global-all-co-prtnr-py-PartBadge-Mar2515-1',
      snapstoreLink: 'https://snapcraft.io/last-answer',
    ),
    Project(
      id: 1,
      name: 'Word by Word Game offline',
      description: '''
        Word by word - is a simple, fun, self-educative and easy to play game to write word after word based on last 3 letters of last word.
      ''',
      iconAssetPath: '${PathFinder.iconAsset}icon_word_by_word_game.png',
      projectStatus: ProjectStatuses.released,
      projectType: ProjectTypes.game,
      githubLink: 'https://github.com/xsoulspace/word_by_word_game',
      googlePlayLink:
          'https://play.google.com/store/apps/details?id=dev.xsoulspace.word_by_word_game&pcampaignid=pcampaignidMKT-Other-global-all-co-prtnr-py-PartBadge-Mar2515-1',
      snapstoreLink: 'https://snapcraft.io/word-by-word-game',
    ),
    Project(
        id: 2,
        name: 'Sheets Manager',
        description: 'Web Addin for easier Excel sheets management',
        iconAssetPath: null,
        projectStatus: ProjectStatuses.workInProgress,
        projectType: ProjectTypes.excelAddin,
        githubLink:
            'https://github.com/xsoulspace/sheets_manager_excel_addin.git',
        googlePlayLink: null,
        snapstoreLink: null)
    // TODO: add sheets concat project
    // TODO: add link checker project
  ];
  ProjectStatuses _selectedProjectStatus;

  ProjectStatuses get selectedProjectStatus => _selectedProjectStatus;
  set selectedProjectStatus(ProjectStatuses aselectedProjectStatus) {
    _selectedProjectStatus = aselectedProjectStatus;
    notifyListeners();
  }

  ProjectTypes _selectedProjectType;

  ProjectTypes get selectedProjectType => _selectedProjectType;

  set selectedProjectType(ProjectTypes aselectedProjectType) {
    _selectedProjectType = aselectedProjectType;
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
