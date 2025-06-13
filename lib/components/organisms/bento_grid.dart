import 'package:jaspr/jaspr.dart';

import '../atoms/badges.dart';
import '../models/project_model.dart';
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
  /// {@macro bento_grid}
  const BentoGrid({required this.projects, super.key});

  final List<ProjectModel> projects;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final projectGroups = _groupProjectsByCategory(projects);

    yield div(classes: 'bento-grid', [
      for (final group in projectGroups) _buildProjectGroup(group),
    ]);
  }

  List<ProjectGroup> _groupProjectsByCategory(List<ProjectModel> projects) {
    final groups = <String, List<ProjectModel>>{};

    for (final project in projects) {
      final category = _categorizeProject(project);
      groups.putIfAbsent(category, () => []).add(project);
    }

    return [
      if (groups.containsKey('Apps & Bots'))
        ProjectGroup(
          title: 'Apps & Bots',
          subtitle: 'Interactive applications and automation',
          icon: '📱',
          accentColor: '#E07A5F', // terracotta
          projects: groups['Apps & Bots']!,
        ),
      if (groups.containsKey('Games'))
        ProjectGroup(
          title: 'Games',
          subtitle: 'Interactive entertainment and challenges',
          icon: '🎮',
          accentColor: '#D4756B', // warm-coral
          projects: groups['Games']!,
        ),
      if (groups.containsKey('Libraries & Utilities'))
        ProjectGroup(
          title: 'Libraries & Utilities',
          subtitle: 'Development tools and reusable packages',
          icon: '🔧',
          accentColor: '#81B29A', // sage-glaze
          projects: groups['Libraries & Utilities']!,
        ),
      if (groups.containsKey('Office & Excel'))
        ProjectGroup(
          title: 'Office & Excel',
          subtitle: 'Productivity and business tools',
          icon: '📊',
          accentColor: '#F2CC8F', // sandstone
          projects: groups['Office & Excel']!,
        ),
    ];
  }

  String _categorizeProject(ProjectModel project) {
    final type = project.type.toLowerCase();

    if (type == 'game') return 'Games';
    if (type == 'app' || type == 'bot') return 'Apps & Bots';
    if (type == 'package' || type == 'utility') return 'Libraries & Utilities';
    if (type == 'web add-in' ||
        type.contains('excel') ||
        type.contains('office')) {
      return 'Office & Excel';
    }

    // Default fallback
    return 'Libraries & Utilities';
  }

  Component _buildProjectGroup(ProjectGroup group) {
    return section(classes: 'project-group', [
      // Group header
      header(classes: 'project-group__header', [
        div(classes: 'project-group__title-section', [
          span(classes: 'project-group__icon', [text(group.icon)]),
          div(classes: 'project-group__title-content', [
            h2(classes: 'project-group__title', [text(group.title)]),
            p(classes: 'project-group__subtitle', [text(group.subtitle)]),
          ]),
        ]),
        span(classes: 'project-group__count', [
          text('${group.projects.length} projects'),
        ]),
      ]),

      // Projects grid
      div(classes: 'project-group__grid', [
        for (final project in group.projects)
          ProjectCard(
            project: project,
            size: ProjectCardSize.fromProject(project),
          ),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    // Main grid container
    css('.bento-grid').styles(
      raw: const {
        'display': 'flex',
        'flex-direction': 'column',
        'gap': '3rem',
        'padding': '2rem',
        'max-width': '1400px',
        'margin': '0 auto',
      },
    ),

    // Project group section
    css('.project-group').styles(
      raw: const {
        'background-color': '#FAF6F0', // unglazed-bisque background
        'border-radius': '1rem',
        'padding': '2rem',
        'position': 'relative',
        'overflow': 'hidden',
      },
    ),

    // Group header
    css('.project-group__header').styles(
      raw: const {
        'display': 'flex',
        'align-items': 'center',
        'justify-content': 'space-between',
        'margin-bottom': '2rem',
        'padding-bottom': '1rem',
        'border-bottom': '2px solid #EDE7DD',
      },
    ),

    css('.project-group__title-section').styles(
      raw: const {'display': 'flex', 'align-items': 'center', 'gap': '1rem'},
    ),

    css(
      '.project-group__icon',
    ).styles(raw: const {'font-size': '2.5rem', 'line-height': '1'}),

    css('.project-group__title-content').styles(
      raw: const {
        'display': 'flex',
        'flex-direction': 'column',
        'gap': '0.25rem',
      },
    ),

    css('.project-group__title').styles(
      raw: const {
        'font-size': '1.75rem',
        'font-weight': '600',
        'color': '#4E342E', // earthy-brown
        'margin': '0',
        'line-height': '1.2',
      },
    ),

    css('.project-group__subtitle').styles(
      raw: const {
        'font-size': '1rem',
        'font-weight': '400',
        'color': '#6B4E3D', // warm-umber
        'margin': '0',
        'line-height': '1.4',
      },
    ),

    css('.project-group__count').styles(
      raw: const {
        'font-size': '0.875rem',
        'font-weight': '500',
        'color': '#8B7355', // muted-taupe
        'background-color': '#EDE7DD', // soft-clay
        'padding': '0.5rem 1rem',
        'border-radius': '2rem',
        'white-space': 'nowrap',
      },
    ),

    // Projects grid within each group
    css('.project-group__grid').styles(
      raw: const {
        'display': 'grid',
        'gap': '1.5rem',
        'grid-template-columns': 'repeat(auto-fit, minmax(280px, 1fr))',
        'grid-auto-rows': 'minmax(220px, auto)',
      },
    ),

    // Responsive breakpoints
    css.media(MediaQuery.screen(minWidth: 768.px), [
      css(
        '.project-group__grid',
      ).styles(raw: const {'grid-template-columns': 'repeat(2, 1fr)'}),
    ]),

    css.media(MediaQuery.screen(minWidth: 1024.px), [
      css(
        '.project-group__grid',
      ).styles(raw: const {'grid-template-columns': 'repeat(3, 1fr)'}),
    ]),

    css.media(MediaQuery.screen(minWidth: 1280.px), [
      css(
        '.project-group__grid',
      ).styles(raw: const {'grid-template-columns': 'repeat(4, 1fr)'}),
    ]),

    // Mobile responsive
    css.media(MediaQuery.screen(maxWidth: 767.px), [
      css('.bento-grid').styles(raw: const {'padding': '1rem', 'gap': '2rem'}),

      css('.project-group').styles(raw: const {'padding': '1.5rem'}),

      css('.project-group__header').styles(
        raw: const {
          'flex-direction': 'column',
          'align-items': 'flex-start',
          'gap': '1rem',
        },
      ),

      css(
        '.project-group__grid',
      ).styles(raw: const {'grid-template-columns': '1fr', 'gap': '1rem'}),
    ]),

    // Visual enhancements with texture
    css('.project-group::before').styles(
      raw: const {
        'content': '""',
        'position': 'absolute',
        'top': '0',
        'left': '0',
        'right': '0',
        'height': '4px',
        'background':
            'linear-gradient(90deg, #E07A5F 0%, #81B29A 50%, #F2CC8F 100%)',
        'border-radius': '1rem 1rem 0 0',
      },
    ),

    // Subtle paper texture overlay
    css('.project-group::after').styles(
      raw: const {
        'content': '""',
        'position': 'absolute',
        'top': '0',
        'left': '0',
        'right': '0',
        'bottom': '0',
        'background-image': '''
        radial-gradient(circle at 25% 25%, rgba(139, 115, 85, 0.02) 1px, transparent 1px),
        radial-gradient(circle at 75% 75%, rgba(107, 78, 61, 0.015) 1px, transparent 1px)
      ''',
        'background-size': '20px 20px, 30px 30px',
        'pointer-events': 'none',
        'border-radius': '1rem',
      },
    ),
  ];
}

/// Represents a group of projects organized by category
class ProjectGroup {
  const ProjectGroup({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.accentColor,
    required this.projects,
  });

  final String title;
  final String subtitle;
  final String icon;
  final String accentColor;
  final List<ProjectModel> projects;
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
