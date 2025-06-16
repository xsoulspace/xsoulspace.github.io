import 'package:jaspr/jaspr.dart';
import 'package:xsoulspace_web/components/models/bento_block_model.dart';
import 'package:xsoulspace_web/components/molecules/accent_card.dart';

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

/// True Bento Grid implementation following Japanese bento box principles
/// Uses CSS grid-template-areas for asymmetrical brick-like layouts
class BentoGrid extends StatelessComponent {
  const BentoGrid({required this.projects, super.key});

  final List<ProjectModel> projects;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final projectGroups = _groupProjectsByCategory(projects);

    yield div(classes: 'bento-grid', [
      for (final group in projectGroups) _buildBentoSection(group),
    ]);
  }

  List<ProjectGroup> _groupProjectsByCategory(List<ProjectModel> projects) {
    final groups = <String, List<BentoBlock>>{};

    // Convert all projects to BentoBlocks
    for (final project in projects) {
      final category = _categorizeProject(project);
      groups.putIfAbsent(category, () => []).add(BentoBlock(project: project));
    }

    // Manually inject Accent Blocks into the desired category
    final gamesCategory = 'Apps, Bots & Games';
    if (groups.containsKey(gamesCategory)) {
      groups[gamesCategory]!.insertAll(
        1, // Insert after the first project
        [
          BentoBlock(
            accent: AccentBlock(
              title: 'Health',
              backgroundColor: '#4A5C6A', // Dark slate blue
              size: ProjectSize.standard,
            ),
          ),
          BentoBlock(
            accent: AccentBlock(
              title: 'Learn & Play',
              backgroundColor: '#B48A6E', // Muted earth tone
              size: ProjectSize.standard,
            ),
          ),
        ],
      );
    }

    return [
      if (groups.containsKey('Apps, Bots & Games'))
        ProjectGroup(
          title: 'Apps, Bots & Games',
          subtitle: 'Interactive applications, games, and automation',
          icon: '🎲',
          accentColor: '#E07A5F', // terracotta
          blocks: groups['Apps, Bots & Games']!,
        ),
      if (groups.containsKey('Dart & Flutter packages'))
        ProjectGroup(
          title: 'Dart & Flutter packages',
          subtitle: 'Development tools and reusable packages',
          icon: '🔧',
          accentColor: '#81B29A', // sage-glaze
          blocks: groups['Dart & Flutter packages']!,
        ),
      if (groups.containsKey('Office & Excel'))
        ProjectGroup(
          title: 'Office & Excel',
          subtitle: 'Productivity and business tools',
          icon: '📊',
          accentColor: '#F2CC8F', // sandstone
          blocks: groups['Office & Excel']!,
        ),
    ];
  }

  String _categorizeProject(ProjectModel project) {
    final type = project.type.toLowerCase();

    if (type == 'game' || type == 'app' || type == 'bot') {
      return 'Apps, Bots & Games';
    }
    if (type == 'package' || type == 'utility') {
      return 'Dart & Flutter packages';
    }
    if (type == 'web add-in' ||
        type.contains('excel') ||
        type.contains('office')) {
      return 'Office & Excel';
    }

    // Default fallback
    return 'Dart & Flutter packages';
  }

  Component _buildBentoSection(ProjectGroup group) {
    final sectionId = group.title
        .toLowerCase()
        .replaceAll(', ', '-')
        .replaceAll(' & ', '-')
        .replaceAll(' ', '-');

    return section(classes: 'bento-section', id: sectionId, [
      // Group header with visual identity
      header(classes: 'bento-section__header', [
        div(classes: 'bento-section__title-area', [
          span(classes: 'bento-section__icon', [text(group.icon)]),
          div(classes: 'bento-section__text', [
            h2(classes: 'bento-section__title', [text(group.title)]),
            p(classes: 'bento-section__subtitle', [text(group.subtitle)]),
          ]),
        ]),
        span(classes: 'bento-section__count', [text('${group.blocks.length}')]),
      ]),

      // True bento grid with asymmetrical layout
      _buildAsymmetricalBentoGrid(group.blocks, group.accentColor),
    ]);
  }

  Component _buildAsymmetricalBentoGrid(
    List<BentoBlock> blocks,
    String accentColor,
  ) {
    if (blocks.isEmpty) {
      return div(classes: 'bento-grid__empty', [
        p([text('No items available')]),
      ]);
    }

    // Sort projects by size preference for optimal placement
    final sortedBlocks = [...blocks];
    sortedBlocks.sort((a, b) {
      final aSize = a.project?.preferredSize ?? a.accent!.size;
      final bSize = b.project?.preferredSize ?? b.accent!.size;

      // Featured projects first, then standard, then micro
      if (aSize.isFeatured && !bSize.isFeatured) return -1;
      if (!aSize.isFeatured && bSize.isFeatured) return 1;
      if (aSize.isStandard && bSize.isMicro) return -1;
      if (aSize.isMicro && bSize.isStandard) return 1;
      return 0;
    });

    // Generate truly asymmetrical grid areas based on project count and types
    final gridAreas = _generateAsymmetricalBentoAreas(sortedBlocks);
    final layoutClass = _getLayoutClass(sortedBlocks.length);

    return div(classes: 'bento-grid__container bento-layout--$layoutClass', [
      for (int i = 0; i < sortedBlocks.length && i < gridAreas.length; i++)
        div(
          classes:
              'bento-grid__item ${_getSizeClass(sortedBlocks[i])} bento-area--${gridAreas[i]}',
          [
            if (sortedBlocks[i].type == BentoBlockType.project)
              ProjectCard(
                project: sortedBlocks[i].project!,
                size: ProjectCardSize.fromProject(sortedBlocks[i].project!),
              )
            else
              AccentCard(accent: sortedBlocks[i].accent!),
          ],
        ),
    ]);
  }

  String _getSizeClass(BentoBlock block) {
    final size = block.project?.preferredSize ?? block.accent!.size;
    if (size.isFeatured) return 'bento-featured';
    if (size.isStandard) return 'bento-standard';
    return 'bento-micro';
  }

  String _getLayoutClass(int projectCount) {
    if (projectCount <= 2) return 'tiny';
    if (projectCount <= 4) return 'small';
    if (projectCount <= 6) return 'medium';
    if (projectCount <= 9) return 'large';
    return 'xl';
  }

  List<String> _generateAsymmetricalBentoAreas(List<BentoBlock> blocks) {
    // Generate truly asymmetrical layouts inspired by the ASCII art
    // These layouts create "brick wall" patterns with varied box sizes

    final count = blocks.length;

    if (count <= 2) {
      return ['hero-wide', 'sidebar-tall'];
    } else if (count <= 4) {
      return ['hero-square', 'tower-right', 'brick-left', 'brick-right'];
    } else if (count <= 6) {
      return [
        'hero-wide', // Large featured item (like "World by Word" in ASCII)
        'sidebar-top', // Medium item (like "Daily Budget Planner")
        'sidebar-mid', // Standard item (like "Health")
        'brick-quad-a', // Small items arranged in quad
        'brick-quad-b',
        'brick-quad-c',
      ];
    } else if (count <= 9) {
      return [
        'hero-featured', // Main hero area
        'tower-vertical', // Vertical tower
        'wide-banner', // Horizontal banner
        'cluster-a', // Micro cluster
        'cluster-b',
        'cluster-c',
        'accent-tall', // Accent vertical
        'accent-wide', // Accent horizontal
        'corner-small', // Corner piece
      ];
    } else {
      // For larger collections, create organic brick-like patterns
      final baseAreas = [
        'hero-primary',
        'tower-main',
        'wide-primary',
        'brick-a1',
        'brick-a2',
        'brick-a3',
        'cluster-left',
        'cluster-center',
        'cluster-right',
        'accent-vertical',
        'accent-square',
        'accent-horizontal',
        'corner-tl',
        'corner-tr',
        'corner-bl',
        'side-left',
        'side-right',
        'footer-wide',
      ];

      final areas = <String>[];
      for (int i = 0; i < blocks.length; i++) {
        areas.add(baseAreas[i % baseAreas.length]);
      }
      return areas;
    }
  }

  @css
  static List<StyleRule> get styles => [
    // Main bento grid container
    css('.bento-grid').styles(
      raw: const {
        'display': 'flex',
        'flex-direction': 'column',
        'gap': '4rem',
        'padding': '2rem',
        'max-width': '1600px',
        'margin': '0 auto',
      },
    ),

    // Bento section with warm paper background
    css('.bento-section').styles(
      raw: const {
        'background': 'linear-gradient(135deg, #FAF6F0 0%, #F5F1EB 100%)',
        'border-radius': '1.5rem',
        'padding': '2.5rem',
        'position': 'relative',
        'overflow': 'hidden',
        'box-shadow': '0 8px 32px rgba(78, 52, 46, 0.1)',
      },
    ),

    // Section header styling
    css('.bento-section__header').styles(
      raw: const {
        'display': 'flex',
        'align-items': 'center',
        'justify-content': 'space-between',
        'margin-bottom': '2.5rem',
        'padding-bottom': '1.5rem',
        'border-bottom': '3px solid #EDE7DD',
      },
    ),

    css('.bento-section__title-area').styles(
      raw: const {'display': 'flex', 'align-items': 'center', 'gap': '1.5rem'},
    ),

    css('.bento-section__icon').styles(
      raw: const {
        'font-size': '3rem',
        'line-height': '1',
        'filter': 'drop-shadow(0 2px 4px rgba(78, 52, 46, 0.1))',
      },
    ),

    css('.bento-section__text').styles(
      raw: const {
        'display': 'flex',
        'flex-direction': 'column',
        'gap': '0.5rem',
      },
    ),

    css('.bento-section__title').styles(
      raw: const {
        'font-size': '2rem',
        'font-weight': '600',
        'color': '#4E342E',
        'margin': '0',
        'line-height': '1.2',
        'letter-spacing': '-0.02em',
      },
    ),

    css('.bento-section__subtitle').styles(
      raw: const {
        'font-size': '1.125rem',
        'font-weight': '400',
        'color': '#6B4E3D',
        'margin': '0',
        'line-height': '1.4',
      },
    ),

    css('.bento-section__count').styles(
      raw: const {
        'background': 'linear-gradient(135deg, #EDE7DD 0%, #D4C4B0 100%)',
        'color': '#4E342E',
        'padding': '0.75rem 1.5rem',
        'border-radius': '2rem',
        'font-weight': '600',
        'font-size': '1rem',
        'box-shadow': 'inset 0 1px 3px rgba(78, 52, 46, 0.1)',
      },
    ),

    // Base bento grid container with flexible layouts
    css('.bento-grid__container').styles(
      raw: const {
        'display': 'grid',
        'gap': '1.5rem',
        'grid-auto-rows': 'minmax(200px, auto)',
      },
    ),

    // Layout variations based on project count (brick-like patterns)

    // Tiny layout (1-2 items)
    css('.bento-layout--tiny').styles(
      raw: const {
        'grid-template-columns': 'repeat(3, 1fr)',
        'grid-template-areas': '''
          "hero-wide hero-wide sidebar-tall"
          "hero-wide hero-wide sidebar-tall"
        ''',
      },
    ),

    // Small layout (3-4 items)
    css('.bento-layout--small').styles(
      raw: const {
        'grid-template-columns': 'repeat(4, 1fr)',
        'grid-template-areas': '''
          "hero-square hero-square tower-right tower-right"
          "hero-square hero-square tower-right tower-right"
          "brick-left brick-right tower-right tower-right"
        ''',
      },
    ),

    // Medium layout (5-6 items) - matches ASCII art pattern
    css('.bento-layout--medium').styles(
      raw: const {
        'grid-template-columns': 'repeat(6, 1fr)',
        'grid-template-areas': '''
          "sidebar-top sidebar-top hero-wide hero-wide hero-wide sidebar-mid"
          "sidebar-top sidebar-top hero-wide hero-wide hero-wide sidebar-mid"
          "brick-quad-a brick-quad-a hero-wide hero-wide hero-wide brick-quad-b"
          "brick-quad-c brick-quad-c . . . brick-quad-b"
        ''',
      },
    ),

    // Large layout (7-9 items) - complex asymmetrical
    css('.bento-layout--large').styles(
      raw: const {
        'grid-template-columns': 'repeat(8, 1fr)',
        'grid-template-areas': '''
          "hero-featured hero-featured hero-featured hero-featured tower-vertical wide-banner wide-banner wide-banner"
          "hero-featured hero-featured hero-featured hero-featured tower-vertical cluster-a cluster-b cluster-c"
          "accent-tall accent-tall accent-wide accent-wide tower-vertical cluster-a cluster-b cluster-c"
          "accent-tall accent-tall accent-wide accent-wide corner-small cluster-a cluster-b cluster-c"
        ''',
      },
    ),

    // Extra large layout (10+ items) - organic brick wall
    css('.bento-layout--xl').styles(
      raw: const {
        'grid-template-columns': 'repeat(10, 1fr)',
        'grid-template-areas': '''
          "hero-primary hero-primary hero-primary hero-primary hero-primary tower-main wide-primary wide-primary wide-primary corner-tl corner-tr"
          "hero-primary hero-primary hero-primary hero-primary hero-primary tower-main cluster-left cluster-center cluster-right corner-tl corner-tr"
          "brick-a1 brick-a2 brick-a3 accent-vertical accent-vertical tower-main cluster-left cluster-center cluster-right side-left side-right"
          "brick-a1 brick-a2 brick-a3 accent-square accent-square accent-horizontal accent-horizontal footer-wide footer-wide footer-wide corner-bl corner-bl"
        ''',
      },
    ),

    // Individual grid area assignments for all layouts
    css('.bento-area--hero-wide').styles(raw: const {'grid-area': 'hero-wide'}),
    css(
      '.bento-area--sidebar-tall',
    ).styles(raw: const {'grid-area': 'sidebar-tall'}),
    css(
      '.bento-area--hero-square',
    ).styles(raw: const {'grid-area': 'hero-square'}),
    css(
      '.bento-area--tower-right',
    ).styles(raw: const {'grid-area': 'tower-right'}),
    css(
      '.bento-area--brick-left',
    ).styles(raw: const {'grid-area': 'brick-left'}),
    css(
      '.bento-area--brick-right',
    ).styles(raw: const {'grid-area': 'brick-right'}),
    css(
      '.bento-area--sidebar-top',
    ).styles(raw: const {'grid-area': 'sidebar-top'}),
    css(
      '.bento-area--sidebar-mid',
    ).styles(raw: const {'grid-area': 'sidebar-mid'}),
    css(
      '.bento-area--brick-quad-a',
    ).styles(raw: const {'grid-area': 'brick-quad-a'}),
    css(
      '.bento-area--brick-quad-b',
    ).styles(raw: const {'grid-area': 'brick-quad-b'}),
    css(
      '.bento-area--brick-quad-c',
    ).styles(raw: const {'grid-area': 'brick-quad-c'}),
    css(
      '.bento-area--hero-featured',
    ).styles(raw: const {'grid-area': 'hero-featured'}),
    css(
      '.bento-area--tower-vertical',
    ).styles(raw: const {'grid-area': 'tower-vertical'}),
    css(
      '.bento-area--wide-banner',
    ).styles(raw: const {'grid-area': 'wide-banner'}),
    css('.bento-area--cluster-a').styles(raw: const {'grid-area': 'cluster-a'}),
    css('.bento-area--cluster-b').styles(raw: const {'grid-area': 'cluster-b'}),
    css('.bento-area--cluster-c').styles(raw: const {'grid-area': 'cluster-c'}),
    css(
      '.bento-area--accent-tall',
    ).styles(raw: const {'grid-area': 'accent-tall'}),
    css(
      '.bento-area--accent-wide',
    ).styles(raw: const {'grid-area': 'accent-wide'}),
    css(
      '.bento-area--corner-small',
    ).styles(raw: const {'grid-area': 'corner-small'}),

    // XL layout areas
    css(
      '.bento-area--hero-primary',
    ).styles(raw: const {'grid-area': 'hero-primary'}),
    css(
      '.bento-area--tower-main',
    ).styles(raw: const {'grid-area': 'tower-main'}),
    css(
      '.bento-area--wide-primary',
    ).styles(raw: const {'grid-area': 'wide-primary'}),
    css('.bento-area--brick-a1').styles(raw: const {'grid-area': 'brick-a1'}),
    css('.bento-area--brick-a2').styles(raw: const {'grid-area': 'brick-a2'}),
    css('.bento-area--brick-a3').styles(raw: const {'grid-area': 'brick-a3'}),
    css(
      '.bento-area--cluster-left',
    ).styles(raw: const {'grid-area': 'cluster-left'}),
    css(
      '.bento-area--cluster-center',
    ).styles(raw: const {'grid-area': 'cluster-center'}),
    css(
      '.bento-area--cluster-right',
    ).styles(raw: const {'grid-area': 'cluster-right'}),
    css(
      '.bento-area--accent-vertical',
    ).styles(raw: const {'grid-area': 'accent-vertical'}),
    css(
      '.bento-area--accent-square',
    ).styles(raw: const {'grid-area': 'accent-square'}),
    css(
      '.bento-area--accent-horizontal',
    ).styles(raw: const {'grid-area': 'accent-horizontal'}),
    css('.bento-area--corner-tl').styles(raw: const {'grid-area': 'corner-tl'}),
    css('.bento-area--corner-tr').styles(raw: const {'grid-area': 'corner-tr'}),
    css('.bento-area--corner-bl').styles(raw: const {'grid-area': 'corner-bl'}),
    css('.bento-area--side-left').styles(raw: const {'grid-area': 'side-left'}),
    css(
      '.bento-area--side-right',
    ).styles(raw: const {'grid-area': 'side-right'}),
    css(
      '.bento-area--footer-wide',
    ).styles(raw: const {'grid-area': 'footer-wide'}),

    // Bento item size variants with different aspect ratios
    css('.bento-grid__item').styles(
      raw: const {
        'min-height': '200px',
        'position': 'relative',
        'transition': 'transform 0.3s ease, box-shadow 0.3s ease',
      },
    ),

    // Featured items - larger and more prominent
    css('.bento-featured').styles(
      raw: const {
        'min-height': '320px',
        'background':
            'linear-gradient(135deg, rgba(224, 122, 95, 0.05) 0%, rgba(212, 117, 107, 0.05) 100%)',
        'border': '2px solid rgba(224, 122, 95, 0.1)',
      },
    ),

    // Standard items - balanced size
    css('.bento-standard').styles(
      raw: const {
        'min-height': '250px',
        'background':
            'linear-gradient(135deg, rgba(129, 178, 154, 0.05) 0%, rgba(168, 196, 162, 0.05) 100%)',
        'border': '2px solid rgba(129, 178, 154, 0.1)',
      },
    ),

    // Micro items - compact and efficient
    css('.bento-micro').styles(
      raw: const {
        'min-height': '180px',
        'background':
            'linear-gradient(135deg, rgba(242, 204, 143, 0.05) 0%, rgba(217, 174, 120, 0.05) 100%)',
        'border': '2px solid rgba(242, 204, 143, 0.1)',
      },
    ),

    // Hover effects for interactivity
    css('.bento-grid__item:hover').styles(
      raw: const {
        'transform': 'translateY(-4px) scale(1.02)',
        'box-shadow': '0 12px 40px rgba(78, 52, 46, 0.15)',
        'z-index': '10',
      },
    ),

    // Tablet responsive breakpoint
    css.media(MediaQuery.screen(maxWidth: 1023.px), [
      css(
        '.bento-layout--tiny, .bento-layout--small, .bento-layout--medium',
      ).styles(
        raw: const {
          'grid-template-columns': 'repeat(4, 1fr)',
          'grid-template-areas': '''
            "hero hero feature feature"
            "hero hero feature feature"
            "aside1 aside1 aside2 aside2"
            "aside3 aside4 aside5 aside6"
          ''',
        },
      ),

      css('.bento-layout--large, .bento-layout--xl').styles(
        raw: const {
          'grid-template-columns': 'repeat(4, 1fr)',
          'grid-template-areas': '''
            "hero hero hero feature"
            "hero hero hero feature"
            "wide1 wide1 aside1 aside2"
            "aside3 aside4 aside5 aside6"
          ''',
        },
      ),
    ]),

    // Mobile responsive breakpoint
    css.media(MediaQuery.screen(maxWidth: 767.px), [
      css(
        '.bento-grid',
      ).styles(raw: const {'padding': '1rem', 'gap': '2.5rem'}),

      css(
        '.bento-section',
      ).styles(raw: const {'padding': '1.5rem', 'border-radius': '1rem'}),

      css('.bento-section__header').styles(
        raw: const {
          'flex-direction': 'column',
          'align-items': 'flex-start',
          'gap': '1rem',
          'text-align': 'left',
        },
      ),

      css('.bento-section__title').styles(raw: const {'font-size': '1.5rem'}),

      css('.bento-section__subtitle').styles(raw: const {'font-size': '1rem'}),

      // Mobile: single column stack
      css('.bento-grid__container').styles(
        raw: const {
          'grid-template-columns': '1fr',
          'grid-template-areas': '''
            "hero"
            "feature"
            "aside1"
            "aside2"
            "aside3"
            "aside4"
            "aside5"
            "aside6"
          ''',
          'gap': '1rem',
        },
      ),

      // Override all layout classes for mobile
      css(
        '.bento-layout--tiny, .bento-layout--small, .bento-layout--medium, .bento-layout--large, .bento-layout--xl',
      ).styles(
        raw: const {
          'grid-template-columns': '1fr !important',
          'grid-template-areas':
              '''
            "hero-wide"
            "sidebar-tall"
            "hero-square"
            "tower-right"
            "brick-left"
            "brick-right"
            "sidebar-top"
            "sidebar-mid"
            "brick-quad-a"
            "brick-quad-b"
            "brick-quad-c"
            "hero-featured"
            "tower-vertical"
            "wide-banner"
            "cluster-a"
            "cluster-b"
            "cluster-c"
            "accent-tall"
            "accent-wide"
            "corner-small"
          '''
              ' !important',
        },
      ),
    ]),

    // Large screen optimization (1400px+)
    css.media(MediaQuery.screen(minWidth: 1400.px), [
      css('.bento-layout--large').styles(
        raw: const {
          'grid-template-columns': 'repeat(10, 1fr)',
          'grid-template-areas': '''
            "hero-featured hero-featured hero-featured hero-featured hero-featured tower-vertical wide-banner wide-banner wide-banner corner-small"
            "hero-featured hero-featured hero-featured hero-featured hero-featured tower-vertical cluster-a cluster-b cluster-c corner-small"
            "accent-tall accent-tall accent-tall accent-wide accent-wide tower-vertical cluster-a cluster-b cluster-c corner-small"
            "accent-tall accent-tall accent-tall accent-wide accent-wide . . . . ."
          ''',
        },
      ),

      css('.bento-layout--xl').styles(
        raw: const {
          'grid-template-columns': 'repeat(12, 1fr)',
          'grid-template-areas': '''
            "hero-primary hero-primary hero-primary hero-primary hero-primary tower-main wide-primary wide-primary wide-primary corner-tl corner-tr side-right"
            "hero-primary hero-primary hero-primary hero-primary hero-primary tower-main cluster-left cluster-center cluster-right corner-tl corner-tr side-right"
            "brick-a1 brick-a2 brick-a3 accent-vertical accent-vertical tower-main cluster-left cluster-center cluster-right side-left side-left side-right"
            "brick-a1 brick-a2 brick-a3 accent-square accent-square accent-horizontal accent-horizontal footer-wide footer-wide footer-wide corner-bl corner-bl"
          ''',
        },
      ),
    ]),

    // Texture and visual enhancements
    css('.bento-section::before').styles(
      raw: const {
        'content': '""',
        'position': 'absolute',
        'top': '0',
        'left': '0',
        'right': '0',
        'height': '6px',
        'background':
            'linear-gradient(90deg, #E07A5F 0%, #81B29A 50%, #F2CC8F 100%)',
        'opacity': '0.6',
        'border-radius': '1.5rem 1.5rem 0 0',
      },
    ),

    css('.bento-section::after').styles(
      raw: const {
        'content': '""',
        'position': 'absolute',
        'top': '20px',
        'left': '20px',
        'right': '20px',
        'bottom': '20px',
        'background':
            'url("data:image/svg+xml,%3Csvg width=\'40\' height=\'40\' viewBox=\'0 0 40 40\' xmlns=\'http://www.w3.org/2000/svg\'%3E%3Cg fill=\'%23EDE7DD\' fill-opacity=\'0.03\'%3E%3Cpath d=\'M20 20c0-5.5-4.5-10-10-10s-10 4.5-10 10 4.5 10 10 10 10-4.5 10-10zm10 0c0-5.5-4.5-10-10-10s-10 4.5-10 10 4.5 10 10 10 10-4.5 10-10z\'/%3E%3C/g%3E%3C/svg%3E")',
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
    required this.blocks,
  });

  final String title;
  final String subtitle;
  final String icon;
  final String accentColor;
  final List<BentoBlock> blocks;
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
