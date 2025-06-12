import 'package:jaspr/jaspr.dart';

import 'models/bento_config.dart';
import 'models/project_model.dart';

/// Medium-sized bento card for games, apps, and utilities with preview integration.
///
/// Simplified version that works with Jaspr's supported CSS properties.
class StandardBento extends StatelessComponent {
  const StandardBento({
    required this.project,
    this.onTap,
    this.onExpand,
    this.onHover,
    this.isDimmed = false,
    this.config = BentoConfig.defaultConfig,
    super.key,
  });

  final ProjectModel project;
  final void Function()? onTap;
  final void Function()? onExpand;
  final void Function(bool isHovered)? onHover;
  final bool isDimmed;
  final BentoConfig config;

  void _handleClick() {
    onTap?.call();
  }

  void _handleExpand() {
    onExpand?.call();
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

  String _getTypeClass() {
    switch (project.type.toLowerCase()) {
      case 'app':
        return 'standard-bento--app';
      case 'game':
        return 'standard-bento--game';
      case 'package':
      case 'library':
        return 'standard-bento--library';
      case 'bot':
      case 'utility':
      case 'web add-in':
        return 'standard-bento--utility';
      default:
        return 'standard-bento--default';
    }
  }

  String _formatNumber(int number) {
    if (number >= 1000000) {
      return '${(number / 1000000).toStringAsFixed(1)}M';
    } else if (number >= 1000) {
      return '${(number / 1000).toStringAsFixed(1)}k';
    }
    return number.toString();
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final cardClasses = [
      'standard-bento',
      _getTypeClass(),
      if (isDimmed) 'standard-bento--dimmed',
    ].join(' ');

    yield div(
      classes: cardClasses,
      events: {
        'click': (_) => _handleClick(),
        'mouseenter': (_) => _handleMouseEnter(),
        'mouseleave': (_) => _handleMouseLeave(),
      },
      [
        // Background overlay for cinematic depth
        div(classes: 'standard-bento__overlay', []),

        // Main content container
        div(classes: 'standard-bento__content', [
          // Header with icon and type
          div(classes: 'standard-bento__header', [
            div(classes: 'standard-bento__icon', [text(_getProjectIcon())]),
            div(classes: 'standard-bento__type', [
              text(project.type.toUpperCase()),
            ]),
          ]),

          // Project title
          h3(classes: 'standard-bento__title', [text(project.title)]),

          // Project description
          p(classes: 'standard-bento__description', [
            text(project.description),
          ]),

          // Contributors
          if (project.contributors.isNotEmpty)
            div(classes: 'standard-bento__contributors', [
              span(classes: 'standard-bento__contributors-label', [
                text('by '),
              ]),
              span(classes: 'standard-bento__contributors-list', [
                text(project.contributors.take(2).join(', ')),
                if (project.contributors.length > 2)
                  text(' +${project.contributors.length - 2}'),
              ]),
            ]),
        ]),

        // Footer with metrics and actions
        div(classes: 'standard-bento__footer', [
          // Metrics
          if (project.metrics.hasMetrics)
            div(classes: 'standard-bento__metrics', [
              if (project.metrics.stars > 0)
                span(classes: 'standard-bento__metric', [
                  text('⭐ ${_formatNumber(project.metrics.stars)}'),
                ]),
              if (project.metrics.downloads > 0)
                span(classes: 'standard-bento__metric', [
                  text('⬇ ${_formatNumber(project.metrics.downloads)}'),
                ]),
              if (project.metrics.forks > 0)
                span(classes: 'standard-bento__metric', [
                  text('🍴 ${_formatNumber(project.metrics.forks)}'),
                ]),
            ]),

          // Action buttons (shown on hover)
          div(classes: 'standard-bento__actions', [
            if (project.links.demoUrl.isNotEmpty)
              a(
                classes: 'standard-bento__action-btn',
                href: project.links.demoUrl,
                target: Target.blank,
                [text('Demo')],
              ),
            if (project.links.website.isNotEmpty)
              a(
                classes: 'standard-bento__action-btn',
                href: project.links.website,
                target: Target.blank,
                [text('Live')],
              ),
            if (onExpand != null)
              button(
                classes:
                    'standard-bento__action-btn standard-bento__expand-btn',
                events: {'click': (_) => _handleExpand()},
                [text('Expand')],
              ),
          ]),
        ]),
      ],
    );
  }

  @css
  static List<StyleRule> get styles => [
    // Base standard bento styles
    css('.standard-bento').styles(
      backgroundColor: const Color('#E8E2D8'), // soft-linen
      radius: BorderRadius.circular(16.px),
      padding: Padding.all(24.px),
      cursor: Cursor.pointer,
      transition: const Transition('all', duration: 300),
      display: Display.flex,
      flexDirection: FlexDirection.column,
      justifyContent: JustifyContent.spaceBetween,
      position: Position.relative(),
      overflow: Overflow.hidden,
      minHeight: 280.px,
      border: Border(
        style: BorderStyle.solid,
        color: const Color.rgba(139, 69, 19, 0.15),
        width: 1.px,
      ),
    ),

    // Background overlay for cinematic depth
    css('.standard-bento__overlay').styles(
      position: Position.absolute(
        top: 0.px,
        left: 0.px,
        right: 0.px,
        bottom: 0.px,
      ),
      backgroundImage: const ImageStyle.url(
        'linear-gradient(135deg, rgba(245, 241, 235, 0.1) 0%, rgba(230, 177, 122, 0.05) 100%)',
      ),
      opacity: 0,
      transition: const Transition('opacity', duration: 300),
      pointerEvents: PointerEvents.none,
    ),

    // Hover state
    css('.standard-bento:hover').styles(
      backgroundColor: const Color('#E6B17A'), // creamy-amber
      transform: Transform.translate(y: (-6).px),
      shadow: BoxShadow.combine([
        BoxShadow(
          offsetX: 0.px,
          offsetY: 20.px,
          blur: 50.px,
          color: const Color.rgba(44, 24, 16, 0.25),
        ),
      ]),
      border: Border(
        style: BorderStyle.solid,
        color: const Color.rgba(139, 69, 19, 0.3),
        width: 1.px,
      ),
    ),

    css('.standard-bento:hover .standard-bento__overlay').styles(opacity: 1),

    // Dimmed state
    css('.standard-bento--dimmed').styles(opacity: 0.4),

    // Main content
    css('.standard-bento__content').styles(
      display: Display.flex,
      flexDirection: FlexDirection.column,
      flex: Flex(grow: 1),
      position: Position.relative(),
      zIndex: const ZIndex(2),
    ),

    // Header
    css('.standard-bento__header').styles(
      display: Display.flex,
      alignItems: AlignItems.center,
      justifyContent: JustifyContent.spaceBetween,
      margin: Margin.only(bottom: 16.px),
    ),

    css('.standard-bento__icon').styles(fontSize: 32.px, lineHeight: 1.px),

    css('.standard-bento__type').styles(
      fontSize: 10.px,
      fontWeight: FontWeight.w600,
      color: const Color('#9B8B7A'), // grain-muted
      letterSpacing: 0.05.em,
      padding: Padding.symmetric(horizontal: 8.px, vertical: 4.px),
      radius: BorderRadius.circular(12.px),
      backgroundColor: const Color.rgba(155, 139, 122, 0.1),
    ),

    // Title
    css('.standard-bento__title').styles(
      fontSize: 20.px,
      fontWeight: FontWeight.w600,
      color: const Color('#2C1810'), // deep-espresso
      margin: Margin.only(bottom: 12.px),
      lineHeight: 1.3.px,
      transition: const Transition('color', duration: 300),
    ),

    css('.standard-bento:hover .standard-bento__title').styles(
      color: const Color('#F5F1EB'), // warm-paper
    ),

    // Description
    css('.standard-bento__description').styles(
      fontSize: 14.px,
      lineHeight: 1.5.px,
      color: const Color('#9B8B7A'), // grain-muted
      margin: Margin.only(bottom: 16.px),
      flex: Flex(grow: 1),
      transition: const Transition('color', duration: 300),
      overflow: Overflow.hidden,
    ),

    css('.standard-bento:hover .standard-bento__description').styles(
      color: const Color('#F5F1EB'), // warm-paper
    ),

    // Contributors
    css('.standard-bento__contributors').styles(
      fontSize: 12.px,
      color: const Color('#8B4513'), // warm-copper
      margin: Margin.only(bottom: 16.px),
      transition: const Transition('color', duration: 300),
    ),

    css(
      '.standard-bento__contributors-label',
    ).styles(fontWeight: FontWeight.w400),

    css(
      '.standard-bento__contributors-list',
    ).styles(fontWeight: FontWeight.w500),

    css('.standard-bento:hover .standard-bento__contributors').styles(
      color: const Color('#F5F1EB'), // warm-paper
    ),

    // Footer
    css('.standard-bento__footer').styles(
      display: Display.flex,
      alignItems: AlignItems.center,
      justifyContent: JustifyContent.spaceBetween,
      margin: Margin.only(top: 16.px),
    ),

    // Metrics
    css('.standard-bento__metrics').styles(
      display: Display.flex,
      alignItems: AlignItems.center,
      gap: Gap.all(12.px),
    ),

    css('.standard-bento__metric').styles(
      fontSize: 11.px,
      fontWeight: FontWeight.w500,
      color: const Color('#8B4513'), // warm-copper
      transition: const Transition('color', duration: 300),
    ),

    css('.standard-bento:hover .standard-bento__metric').styles(
      color: const Color('#F5F1EB'), // warm-paper
    ),

    // Actions
    css('.standard-bento__actions').styles(
      display: Display.flex,
      alignItems: AlignItems.center,
      gap: Gap.all(8.px),
      opacity: 0,
      transform: Transform.translate(y: 10.px),
      transition: const Transition('all', duration: 250),
    ),

    css(
      '.standard-bento:hover .standard-bento__actions',
    ).styles(opacity: 1, transform: Transform.translate(y: 0.px)),

    css('.standard-bento__action-btn').styles(
      fontSize: 11.px,
      fontWeight: FontWeight.w600,
      color: const Color('#2C1810'), // deep-espresso
      backgroundColor: const Color('#F5F1EB'), // warm-paper
      padding: Padding.symmetric(horizontal: 12.px, vertical: 6.px),
      radius: BorderRadius.circular(16.px),
      border: Border.none,
      cursor: Cursor.pointer,
      transition: const Transition('all', duration: 200),
      textDecoration: TextDecoration.none,
    ),

    css('.standard-bento__action-btn:hover').styles(
      backgroundColor: const Color('#E6B17A'), // creamy-amber
      transform: Transform.scale(1.05),
    ),

    // Project type color variants
    css('.standard-bento--app .standard-bento__type').styles(
      backgroundColor: const Color.rgba(30, 64, 175, 0.1), // blue
      color: const Color('#1e40af'),
    ),

    css('.standard-bento--game .standard-bento__type').styles(
      backgroundColor: const Color.rgba(107, 33, 168, 0.1), // purple
      color: const Color('#6b21a8'),
    ),

    css('.standard-bento--library .standard-bento__type').styles(
      backgroundColor: const Color.rgba(22, 101, 52, 0.1), // green
      color: const Color('#166534'),
    ),

    css('.standard-bento--utility .standard-bento__type').styles(
      backgroundColor: const Color.rgba(55, 48, 163, 0.1), // indigo
      color: const Color('#3730a3'),
    ),

    css('.standard-bento--default .standard-bento__type').styles(
      backgroundColor: const Color.rgba(31, 41, 55, 0.1), // gray
      color: const Color('#1f2937'),
    ),
  ];
}
