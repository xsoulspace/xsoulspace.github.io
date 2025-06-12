import 'package:jaspr/jaspr.dart';

import 'expanded_bento.dart';
import 'models/bento_config.dart';
import 'models/project_model.dart';

/// Orchestrates smooth bento expansion transitions with position tracking.
///
/// This component manages the complex choreography of expanding any bento type
/// (micro/standard) into a full expanded view with cinematic transitions.
/// Supports both overlay and in-place expansion modes.
class BentoExpansionOrchestrator extends StatelessComponent {
  const BentoExpansionOrchestrator({
    required this.expandedProject,
    required this.sourcePosition,
    required this.onCollapse,
    this.config = BentoConfig.defaultConfig,
    this.expansionConfig = ExpansionConfig.defaultConfig,
    this.mode = ExpansionMode.overlay,
    super.key,
  });

  final ProjectModel? expandedProject;
  final BentoPosition? sourcePosition;
  final VoidCallback onCollapse;
  final BentoConfig config;
  final ExpansionConfig expansionConfig;
  final ExpansionMode mode;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    if (expandedProject == null) return;

    final isOverlay = mode == ExpansionMode.overlay;

    final orchestratorClasses = [
      'bento-expansion-orchestrator',
      if (isOverlay) 'bento-expansion-orchestrator--overlay',
      if (!isOverlay) 'bento-expansion-orchestrator--inplace',
      if (sourcePosition != null) 'bento-expansion-orchestrator--positioned',
    ].join(' ');

    yield div(classes: orchestratorClasses, [
      // Backdrop for overlay mode
      if (isOverlay)
        div(
          classes: 'bento-expansion-orchestrator__backdrop',
          events: {'click': (_) => onCollapse.call()},
          [],
        ),

      // Expanded bento with transition support
      ExpandedBento(
        project: expandedProject!,
        onCollapse: onCollapse,
        config: config,
        isOverlay: isOverlay,
        sourcePosition: sourcePosition,
        animationState: ExpansionAnimationState.expanded,
      ),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    // Base orchestrator container
    css('.bento-expansion-orchestrator').styles(
      position: Position.fixed(
        top: 0.px,
        left: 0.px,
        right: 0.px,
        bottom: 0.px,
      ),
      zIndex: const ZIndex(1000),
      display: Display.flex,
      alignItems: AlignItems.center,
      justifyContent: JustifyContent.center,
      pointerEvents: PointerEvents.auto,
    ),

    // Overlay mode styling
    css('.bento-expansion-orchestrator--overlay').styles(
      backgroundColor: const Color.rgba(0, 0, 0, 0.8),
      raw: const {
        'backdrop-filter': 'blur(8px)',
        'animation':
            'backdropFadeIn 400ms cubic-bezier(0.25, 0.46, 0.45, 0.94)',
      },
    ),

    // In-place mode styling
    css('.bento-expansion-orchestrator--inplace').styles(
      backgroundColor: const Color.rgba(0, 0, 0, 0),
      pointerEvents: PointerEvents.none,
    ),

    // Positioned expansion with simpler animation
    css('.bento-expansion-orchestrator--positioned .expanded-bento').styles(
      raw: const {
        'animation':
            'expandFromSource 500ms cubic-bezier(0.25, 0.46, 0.45, 0.94)',
        'transform-origin': 'center center',
      },
    ),

    // Enhanced backdrop with simpler gradient
    css('.bento-expansion-orchestrator__backdrop').styles(
      position: Position.absolute(
        top: 0.px,
        left: 0.px,
        right: 0.px,
        bottom: 0.px,
      ),
      cursor: Cursor.pointer,
      zIndex: const ZIndex(1),
      backgroundColor: const Color.rgba(0, 0, 0, 0.8),
      transition: const Transition('all', duration: 500),
    ),

    // Backdrop fade-in animation with simpler approach
    css('@keyframes backdropFadeIn', []).styles(
      raw: const {
        '0%': '''
          opacity: 0; 
          backdrop-filter: blur(0px);
          background: rgba(0, 0, 0, 0);
        ''',
        '100%': '''
          opacity: 1; 
          backdrop-filter: blur(8px);
          background: rgba(0, 0, 0, 0.8);
        ''',
      },
    ),

    // Enhanced expansion animation with simpler approach
    css('@keyframes expandFromSource', []).styles(
      raw: const {
        '0%': '''
          transform: scale(0.1);
          opacity: 0;
          border-radius: 12px;
          filter: blur(4px) brightness(0.8);
        ''',
        '20%': '''
          transform: scale(0.3);
          opacity: 0.4;
          border-radius: 14px;
          filter: blur(3px) brightness(0.9);
        ''',
        '50%': '''
          transform: scale(0.7);
          opacity: 0.8;
          border-radius: 18px;
          filter: blur(1px) brightness(1.0);
        ''',
        '80%': '''
          transform: scale(0.95);
          opacity: 0.95;
          border-radius: 22px;
          filter: blur(0px) brightness(1.05);
        ''',
        '100%': '''
          transform: scale(1);
          opacity: 1;
          border-radius: 24px;
          filter: blur(0px) brightness(1.0);
        ''',
      },
    ),

    // Enhanced collapse animation with simpler approach
    css('@keyframes collapseToSource', []).styles(
      raw: const {
        '0%': '''
          transform: scale(1);
          opacity: 1;
          border-radius: 24px;
          filter: blur(0px) brightness(1.0);
        ''',
        '20%': '''
          transform: scale(0.95);
          opacity: 0.95;
          border-radius: 22px;
          filter: blur(0px) brightness(1.05);
        ''',
        '50%': '''
          transform: scale(0.7);
          opacity: 0.8;
          border-radius: 18px;
          filter: blur(1px) brightness(1.0);
        ''',
        '80%': '''
          transform: scale(0.3);
          opacity: 0.4;
          border-radius: 14px;
          filter: blur(3px) brightness(0.9);
        ''',
        '100%': '''
          transform: scale(0.1);
          opacity: 0;
          border-radius: 12px;
          filter: blur(4px) brightness(0.8);
        ''',
      },
    ),

    // Responsive adjustments
    css.media(MediaQuery.screen(maxWidth: 768.px), [
      css(
        '.bento-expansion-orchestrator--overlay .expanded-bento',
      ).styles(margin: Margin.all(16.px), maxWidth: 90.vw, maxHeight: 90.vh),
    ]),

    // Reduced motion support
    css.media(MediaQuery.screen(), [
      css(
        '.bento-expansion-orchestrator--positioned .expanded-bento',
      ).styles(raw: const {'animation': 'none', 'transform': 'none'}),
      css(
        '.bento-expansion-orchestrator--overlay',
      ).styles(raw: const {'animation': 'none', 'backdrop-filter': 'none'}),
    ]),
  ];
}

/// Expansion modes for different use cases
enum ExpansionMode {
  /// Overlay mode: Expands over the entire viewport with backdrop
  overlay,

  /// In-place mode: Expands within the grid layout
  inplace,
}
