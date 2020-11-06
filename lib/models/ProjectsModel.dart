import 'package:flutter/foundation.dart';
import 'package:xsoulspace/constants/ProjectStatuses.dart';
import 'package:xsoulspace/constants/ProjectTypes.dart';
import 'package:xsoulspace/entities/Project.dart';

class ProjectsModel extends ChangeNotifier {
  List<Project> allProjects = [
    Project(
      id: 0,
      name: 'Last Answer',
      // TODO: add description
      description: '',
      projectStatus: ProjectStatuses.released,
      projectType: ProjectTypes.application,
      githubLink: 'https://github.com/xsoulspace/last_answer',
      googlePlayLink:
          'https://play.google.com/store/apps/details?id=dev.xsoulspace.lastanswer&pcampaignid=pcampaignidMKT-Other-global-all-co-prtnr-py-PartBadge-Mar2515-1',
    ),
    Project(
      id: 1,
      name: 'Word by Word game offline',
      // TODO: add description
      description: '',
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
      projectType: ProjectTypes.application,
    )
    // TODO: add sheets concat
    // TODO: add link checker
  ];
  ProjectStatuses _selectedProjectStatus = ProjectStatuses.planned;

  ProjectStatuses get selectedProjectStatus => _selectedProjectStatus;
  set selectedProjectStatus(ProjectStatuses selectedProjectStatus) {
    _selectedProjectStatus = selectedProjectStatus;
    notifyListeners();
  }

  ProjectTypes _selectedProjectType = ProjectTypes.application;

  ProjectTypes get selectedProjectType => _selectedProjectType;

  set selectedProjectType(ProjectTypes selectedProjectType) {
    _selectedProjectType = selectedProjectType;
    notifyListeners();
  }

  List<Project> get filteredProjects {
    return allProjects.where((project) =>
        project.projectStatus == selectedProjectStatus &&
        project.projectType == selectedProjectType);
  }

  bool getIsProjectsExists({@required ProjectStatuses projectStatue}) {
    return allProjects
            .where((element) =>
                element.projectType == selectedProjectType &&
                element.projectStatus == projectStatue)
            .length >
        0;
  }
}
