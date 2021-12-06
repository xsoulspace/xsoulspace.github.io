import 'package:xsoulspace/constants/ProjectStatuses.dart';
import 'package:xsoulspace/constants/ProjectTypes.dart';

class Project {
  late final int id;
  late final String name;
  late final String description;
  late final ProjectStatuses projectStatus;
  late final ProjectTypes projectType;
  late final String? iconAssetPath;
  late final String? githubLink;
  late final String? snapstoreLink;
  late final String? googlePlayLink;
  late final String? liveSiteLink;
  Project(
      {required this.id,
      required this.name,
      required this.description,
      required this.projectStatus,
      required this.projectType,
      required this.iconAssetPath,
      required this.githubLink,
      required this.snapstoreLink,
      required this.googlePlayLink,
      required this.liveSiteLink});
}
