import 'package:jaspr/jaspr.dart';
import 'package:universal_web/web.dart' as html;

import 'models/bento_config.dart';
import 'models/project_model.dart';

/// Ultra-compact bento card for quick scanning of library projects.
///
/// Enhanced with expansion capabilities - can transform into ExpandedBento
/// with smooth position-aware transitions. Optimized for displaying
/// package/library information in minimal space with click-to-expand functionality.
class MicroBento extends StatelessComponent {
  const MicroBento({
    required this.project,
    this.onTap,
    this.onExpand,
    this.onHover,
    this.isDimmed = false,
    this.config = BentoConfig.defaultConfig,
    this.enableExpansion = true,
    super.key,
  });

  final ProjectModel project;
  final void Function()? onTap;
  final void Function(BentoPosition position)? onExpand;
  final void Function(bool isHovered)? onHover;
  final bool isDimmed;
  final BentoConfig config;
  final bool enableExpansion;

  void _handleClick() {
    if (onExpand != null) {
      _getElementPosition().then((position) {
        if (position != null) {
          onExpand!(position);
        }
      });
    }
  }

  void _handleMouseEnter() {
    onHover?.call(true);
  }

  void _handleMouseLeave() {
    onHover?.call(false);
  }

  /// Get the current position of this bento for transition calculations
  Future<BentoPosition?> _getElementPosition() async {
    try {
      // Use the unique project ID to find the specific element
      final element = html.document.querySelector(
        '[data-project-id="${project.id.value}"]',
      );

      if (element != null) {
        final rect = element.getBoundingClientRect();
        // Use screen coordinates for better accuracy
        return BentoPosition(
          x: rect.left.toDouble(),
          y: rect.top.toDouble(),
          width: rect.width.toDouble(),
          height: rect.height.toDouble(),
        );
      }
    } catch (e) {
      // Fallback for development/testing
      print('Could not get element position for ${project.title}: $e');
    }

    // Fallback position if element not found - center of screen
    return const BentoPosition(x: 200, y: 200, width: 120, height: 120);
  }

  String _getProjectIcon() {
    if (project.isLibrary) {
      return '📦';
    } else if (project.isApp) {
      return '📱';
    } else if (project.isGame) {
      return '🎮';
    } else if (project.type.toLowerCase() == 'bot') {
      return '🤖';
    } else if (project.type.toLowerCase().contains('web add-in')) {
      return '🔧';
    }
    return '⚡';
  }

  String _formatNumber(int number) {
    if (number >= 1000) {
      return '${(number / 1000).toStringAsFixed(1)}k';
    }
    return number.toString();
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final cardClasses = [
      'micro-bento',
      if (isDimmed) 'micro-bento--dimmed',
      if (enableExpansion) 'micro-bento--expandable',
    ].join(' ');

    yield div(
      classes: cardClasses,
      attributes: {'data-project-id': project.id.value},
      events: {
        'click': (_) => _handleClick(),
        'mouseenter': (_) => _handleMouseEnter(),
        'mouseleave': (_) => _handleMouseLeave(),
      },
      [
        // Expansion indicator overlay
        if (enableExpansion)
          div(classes: 'micro-bento__expansion-overlay', [
            div(classes: 'micro-bento__expansion-hint', [
              text('Click to expand'),
            ]),
          ]),

        // Project Icon with enhanced styling
        div(classes: 'micro-bento__icon', [text(_getProjectIcon())]),

        // Project Name (truncated)
        div(classes: 'micro-bento__name', [text(project.title)]),

        // Project Type Badge
        div(classes: 'micro-bento__type', [text(project.type.toUpperCase())]),

        // Metrics Indicator (if available)
        if (project.metrics.hasMetrics)
          div(classes: 'micro-bento__metrics', [
            if (project.metrics.stars > 0)
              span(classes: 'micro-bento__stars', [
                text('⭐ ${project.metrics.stars}'),
              ]),
            if (project.metrics.downloads > 0)
              span(classes: 'micro-bento__downloads', [
                text('⬇ ${_formatNumber(project.metrics.downloads)}'),
              ]),
          ]),

        // Expansion button (visible on hover)
        if (enableExpansion)
          button(
            classes: 'micro-bento__expand-btn',
            events: {'click': (_) => _handleClick()},
            [text('⤢')],
          ),
      ],
    );
  }

