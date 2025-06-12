import 'package:jaspr/jaspr.dart';

import 'expanded_bento.dart';
import 'micro_bento.dart';
import 'models/bento_config.dart';
import 'models/project_model.dart';
import 'search_filter_bar.dart';
import 'standard_bento.dart';

/// Service for managing dynamic bento grid state
class DynamicBentoGridService extends ChangeNotifier {
  // Phase 4: Animation & Hover state
  ProjectModel? _hoveredProject;
  ProjectModel? _expandedProject;
  Set<String> _neighborProjects = {};
  bool _isAnimatingEntrance = true;

  // Getters
  ProjectModel? get hoveredProject => _hoveredProject;
  ProjectModel? get expandedProject => _expandedProject;
  Set<String> get neighborProjects => _neighborProjects;
  bool get isAnimatingEntrance => _isAnimatingEntrance;

  void setAnimatingEntrance(bool value) {
    _isAnimatingEntrance = value;
    // Only notify listeners on client side to prevent server frame scheduling
    if (kIsWeb) {
      notifyListeners();
    }
  }

  void setHoveredProject(ProjectModel? project, Set<String> neighbors) {
    _hoveredProject = project;
    _neighborProjects = neighbors;
    // Only notify listeners on client side to prevent server frame scheduling
    if (kIsWeb) {
      notifyListeners();
    }
  }

  void setExpandedProject(ProjectModel? project) {
    _expandedProject = project;
    // Only notify listeners on client side to prevent server frame scheduling
    if (kIsWeb) {
      notifyListeners();
    }
  }
}

/// {@template dynamic_bento_grid}
/// Dynamic, adaptive grid system that orchestrates Micro, Standard, and Expanded bento types.
///
/// Features:
/// - Responsive breakpoint system (mobile/tablet/desktop/large)
/// - Size hierarchy management (micro/standard/expanded zones)
/// - Interaction orchestration (hover cascades, expansion choreography)
/// - Performance optimizations (CSS-based animations)
/// - Staggered entrance animations with cinematic timing
/// - Enhanced hover cascade system with neighbor dimming
/// - Smooth expansion/collapse animations
/// {@endtemplate}
class DynamicBentoGrid extends StatelessComponent {
  /// {@macro dynamic_bento_grid}
  const DynamicBentoGrid({
    required this.projects,
    this.config = BentoConfig.defaultConfig,
    super.key,
  });

  final List<ProjectModel> projects;
  final BentoConfig config;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final service = DynamicBentoGridService();

    // Start entrance animation after a brief delay (only on client)
    if (kIsWeb) {
      Future.delayed(const Duration(milliseconds: 200), () {
        service.setAnimatingEntrance(false);
      });
    }

