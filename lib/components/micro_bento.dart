import 'package:jaspr/jaspr.dart';

import 'models/bento_config.dart';
import 'models/project_model.dart';

/// Ultra-compact bento card for quick scanning of library projects.
///
/// Designed for 1x1 grid units with hover effects and accessibility features.
/// Optimized for displaying package/library information in minimal space.
class MicroBento extends StatelessComponent {
  const MicroBento({
    required this.project,
    this.onTap,
    this.onHover,
    this.isDimmed = false,
    this.config = BentoConfig.defaultConfig,
    super.key,
  });

  final ProjectModel project;
  final void Function()? onTap;
  final void Function(bool isHovered)? onHover;
  final bool isDimmed;
  final BentoConfig config;

  void _handleClick() {
    onTap?.call();
  }

  void _handleMouseEnter() {
    onHover?.call(true);
  }

  void _handleMouseLeave() {
    onHover?.call(false);
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
    ].join(' ');

    yield div(
      classes: cardClasses,
      events: {
        'click': (_) => _handleClick(),
        'mouseenter': (_) => _handleMouseEnter(),
        'mouseleave': (_) => _handleMouseLeave(),
      },
      [
        // Project Icon
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
      ],
    );
  }

  @css
  static List<StyleRule> get styles => [
    // Base micro bento styles
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
      border: Border(
        style: BorderStyle.solid,
        color: const Color('#9B8B7A'), // grain-muted
        width: 2.px,
      ),
    ),

    // Hover state
    css('.micro-bento:hover').styles(
      backgroundColor: const Color('#E6B17A'), // creamy-amber
      transform: Transform.scale(1.05),
    ),

    // Dimmed state
    css('.micro-bento--dimmed').styles(opacity: 0.6),

    // Project icon
    css('.micro-bento__icon').styles(
      fontSize: 24.px,
      margin: Margin.only(bottom: 8.px),
    ),

    // Project name
    css('.micro-bento__name').styles(
      fontSize: 11.px,
      fontWeight: FontWeight.w600,
      color: const Color('#2C1810'), // deep-espresso
      margin: Margin.only(bottom: 4.px),
      textAlign: TextAlign.center,
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
  ];
}