  @css
  static List<StyleRule> get styles => [
    // Base micro bento styles with expansion support
    css('.micro-bento').styles(
      backgroundColor: const Color('#E8E2D8'), // soft-linen
      radius: BorderRadius.circular(12.px),
      padding: Padding.all(12.px),
      cursor: Cursor.pointer,
      transition: const Transition('all', duration: 200),
      display: Display.flex,
      flexDirection: FlexDirection.column,
      alignItems: AlignItems.center,
      justifyContent: JustifyContent.center,
      textAlign: TextAlign.center,
      overflow: Overflow.hidden,
      minHeight: 120.px,
      minWidth: 120.px,
      position: Position.relative(),
      border: Border(
        style: BorderStyle.solid,
        color: const Color('#9B8B7A'), // grain-muted
        width: 2.px,
      ),
    ),

    // Enhanced hover state with expansion hint
    css('.micro-bento:hover').styles(
      backgroundColor: const Color('#E6B17A'), // creamy-amber
      transform: Transform.scale(1.05),
      shadow: BoxShadow.combine([
        BoxShadow(
          offsetX: 0.px,
          offsetY: 4.px,
          blur: 12.px,
          color: const Color.rgba(44, 24, 16, 0.2),
        ),
      ]),
    ),

    // Expandable variant styling with enhanced feedback
    css('.micro-bento--expandable').styles(
      cursor: Cursor.pointer,
      raw: const {
        'transition': 'all 200ms cubic-bezier(0.25, 0.46, 0.45, 0.94)',
      },
    ),

    css('.micro-bento--expandable:hover').styles(
      raw: const {'transform': 'scale(1.08) translateY(-2px)'},
      border: Border(
        style: BorderStyle.solid,
        color: const Color('#8B4513'), // warm-copper
        width: 2.px,
      ),
    ),

    // Expansion overlay with enhanced animation
    css('.micro-bento__expansion-overlay').styles(
      position: Position.absolute(
        top: 0.px,
        left: 0.px,
        right: 0.px,
        bottom: 0.px,
      ),
      backgroundColor: const Color.rgba(44, 24, 16, 0.9),
      display: Display.flex,
      alignItems: AlignItems.center,
      justifyContent: JustifyContent.center,
      opacity: 0,
      transition: const Transition('all', duration: 300),
      pointerEvents: PointerEvents.none,
      raw: const {'backdrop-filter': 'blur(2px)', 'transform': 'scale(0.9)'},
    ),

    css(
      '.micro-bento--expandable:hover .micro-bento__expansion-overlay',
    ).styles(opacity: 1, raw: const {'transform': 'scale(1)'}),

    css('.micro-bento__expansion-hint').styles(
      fontSize: 10.px,
      fontWeight: FontWeight.w600,
      color: const Color('#F5F1EB'), // warm-paper
      textAlign: TextAlign.center,
      padding: Padding.all(4.px),
      raw: const {'animation': 'pulseGlow 2s ease-in-out infinite'},
    ),

    // Enhanced expansion button with better positioning
    css('.micro-bento__expand-btn').styles(
      position: Position.absolute(bottom: 4.px, right: 4.px),
      width: 20.px,
      height: 20.px,
      backgroundColor: const Color.rgba(139, 69, 19, 0.8),
      border: Border.none,
      radius: BorderRadius.circular(50.percent),
      color: const Color('#F5F1EB'), // warm-paper
      fontSize: 10.px,
      cursor: Cursor.pointer,
      opacity: 0,
      transition: const Transition('all', duration: 200),
      display: Display.flex,
      alignItems: AlignItems.center,
      justifyContent: JustifyContent.center,
      raw: const {'transform': 'scale(0.8) rotate(-45deg)'},
    ),

    css(
      '.micro-bento--expandable:hover .micro-bento__expand-btn',
    ).styles(opacity: 1, raw: const {'transform': 'scale(1.1) rotate(0deg)'}),

    // Pulse glow animation for expansion hint
    css('@keyframes pulseGlow', []).styles(
      raw: const {
        '0%, 100%': 'opacity: 1; text-shadow: 0 0 5px rgba(245, 241, 235, 0.5)',
        '50%': 'opacity: 0.7; text-shadow: 0 0 10px rgba(245, 241, 235, 0.8)',
      },
    ),

    // Enhanced icon animation on hover
    css('.micro-bento--expandable:hover .micro-bento__icon').styles(
      transform: Transform.scale(1.1),
      raw: const {'animation': 'iconBounce 0.6s ease-in-out'},
    ),

    // Icon bounce animation
    css('@keyframes iconBounce', []).styles(
      raw: const {
        '0%, 100%': 'transform: scale(1.1)',
        '50%': 'transform: scale(1.2) translateY(-2px)',
      },
    ),

    // Dimmed state
    css('.micro-bento--dimmed').styles(opacity: 0.6),

    // Project icon with enhanced styling
    css('.micro-bento__icon').styles(
      fontSize: 24.px,
      margin: Margin.only(bottom: 8.px),
      transition: const Transition('transform', duration: 200),
    ),

    // Project name
    css('.micro-bento__name').styles(
      fontSize: 11.px,
      fontWeight: FontWeight.w600,
      color: const Color('#2C1810'), // deep-espresso
      margin: Margin.only(bottom: 4.px),
      textAlign: TextAlign.center,
      lineHeight: 1.2.px,
    ),

    // Project type
    css('.micro-bento__type').styles(
      fontSize: 9.px,
      fontWeight: FontWeight.w400,
      color: const Color('#9B8B7A'), // grain-muted
      margin: Margin.only(bottom: 6.px),
    ),

    // Metrics container
    css('.micro-bento__metrics').styles(
      display: Display.flex,
      flexDirection: FlexDirection.column,
      alignItems: AlignItems.center,
      fontSize: 8.px,
      color: const Color('#8B4513'), // warm-copper
    ),

    // Stars and downloads
    css(
      '.micro-bento__stars, .micro-bento__downloads',
    ).styles(fontWeight: FontWeight.w500),

    // Active/pressed state for better feedback
    css('.micro-bento--expandable:active').styles(
      transform: Transform.scale(1.02),
      transition: const Transition('transform', duration: 100),
    ),
  ];
}
