import 'package:jaspr/jaspr.dart';
import 'package:xsoulspace_web/components/models/bento_block_model.dart';
import 'package:xsoulspace_web/components/molecules/accent_card.dart';

import '../atoms/badges.dart';
import '../molecules/project_card.dart';
import '../molecules/section_header.dart';

/// Bento grid organism for responsive project layout
/// Enhanced grid system with ceramic-inspired organization

class BentoGridSection {
  const BentoGridSection({
    required this.title,
    required this.projects,
    this.subtitle,
    this.icon,
    this.categoryType,
  });

  final String title;
  final List<ProjectCard> projects;
  final String? subtitle;
  final String? icon;
  final CategoryType? categoryType;
}

/// True Bento Grid implementation following Japanese bento box principles
/// Uses CSS grid-template-areas for asymmetrical brick-like layouts
class BentoGrid extends StatelessComponent {
  const BentoGrid({required this.blocks, super.key});

  final List<BentoBlock> blocks;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'bento-grid', [
      for (final block in blocks)
        div(styles: _getGridItemStyles(block), [
          if (block.type == BentoBlockType.project)
            ProjectCard(project: block.project!)
          else
            AccentCard(accent: block.accent!),
        ]),
    ]);
  }

  Styles _getGridItemStyles(BentoBlock block) {
    final colSpan = block.project?.colSpan ?? block.accent?.colSpan ?? 1;
    final rowSpan = block.project?.rowSpan ?? block.accent?.rowSpan ?? 1;

    return Styles.raw({
      'grid-column': 'span $colSpan',
      'grid-row': 'span $rowSpan',
    });
  }

  @css
  static List<StyleRule> get styles => [
    css('.bento-grid').styles(
      raw: const {
        'display': 'grid',
        'grid-template-columns': 'repeat(4, 1fr)',
        'gap': '1.5rem',
      },
    ),
  ];
}

class ResponsiveBentoGrid extends StatelessComponent {
  const ResponsiveBentoGrid({
    required this.sections,
    this.breakpoints = const {
      'mobile': 1,
      'tablet': 2,
      'desktop': 3,
      'large': 4,
    },
    super.key,
  });

  final List<BentoGridSection> sections;
  final Map<String, int> breakpoints;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final breakpointClasses = breakpoints.entries
        .map((e) => '${e.key}-cols-${e.value}')
        .join(' ');

    yield div([
      for (final section in sections) ...[
        CategorySection(
          title: section.title,
          subtitle: section.subtitle,
          count: section.projects.length,
          icon: section.icon,
          categoryType: section.categoryType,
          children: [
            div([
              for (final project in section.projects) project,
            ], classes: 'responsive-grid $breakpointClasses'),
          ],
        ),
      ],
    ], classes: 'responsive-bento-grid');
  }
}

class DynamicBentoGrid extends StatelessComponent {
  const DynamicBentoGrid({
    required this.sections,
    this.maxColumns = 4,
    this.minCardWidth = 300,
    super.key,
  });

  final List<BentoGridSection> sections;
  final int maxColumns;
  final int minCardWidth;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div([
      for (final section in sections) ...[
        CategorySection(
          title: section.title,
          subtitle: section.subtitle,
          count: section.projects.length,
          icon: section.icon,
          categoryType: section.categoryType,
          children: [
            div([
              for (final project in section.projects) project,
            ], classes: 'dynamic-grid'),
          ],
        ),
      ],
    ], classes: 'dynamic-bento-grid');
  }
}

class FeaturedBentoLayout extends StatelessComponent {
  const FeaturedBentoLayout({
    required this.featuredProject,
    required this.regularProjects,
    this.title = 'Featured Projects',
    super.key,
  });

  final ProjectCard featuredProject;
  final List<ProjectCard> regularProjects;
  final String title;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div([
      SectionHeader(
        title: title,
        count: regularProjects.length + 1,
        icon: '⭐',
        accent: 'accent-featured',
      ),

      div([
        // Featured project takes prominent position
        div([featuredProject], classes: 'featured-area'),

        // Regular projects in grid
        div([
          for (final project in regularProjects) project,
        ], classes: 'regular-grid'),
      ], classes: 'featured-bento-layout'),
    ], classes: 'featured-bento-container');
  }
}
