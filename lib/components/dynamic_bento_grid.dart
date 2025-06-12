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
/// - Visual grouping by project purpose (Apps+Bots, Games, Libraries+Utilities)
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

      // Grouped Bento Layout with Visual Compartmentalization
      div(classes: 'bento-groups-container', [
        ..._buildProjectGroups(gridConfig, service),
      ]),
    ]);
  }

  /// Build project groups with visual compartmentalization
  Iterable<Component> _buildProjectGroups(
    GridConfiguration gridConfig,
    DynamicBentoGridService service,
  ) sync* {
    final groupedProjects = _categorizeProjectsByPurpose();

    // Apps + Bots Group
    if (groupedProjects.appsAndBots.isNotEmpty) {
      yield _buildProjectGroup(
        title: 'Apps & Bots',
        subtitle: 'Interactive applications and intelligent assistants',
        projects: groupedProjects.appsAndBots,
        groupClass: 'bento-group--apps-bots',
        iconEmoji: '📱',
        gridConfig: gridConfig,
        service: service,
      );
    }

    // Games Group
    if (groupedProjects.games.isNotEmpty) {
      yield _buildProjectGroup(
        title: 'Games',
        subtitle: 'Interactive entertainment and creative challenges',
        projects: groupedProjects.games,
        groupClass: 'bento-group--games',
        iconEmoji: '🎮',
        gridConfig: gridConfig,
        service: service,
      );
    }

    // Libraries + Utilities Group
    if (groupedProjects.librariesAndUtilities.isNotEmpty) {
      yield _buildProjectGroup(
        title: 'Libraries & Utilities',
        subtitle: 'Developer tools, packages, and productivity enhancers',
        projects: groupedProjects.librariesAndUtilities,
        groupClass: 'bento-group--libraries-utilities',
        iconEmoji: '🔧',
        gridConfig: gridConfig,
        service: service,
      );
    }
  }

  /// Build a single project group with proper bento compartmentalization
  Component _buildProjectGroup({
    required String title,
    required String subtitle,
    required List<ProjectModel> projects,
    required String groupClass,
    required String iconEmoji,
    required GridConfiguration gridConfig,
    required DynamicBentoGridService service,
  }) {
    return section(classes: 'bento-group $groupClass', [
      // Group Header with Visual Identity
      div(classes: 'bento-group__header', [
        div(classes: 'bento-group__icon', [text(iconEmoji)]),
        div(classes: 'bento-group__text', [
          h3(classes: 'bento-group__title', [text(title)]),
          p(classes: 'bento-group__subtitle', [text(subtitle)]),
        ]),
        div(classes: 'bento-group__count', [
          text(
            '${projects.length} ${projects.length == 1 ? 'project' : 'projects'}',
          ),
        ]),
      ]),

      // Group Grid Container
      div(
        classes: 'bento-group__grid ${_getGridClasses(gridConfig, service)}',
        [
          // Build projects within this group
          ..._buildGroupProjects(projects, gridConfig, service),
        ],
      ),
    ]);
  }

  /// Build projects within a specific group
  List<Component> _buildGroupProjects(
    List<ProjectModel> projects,
    GridConfiguration gridConfig,
    DynamicBentoGridService service,
  ) {
    return projects
        .asMap()
        .entries
        .map(
          (entry) => _buildProjectComponent(
            entry.value,
            entry.key,
            gridConfig,
            service,
          ),
        )
        .toList();
  }

  /// Categorize projects by their purpose/domain
  ProjectPurposeGroups _categorizeProjectsByPurpose() {
    final appsAndBots = <ProjectModel>[];
    final games = <ProjectModel>[];
    final librariesAndUtilities = <ProjectModel>[];

    for (final project in projects) {
      final type = project.type.toLowerCase();

      if (type == 'app' || type == 'bot') {
        appsAndBots.add(project);
      } else if (type == 'game') {
        games.add(project);
      } else if (type == 'package' ||
          type == 'library' ||
          type.contains('excel') ||
          type.contains('vba') ||
          type.contains('addin') ||
          type.contains('utility')) {
        librariesAndUtilities.add(project);
      } else {
        // Default categorization based on project characteristics
        if (project.isLibrary || project.preferredSize.isMicro) {
          librariesAndUtilities.add(project);
        } else if (project.isGame) {
          games.add(project);
        } else {
          appsAndBots.add(project);
        }
      }
    }

    return ProjectPurposeGroups(
      appsAndBots: appsAndBots,
      games: games,
      librariesAndUtilities: librariesAndUtilities,
    );
  }

  // Project categorization (legacy - kept for backward compatibility)
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

  /// Build individual project component with proper bento sizing
  Component _buildProjectComponent(
    ProjectModel project,
    int index,
    GridConfiguration gridConfig,
    DynamicBentoGridService service,
  ) {
    final isHovered = service.hoveredProject?.id == project.id;
    final isNeighbor = service.neighborProjects.contains(project.id.value);
    final isExpanded = service.expandedProject?.id == project.id;
    final isDimmed =
        service.hoveredProject != null && !isHovered && !isNeighbor;

    // Determine bento size class for CSS grid positioning
    String bentoSizeClass;
    if (project.preferredSize.isMicro || project.isLibrary) {
      bentoSizeClass = 'bento-micro';
    } else if (project.preferredSize.isFeatured) {
      bentoSizeClass = 'bento-featured';
    } else {
      bentoSizeClass = 'bento-standard';
    }

    // Create wrapper with proper bento sizing
    Component bentoComponent;
    if (project.preferredSize.isMicro || project.isLibrary) {
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

    // Wrap in bento size container for grid positioning
    return div(classes: 'bento-wrapper $bentoSizeClass', [bentoComponent]);
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
    css('.dynamic-bento-grid-container').styles(
      position: Position.relative(),
      width: 100.percent,
      maxWidth: 1280.px, // Add max-width constraint
      margin: Margin.symmetric(horizontal: Unit.auto), // Center the container
      padding: Padding.symmetric(horizontal: 1.rem), // Add horizontal padding
    ),

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

    // Bento Groups Container - Main compartmentalization
    css('.bento-groups-container').styles(
      display: Display.flex,
      flexDirection: FlexDirection.column,
      gap: Gap.all(4.rem), // Large gaps between groups for clear separation
      width: 100.percent,
    ),

    // Individual Bento Group - Each purpose compartment
    css('.bento-group').styles(
      position: Position.relative(),
      backgroundColor: const Color('#F5F1EB'), // warm-paper background
      radius: BorderRadius.circular(16.px),
      padding: Padding.all(2.rem),
      border: Border(
        style: BorderStyle.solid,
        color: const Color('#E8E2D8'), // soft-linen border
        width: 2.px,
      ),
      // Subtle shadow for depth
      raw: const {'box-shadow': '0 4px 20px rgba(44, 24, 16, 0.08)'},
    ),

    // Group Header - Visual identity for each compartment
    css('.bento-group__header').styles(
      display: Display.flex,
      alignItems: AlignItems.center,
      margin: Margin.only(bottom: 2.rem),
      gap: Gap.all(1.rem),
    ),

    css('.bento-group__icon').styles(
      fontSize: 2.rem,
      lineHeight: 1.px,
      raw: const {'flex-shrink': '0'},
    ),

    css('.bento-group__text').styles(flex: Flex(grow: 1)),

    css('.bento-group__title').styles(
      fontSize: 1.5.rem,
      fontWeight: FontWeight.w600,
      color: const Color('#2C1810'), // deep-espresso
      margin: Margin.only(bottom: 0.25.rem),
      letterSpacing: (-0.01).em,
    ),

    css('.bento-group__subtitle').styles(
      fontSize: 0.875.rem,
      color: const Color('#8B4513'), // warm-copper
      fontWeight: FontWeight.w400,
      lineHeight: 1.4.px,
    ),

    css('.bento-group__count').styles(
      fontSize: 0.75.rem,
      fontWeight: FontWeight.w600,
      color: const Color('#9B8B7A'), // grain-muted
      backgroundColor: const Color('#E8E2D8'), // soft-linen
      padding: Padding.symmetric(horizontal: 0.75.rem, vertical: 0.375.rem),
      radius: BorderRadius.circular(12.px),
      raw: const {'flex-shrink': '0'},
    ),

    // Group Grid - Individual compartment grid
    css('.bento-group__grid').styles(
      display: Display.grid,
      gap: Gap.all(1.rem), // Consistent gap within groups
      width: 100.percent,
      position: Position.relative(),
      // Mobile-first: Single column layout
      gridTemplate: GridTemplate(
        columns: GridTracks([GridTrack(TrackSize.fr(1))]),
        rows: GridTracks([GridTrack(TrackSize.auto)]),
      ),
      raw: const {
        'grid-auto-rows': 'minmax(120px, auto)',
        'grid-auto-flow': 'row dense',
      },
    ),

    // Group-specific styling for visual variety
    css('.bento-group--apps-bots').styles(
      raw: const {
        'border-left': '4px solid #3B82F6', // Blue accent for apps
      },
    ),

    css('.bento-group--games').styles(
      raw: const {
        'border-left': '4px solid #8B5CF6', // Purple accent for games
      },
    ),

    css('.bento-group--libraries-utilities').styles(
      raw: const {
        'border-left': '4px solid #10B981', // Green accent for libraries
      },
    ),

    // Base grid styles with proper bento sizing and visual hierarchy
    css('.dynamic-bento-grid').styles(
      display: Display.grid,
      gap: Gap.all(1.rem), // Consistent gap for clean compartmentalization
      width: 100.percent,
      maxWidth: 100.percent,
      position: Position.relative(),
      transition: const Transition('all', duration: 400),
      // Mobile-first: Single column layout
      gridTemplate: GridTemplate(
        columns: GridTracks([GridTrack(TrackSize.fr(1))]),
        rows: GridTracks([GridTrack(TrackSize.auto)]),
      ),
      // Auto-sizing rows with minimum heights for visual hierarchy
      raw: const {
        'grid-auto-rows': 'minmax(120px, auto)',
        'grid-auto-flow': 'row dense', // Dense packing for efficient space use
      },
    ),

    // Bento size classes for visual hierarchy
    // Micro bentos: 1x1 units (libraries/packages)
    css('.bento-micro').styles(
      raw: const {'grid-column': 'span 1', 'grid-row': 'span 1'},
      minHeight: 120.px,
      maxHeight: 160.px,
    ),

    // Standard bentos: 1x1 units on mobile, 1x2 or 2x1 on larger screens
    css('.bento-standard').styles(
      raw: const {'grid-column': 'span 1', 'grid-row': 'span 1'},
      minHeight: 200.px,
      maxHeight: 280.px,
    ),

    // Featured bentos: Full width on mobile, 2x2 or 3x2 on larger screens
    css('.bento-featured').styles(
      raw: const {'grid-column': 'span 1', 'grid-row': 'span 2'},
      minHeight: 320.px,
      maxHeight: 480.px,
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

    // Responsive breakpoints with proper bento grid behavior
    css.media(MediaQuery.screen(minWidth: 640.px), [
      css('.bento-group__grid').styles(
        // 2-column grid for small tablets within groups
        gridTemplate: GridTemplate(
          columns: GridTracks([
            GridTrack(TrackSize.fr(1)),
            GridTrack(TrackSize.fr(1)),
          ]),
        ),
        gap: Gap.all(1.25.rem),
      ),

      // Micro bentos: Stay 1x1 but can cluster together
      css(
        '.bento-micro',
      ).styles(raw: const {'grid-column': 'span 1', 'grid-row': 'span 1'}),

      // Standard bentos: Can span 2 columns occasionally for variety
      css(
        '.bento-standard',
      ).styles(raw: const {'grid-column': 'span 1', 'grid-row': 'span 1'}),

      // Featured bentos: Span full width (2 columns) and taller
      css('.bento-featured').styles(
        raw: const {'grid-column': 'span 2', 'grid-row': 'span 2'},
        minHeight: 360.px,
      ),
    ]),

    css.media(MediaQuery.screen(minWidth: 768.px), [
      css('.bento-group__grid').styles(
        // 3-column grid for tablets within groups
        gridTemplate: GridTemplate(
          columns: GridTracks([
            GridTrack(TrackSize.fr(1)),
            GridTrack(TrackSize.fr(1)),
            GridTrack(TrackSize.fr(1)),
          ]),
        ),
        gap: Gap.all(1.5.rem),
      ),

      // Some standard bentos can span 2 columns for visual interest
      css(
        '.bento-standard:nth-child(3n+1)',
      ).styles(raw: const {'grid-column': 'span 2', 'grid-row': 'span 1'}),

      // Featured bentos: Span 2x2 or 3x2 depending on content
      css('.bento-featured').styles(
        raw: const {'grid-column': 'span 2', 'grid-row': 'span 2'},
        minHeight: 400.px,
      ),
    ]),

    css.media(MediaQuery.screen(minWidth: 1024.px), [
      css('.bento-group__grid').styles(
        // 4-column grid for desktop within groups
        gridTemplate: GridTemplate(
          columns: GridTracks([
            GridTrack(TrackSize.fr(1)),
            GridTrack(TrackSize.fr(1)),
            GridTrack(TrackSize.fr(1)),
            GridTrack(TrackSize.fr(1)),
          ]),
        ),
        gap: Gap.all(2.rem),
      ),

      // Create visual variety with different spanning patterns
      css(
        '.bento-standard:nth-child(5n+1)',
      ).styles(raw: const {'grid-column': 'span 2', 'grid-row': 'span 1'}),

      css(
        '.bento-standard:nth-child(7n+1)',
      ).styles(raw: const {'grid-column': 'span 1', 'grid-row': 'span 2'}),

      // Featured bentos: Large presence with 2x2 or 3x2 spans
      css('.bento-featured').styles(
        raw: const {'grid-column': 'span 3', 'grid-row': 'span 2'},
        minHeight: 440.px,
      ),
    ]),

    css.media(MediaQuery.screen(minWidth: 1280.px), [
      css('.bento-group__grid').styles(
        // 5-column grid for large screens within groups
        gridTemplate: GridTemplate(
          columns: GridTracks([
            GridTrack(TrackSize.fr(1)),
            GridTrack(TrackSize.fr(1)),
            GridTrack(TrackSize.fr(1)),
            GridTrack(TrackSize.fr(1)),
            GridTrack(TrackSize.fr(1)),
          ]),
        ),
        gap: Gap.all(2.5.rem),
      ),

      // More complex spanning patterns for visual hierarchy
      css(
        '.bento-standard:nth-child(6n+1)',
      ).styles(raw: const {'grid-column': 'span 2', 'grid-row': 'span 1'}),

      css(
        '.bento-standard:nth-child(8n+1)',
      ).styles(raw: const {'grid-column': 'span 1', 'grid-row': 'span 2'}),

      // Featured bentos: Maximum impact with 3x2 or 4x2 spans
      css('.bento-featured').styles(
        raw: const {'grid-column': 'span 3', 'grid-row': 'span 2'},
        minHeight: 480.px,
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

/// Container for projects grouped by purpose/domain
class ProjectPurposeGroups {
  const ProjectPurposeGroups({
    required this.appsAndBots,
    required this.games,
    required this.librariesAndUtilities,
  });

  final List<ProjectModel> appsAndBots;
  final List<ProjectModel> games;
  final List<ProjectModel> librariesAndUtilities;

  int get totalCount =>
      appsAndBots.length + games.length + librariesAndUtilities.length;

  bool get hasAppsAndBots => appsAndBots.isNotEmpty;
  bool get hasGames => games.isNotEmpty;
  bool get hasLibrariesAndUtilities => librariesAndUtilities.isNotEmpty;
}
