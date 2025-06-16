import 'bento_block_model.dart';

/// Represents a group of projects organized by category
class ProjectGroup {
  const ProjectGroup({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.accentColor,
    required this.blocks,
    this.layoutType,
  });

  final String title;
  final String subtitle;
  final String icon;
  final String accentColor;
  final List<BentoBlock> blocks;
  final String? layoutType;
}