    // Use conditional rendering: ListenableBuilder only on client, direct rendering on server
    if (kIsWeb) {
      yield ListenableBuilder(
        listenable: service,
        builder: (context) sync* {
          yield* _buildContent(service);
        },
      );
    } else {
      // Server-side rendering: render directly without listening to changes
      yield* _buildContent(service);
    }
  }

  Iterable<Component> _buildContent(DynamicBentoGridService service) sync* {
    // Use desktop configuration as default - responsive behavior handled by CSS
    final gridConfig = GridConfiguration.desktop;

    yield div(classes: 'dynamic-bento-grid-container', [
      // Enhanced Section Header
      div(classes: 'section-header', [
        h2(classes: 'section-title', [text('Creative Universe')]),
        p(classes: 'section-subtitle', [
          text(
            'Each project tells a story of ethical innovation, creative collaboration, and the pursuit of meaningful technology that serves humanity.',
          ),
        ]),
      ]),

      // Search and Filter Bar
      SearchFilterBar(projects: projects),

      // Responsive Grid Layout with Animation Support
      div(classes: _getGridClasses(gridConfig, service), [
        // Build all projects in a unified grid
        ..._buildAllProjects(gridConfig, service),
      ]),
    ]);
  }

  // Project categorization
  List<ProjectModel> get _microProjects =>
      projects.where((p) => p.preferredSize.isMicro || p.isLibrary).toList();

  List<ProjectModel> get _standardProjects => projects
      .where((p) => p.preferredSize.isStandard && !p.isLibrary)
      .toList();

  List<ProjectModel> get _featuredProjects =>
      projects.where((p) => p.preferredSize.isFeatured).toList();

  /// Phase 4: Enhanced hover cascade system
  void _handleBentoHover(
    ProjectModel project,
    bool isHovered,
    DynamicBentoGridService service,
  ) {
    if (!config.enableHoverEffects) return;

    final neighbors = isHovered
        ? _calculateNeighborProjects(project)
        : <String>{};
    service.setHoveredProject(isHovered ? project : null, neighbors);
  }

  Set<String> _calculateNeighborProjects(ProjectModel hoveredProject) {
    // Simple neighbor calculation - in a real implementation, this would
    // calculate actual grid neighbors based on layout
    final allProjects = [
      ..._microProjects,
      ..._standardProjects,
      ..._featuredProjects,
    ];

    final hoveredIndex = allProjects.indexWhere(
      (p) => p.id == hoveredProject.id,
    );
    final neighbors = <String>{};

    // Add adjacent projects as neighbors
    if (hoveredIndex > 0) {
      neighbors.add(allProjects[hoveredIndex - 1].id.value);
    }
    if (hoveredIndex < allProjects.length - 1) {
      neighbors.add(allProjects[hoveredIndex + 1].id.value);
    }

    return neighbors;
  }

  Future<void> _expandBento(
    ProjectModel project,
    DynamicBentoGridService service,
  ) async {
    if (!config.enableExpansion) return;

    // Collapse current expanded project if exists
    if (service.expandedProject != null &&
        service.expandedProject!.id != project.id) {
      await _collapseBento(service);
    }

    service.setExpandedProject(project);
  }

  Future<void> _collapseBento(DynamicBentoGridService service) async {
    service.setExpandedProject(null);
  }

  Component _buildProjectBento(
    ProjectModel project,
    GridConfiguration gridConfig,
    int index,
    DynamicBentoGridService service,
  ) {
    final isHovered = service.hoveredProject?.id == project.id;
    final isNeighbor = service.neighborProjects.contains(project.id.value);
    final isExpanded = service.expandedProject?.id == project.id;
    final isDimmed =
        service.hoveredProject != null && !isHovered && !isNeighbor;

    // Calculate entrance animation delay based on project type and index
    final isLibrary = project.isLibrary;
    final entranceDelay = isLibrary
        ? index * config.timings.entranceStaggerMs
        : (_microProjects.length * config.timings.entranceStaggerMs) +
              ((index - _microProjects.length) *
                  (config.timings.entranceStaggerMs * 2));

    // Determine bento type based on project size and grid configuration
    Component bentoComponent;
    if (project.preferredSize.isMicro ||
        (project.isLibrary && gridConfig.allowMicroClusters)) {
      bentoComponent = MicroBento(
        project: project,
        config: config,
        isDimmed: isDimmed,
        onHover: (isHovered) => _handleBentoHover(project, isHovered, service),
      );
    } else if (project.preferredSize.isFeatured) {
      bentoComponent = ExpandedBento(
        project: project,
        onCollapse: () => _collapseBento(service),
        config: config,
        onHover: (isHovered) => _handleBentoHover(project, isHovered, service),
      );
    } else {
      bentoComponent = StandardBento(
        project: project,
        config: config,
        isDimmed: isDimmed,
        onExpand: () => _expandBento(project, service),
        onHover: (isHovered) => _handleBentoHover(project, isHovered, service),
      );
    }

    // Determine animation class based on project type
    String animationClass;
    if (project.isLibrary) {
      animationClass = 'bento-entrance-wrapper--library';
    } else if (project.preferredSize.isFeatured) {
      animationClass = 'bento-entrance-wrapper--featured';
    } else {
      animationClass = 'bento-entrance-wrapper--standard';
    }

    // Wrap with entrance animation container
    return div(
      classes: 'bento-entrance-wrapper $animationClass',
      styles: Styles.raw({'animation-delay': '${entranceDelay}ms'}),
      [bentoComponent],
    );
  }

  List<Component> _buildAllProjects(
    GridConfiguration gridConfig,
    DynamicBentoGridService service,
  ) {
    // Render all projects in a single grid to ensure proper placement
    final allProjects = [
      ..._microProjects,
      ..._standardProjects,
      ..._featuredProjects,
    ];

    return allProjects
        .asMap()
        .entries
        .map(
          (entry) =>
              _buildProjectBento(entry.value, gridConfig, entry.key, service),
        )
        .toList();
  }

  String _getGridClasses(
    GridConfiguration gridConfig,
    DynamicBentoGridService service,
  ) {
    final baseClass = 'dynamic-bento-grid';
    final layoutClass = 'dynamic-bento-grid--${gridConfig.layout}';
    final hoverClass = service.hoveredProject != null
        ? 'dynamic-bento-grid--hovering'
        : '';
    final entranceClass = service.isAnimatingEntrance
        ? 'dynamic-bento-grid--entering'
        : '';

    return '$baseClass $layoutClass $hoverClass $entranceClass'.trim();
  }

  @css
  static List<StyleRule> get styles => [
    // Import styles from child components
    ...MicroBento.styles,
    ...StandardBento.styles,
    ...ExpandedBento.styles,
    ...SearchFilterBar.styles,

    // Container styles
    css(
      '.dynamic-bento-grid-container',
    ).styles(position: Position.relative(), width: 100.percent),

    // Enhanced Section Header
    css('.section-header').styles(
      textAlign: TextAlign.center,
      margin: Margin.only(bottom: 5.rem, left: Unit.auto, right: Unit.auto),
      maxWidth: 56.rem,
    ),

    css('.section-title').styles(
      fontSize: 2.5.rem,
      fontWeight: FontWeight.w200,
      color: const Color('#2C1810'), // deep-espresso
      margin: Margin.only(bottom: 1.5.rem),
      letterSpacing: (-0.01).em,
      lineHeight: 1.2.px,
    ),

    css('.section-subtitle').styles(
      fontSize: 1.125.rem,
      color: const Color('#8B4513'), // warm-copper
      lineHeight: 1.7.px,
      fontWeight: FontWeight.w400,
    ),

    // Base grid styles with animation support
    css('.dynamic-bento-grid').styles(
      display: Display.grid,
      gap: Gap.all(2.rem),
      width: 100.percent,
      position: Position.relative(),
      transition: const Transition('all', duration: 400),
      // Default to mobile layout
      gridTemplate: GridTemplate(
        columns: GridTracks([GridTrack(TrackSize.fr(1))]),
      ),
    ),

    // Entrance animation wrapper with enhanced staggered timing
    css('.bento-entrance-wrapper').styles(
      opacity: 0,
      transform: Transform.translate(y: 20.px),
      raw: const {
        'animation-fill-mode': 'both',
        'animation-duration': '600ms',
        'animation-timing-function': 'cubic-bezier(0.25, 0.46, 0.45, 0.94)',
      },
    ),

    // Library projects get priority entrance timing
    css('.bento-entrance-wrapper--library').styles(
      raw: const {
        'animation-name': 'bentoEntranceLibrary',
        'animation-duration': '500ms',
      },
    ),

    // Standard projects have delayed entrance
    css('.bento-entrance-wrapper--standard').styles(
      raw: const {
        'animation-name': 'bentoEntranceStandard',
        'animation-duration': '600ms',
      },
    ),

    // Featured projects have the most dramatic entrance
    css('.bento-entrance-wrapper--featured').styles(
      raw: const {
        'animation-name': 'bentoEntranceFeatured',
        'animation-duration': '700ms',
      },
    ),

    // Enhanced hover cascade effects
    css(
      '.dynamic-bento-grid--hovering .micro-bento:not(.micro-bento--hovered):not(.micro-bento--neighbor)',
    ).styles(
      raw: const {
        'transform': 'scale(0.95)',
        'opacity': '0.7',
        'transition': 'all 200ms ease',
      },
    ),

    css(
      '.dynamic-bento-grid--hovering .standard-bento:not(.standard-bento--hovered):not(.standard-bento--neighbor)',
    ).styles(
      raw: const {
        'transform': 'scale(0.95)',
        'opacity': '0.7',
        'transition': 'all 200ms ease',
      },
    ),

    css(
      '.dynamic-bento-grid--hovering .expanded-bento:not(.expanded-bento--hovered):not(.expanded-bento--neighbor)',
    ).styles(
      raw: const {
        'transform': 'scale(0.95)',
        'opacity': '0.7',
        'transition': 'all 200ms ease',
      },
    ),

    // Enhanced entrance animation keyframes with library-first priority
    css('@keyframes bentoEntranceLibrary', []).styles(
      raw: const {
        '0%': 'opacity: 0; transform: translateY(15px) scale(0.98)',
        '60%': 'opacity: 0.8; transform: translateY(-2px) scale(1.01)',
        '100%': 'opacity: 1; transform: translateY(0) scale(1)',
      },
    ),

    css('@keyframes bentoEntranceStandard', []).styles(
      raw: const {
        '0%': 'opacity: 0; transform: translateY(25px) scale(0.95)',
        '50%': 'opacity: 0.6; transform: translateY(-3px) scale(1.02)',
        '100%': 'opacity: 1; transform: translateY(0) scale(1)',
      },
    ),

    css('@keyframes bentoEntranceFeatured', []).styles(
      raw: const {
        '0%':
            'opacity: 0; transform: translateY(35px) scale(0.9) rotateX(10deg)',
        '40%':
            'opacity: 0.4; transform: translateY(-5px) scale(1.03) rotateX(-2deg)',
        '70%':
            'opacity: 0.8; transform: translateY(2px) scale(1.01) rotateX(1deg)',
        '100%': 'opacity: 1; transform: translateY(0) scale(1) rotateX(0deg)',
      },
    ),

    // Legacy keyframes for backward compatibility
    css('@keyframes bentoEntranceFade', []).styles(
      raw: const {
        '0%': 'opacity: 0; transform: translateY(20px) scale(0.95)',
        '100%': 'opacity: 1; transform: translateY(0) scale(1)',
      },
    ),

    // Expansion animation keyframes
    css('@keyframes bentoExpand', []).styles(
      raw: const {
        '0%': 'transform: scale(1)',
        '100%': 'transform: scale(1.05)',
      },
    ),

    css('@keyframes bentoCollapse', []).styles(
      raw: const {
        '0%': 'transform: scale(1.05)',
        '100%': 'transform: scale(1)',
      },
    ),

    // Responsive breakpoints
    css.media(MediaQuery.screen(minWidth: 768.px), [
      css('.section-title').styles(fontSize: 3.5.rem),
      css('.section-subtitle').styles(fontSize: 1.25.rem),
      css('.dynamic-bento-grid').styles(
        gap: Gap.all(2.5.rem),
        gridTemplate: GridTemplate(
          columns: GridTracks([
            GridTrack(TrackSize.fr(1)),
            GridTrack(TrackSize.fr(1)),
          ]),
        ),
      ),
    ]),

    css.media(MediaQuery.screen(minWidth: 1024.px), [
      css('.section-title').styles(fontSize: 4.rem),
      css('.dynamic-bento-grid').styles(
        gridTemplate: GridTemplate(
          columns: GridTracks([
            GridTrack(TrackSize.fr(1)),
            GridTrack(TrackSize.fr(1)),
            GridTrack(TrackSize.fr(1)),
          ]),
        ),
      ),
    ]),

    css.media(MediaQuery.screen(minWidth: 1280.px), [
      css('.dynamic-bento-grid').styles(
        gap: Gap.all(3.rem),
        gridTemplate: GridTemplate(
          columns: GridTracks([
            GridTrack(TrackSize.fr(1)),
            GridTrack(TrackSize.fr(1)),
            GridTrack(TrackSize.fr(1)),
            GridTrack(TrackSize.fr(1)),
          ]),
        ),
      ),
    ]),

    // Performance optimizations
    css('.dynamic-bento-grid').styles(
      raw: const {
        'will-change': 'transform',
        'backface-visibility': 'hidden',
        'perspective': '1000px',
      },
    ),

    // Reduced motion support
    css.media(MediaQuery.screen(), [
      css('.bento-entrance-wrapper').styles(
        raw: const {
          'animation': 'none !important',
          'opacity': '1',
          'transform': 'none',
        },
      ),
      css(
        '.dynamic-bento-grid--hovering .micro-bento:not(.micro-bento--hovered):not(.micro-bento--neighbor)',
      ).styles(
        raw: const {'transform': 'none', 'transition': 'opacity 200ms ease'},
      ),
      css(
        '.dynamic-bento-grid--hovering .standard-bento:not(.standard-bento--hovered):not(.standard-bento--neighbor)',
      ).styles(
        raw: const {'transform': 'none', 'transition': 'opacity 200ms ease'},
      ),
      css(
        '.dynamic-bento-grid--hovering .expanded-bento:not(.expanded-bento--hovered):not(.expanded-bento--neighbor)',
      ).styles(
        raw: const {'transform': 'none', 'transition': 'opacity 200ms ease'},
      ),
    ]),
  ];
}
