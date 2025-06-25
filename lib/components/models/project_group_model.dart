import 'bento_block_model.dart';

/// Represents a group of projects organized by category
class ProjectGroup {
  const ProjectGroup({
    required this.anchor,
    required this.title,
    required this.icon,
    required this.accentColor,
    required this.blocks,
  });

  final String anchor;
  final String title;
  final String icon;
  final String accentColor;
  final List<BentoBlock> blocks;
}
