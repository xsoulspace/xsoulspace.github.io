import 'package:jaspr/jaspr.dart';

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

class BentoGrid extends StatelessComponent {
  const BentoGrid({required this.sections, this.responsive = true, super.key});

  final List<BentoGridSection> sections;
  final bool responsive;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final classes = [
      'bento-grid',
      if (responsive) 'bento-responsive',
    ].join(' ');

    yield div([
      for (final section in sections) ...[
        CategorySection(
          title: section.title,
          subtitle: section.subtitle,
          count: section.projects.length,
          icon: section.icon,
          categoryType: section.categoryType,
          children: [_buildProjectGrid(section.projects)],
        ),
      ],
    ], classes: classes);
  }

  Component _buildProjectGrid(List<ProjectCard> projects) {
    return div([
      for (final project in projects) project,
    ], classes: 'bento-section-grid');
  }
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
