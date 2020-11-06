import 'package:flutter/widgets.dart';
import 'package:xsoulspace/constants/ProjectStatuses.dart';
import 'package:xsoulspace/constants/ProjectTypes.dart';

class Project {
  final int id;
  final String name;
  final String description;
  final String iconAssetPath;
  final String githubLink;
  final String snapstoreLink;
  final String googlePlayLink;
  final ProjectStatuses projectStatus;
  final ProjectTypes projectType;
  Project(
      {@required this.id,
      @required this.name,
      @required this.description,
      @required this.projectStatus,
      this.iconAssetPath,
      this.githubLink,
      this.snapstoreLink,
      this.googlePlayLink,
      @required this.projectType});
}
