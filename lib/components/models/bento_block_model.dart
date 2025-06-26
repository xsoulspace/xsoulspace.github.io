import 'package:xsoulspace_web/components/models/project_model.dart';

enum BentoBlockType { project, accent }

class BentoBlock {
  const BentoBlock({this.project, this.accent})
    : assert(
        (project != null && accent == null) ||
            (project == null && accent != null),
        'Exactly one of project or accent must be provided.',
      );

  final ProjectModel? project;
  final AccentBlock? accent;

  BentoBlockType get type =>
      project != null ? BentoBlockType.project : BentoBlockType.accent;
}

class AccentBlock {
  const AccentBlock({
    required this.title,
    this.subtitle,
    this.backgroundColor,
    this.imageUrl,
    this.colSpan = 1,
    this.rowSpan = 1,
  });

  final String title;
  final String? subtitle;
  final String? backgroundColor;
  final String? imageUrl;
  final int colSpan;
  final int rowSpan;
}
