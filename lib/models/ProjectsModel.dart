import 'package:flutter/foundation.dart';
import 'package:xsoulspace/constants/PathFinder.dart';
import 'package:xsoulspace/constants/ProjectStatuses.dart';
import 'package:xsoulspace/constants/ProjectTypes.dart';
import 'package:xsoulspace/entities/Project.dart';

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
      liveSiteLink: 'https://xsoulspace.dev/last_answer'),
  Project(
      id: 1,
      name: 'Word by Word Game offline',
      description: '''
        Word by word - is a simple, fun, self-educative and easy to play game to write word after word based on last 3 letters of last word.
      ''',
      iconAssetPath: '${PathFinder.iconAsset}icon_word_by_word_game.png',
      projectStatus: ProjectStatuses.released,
      projectType: ProjectTypes.game,
      githubLink: 'https://github.com/xsoulspace/word_by_word_game.git',
      googlePlayLink:
          'https://play.google.com/store/apps/details?id=dev.xsoulspace.word_by_word_game&pcampaignid=pcampaignidMKT-Other-global-all-co-prtnr-py-PartBadge-Mar2515-1',
      snapstoreLink: 'https://snapcraft.io/word-by-word-game',
      liveSiteLink: 'https://xsoulspace.dev/word_by_word_game'),
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
      snapstoreLink: null,
      liveSiteLink: 'https://xsoulspace.dev/sheets_manager_excel_addin'),
  Project(
      id: 3,
      name: 'VBA Sheets Concat',
      description:
          'Super fast and intelligent macro to concat Excel sheets data into one sheet',
      iconAssetPath: null,
      projectStatus: ProjectStatuses.released,
      projectType: ProjectTypes.excelVba,
      githubLink:
          'https://github.com/xsoulspace/sheets_concat_excel_vba_macro.git',
      googlePlayLink: null,
      snapstoreLink: null,
      liveSiteLink: null),
  Project(
      id: 4,
      name: 'VBA Link Checker',
      description: 'Simple macro to check web links in Excel sheet',
      iconAssetPath: null,
      projectStatus: ProjectStatuses.released,
      projectType: ProjectTypes.excelVba,
      githubLink:
          'https://github.com/xsoulspace/link_checker_excel_vba_macro.git',
      googlePlayLink: null,
      snapstoreLink: null,
      liveSiteLink: null),
  Project(
      id: 5,
      name: 'Moon Defence',
      description:
          'Shoot a droid from moon to carefully catch asteroid to protect moon settlement. This game was originally made for the Game Off Github 2020. ',
      iconAssetPath: null,
      projectStatus: ProjectStatuses.workInProgress,
      projectType: ProjectTypes.game,
      githubLink: 'https://github.com/Arenukvern/gd_moon_defence.git',
      googlePlayLink: null,
      snapstoreLink: null,
      liveSiteLink: 'https://arenukvern.itch.io/moon-defence')
];

class ProjectsModel extends ChangeNotifier {
  ProjectsModel(
      {required ProjectStatuses selectedProjectStatus,
      required ProjectTypes selectedProjectType}) {
    this._selectedProjectStatus = selectedProjectStatus;
    this._selectedProjectType = selectedProjectType;
    notifyListeners();
  }

  late ProjectStatuses _selectedProjectStatus;

  ProjectStatuses get selectedProjectStatus => _selectedProjectStatus;
  set selectedProjectStatus(ProjectStatuses aselectedProjectStatus) {
    _selectedProjectStatus = aselectedProjectStatus;
    notifyListeners();
  }

  late ProjectTypes _selectedProjectType;

  ProjectTypes get selectedProjectType => _selectedProjectType;

  set selectedProjectType(ProjectTypes aselectedProjectType) {
    _selectedProjectType = aselectedProjectType;
    notifyListeners();
  }

  bool _isProjectAcceptedByType(Project project) {
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

  List<Project> get filteredProjects {
    // groupping projects by menu name

    return allProjectsInCategory
        .where((project) => project.projectStatus == selectedProjectStatus)
        .toList();
  }

  bool getIsProjectsExists({required ProjectStatuses projectStatuses}) {
    return allProjectsInCategory
            .where((element) => element.projectStatus == projectStatuses)
            .length >
        0;
  }

  List<Project> get allProjectsInCategory {
    // groupping projects by menu name

    return allProjects
        .where((project) => _isProjectAcceptedByType(project))
        .toList();
  }

  bool _isAllProjectsInCategoryShown = true;

  bool get isAllProjectsInCategoryShown => _isAllProjectsInCategoryShown;

  set isAllProjectsInCategoryShown(bool isAllProjectsInCategoryShown) {
    _isAllProjectsInCategoryShown = isAllProjectsInCategoryShown;
    notifyListeners();
  }
}
