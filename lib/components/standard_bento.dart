import 'package:jaspr/jaspr.dart';
import 'package:universal_web/web.dart' as html;

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
    this.enableExpansion = true,
    super.key,
  });

  final ProjectModel project;
  final void Function()? onTap;
  final void Function(BentoPosition)? onExpand;
  final void Function(bool)? onHover;
  final bool isDimmed;
  final BentoConfig config;
  final bool enableExpansion;

  void _handleClick() {
    if (onExpand != null) {
      _handleExpand();
    }
  }

  void _handleExpand() {
    if (onExpand != null) {
      _getElementPosition().then((position) {
        if (position != null) {
          onExpand!(position);
        }
      });
    }
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
    return const BentoPosition(x: 300, y: 200, width: 200, height: 280);
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
      attributes: {'data-project-id': project.id.value},
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
    // Base standard bento styles with improved visual hierarchy
    css('.standard-bento').styles(
      backgroundColor: const Color('#E8E2D8'), // soft-linen
      radius: BorderRadius.circular(16.px),
      padding: Padding.all(20.px),
      cursor: Cursor.pointer,
      transition: const Transition('all', duration: 300),
      display: Display.flex,
      flexDirection: FlexDirection.column,
      justifyContent: JustifyContent.spaceBetween,
      position: Position.relative(),
      overflow: Overflow.hidden,
      // Remove fixed dimensions - let grid control sizing
      width: 100.percent,
      height: 100.percent,
      minHeight: 200.px,
      border: Border(
        style: BorderStyle.solid,
        color: const Color.rgba(139, 69, 19, 0.15),
        width: 1.px,
      ),
    ),

    // Background overlay for depth
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

    // Hover state with enhanced elevation
    css('.standard-bento:hover').styles(
      backgroundColor: const Color('#E6B17A'), // creamy-amber
      transform: Transform.translate(y: (-2).px),
      shadow: BoxShadow.combine([
        BoxShadow(
          offsetX: 0.px,
          offsetY: 8.px,
          blur: 24.px,
          color: const Color.rgba(44, 24, 16, 0.15),
        ),
      ]),
    ),

    css('.standard-bento:hover .standard-bento__overlay').styles(opacity: 1),

    // Dimmed state for hover effects
    css(
      '.standard-bento--dimmed',
    ).styles(opacity: 0.7, transform: Transform.scale(0.98)),

    // Content container
    css('.standard-bento__content').styles(
      display: Display.flex,
      flexDirection: FlexDirection.column,
      height: 100.percent,
      position: Position.relative(),
      zIndex: const ZIndex(1),
    ),

    // Header with icon and type
    css('.standard-bento__header').styles(
      display: Display.flex,
      alignItems: AlignItems.center,
      justifyContent: JustifyContent.spaceBetween,
      margin: Margin.only(bottom: 12.px),
    ),

    css('.standard-bento__icon').styles(fontSize: 28.px, lineHeight: 1.px),

    css('.standard-bento__type').styles(
      fontSize: 10.px,
      fontWeight: FontWeight.w600,
      color: const Color('#8B4513'), // warm-copper
      letterSpacing: 0.05.em,
    ),

    // Project title
    css('.standard-bento__title').styles(
      fontSize: 18.px,
      fontWeight: FontWeight.w600,
      color: const Color('#2C1810'), // deep-espresso
      margin: Margin.only(bottom: 8.px),
      lineHeight: 1.3.px,
    ),

    // Project description
    css('.standard-bento__description').styles(
      fontSize: 13.px,
      color: const Color('#5D4E37'), // coffee-bean
      lineHeight: 1.4.px,
      margin: Margin.only(bottom: 12.px),
      flex: Flex(grow: 1),
      // Limit to 3 lines with ellipsis
      raw: const {
        'display': '-webkit-box',
        '-webkit-line-clamp': '3',
        '-webkit-box-orient': 'vertical',
        'overflow': 'hidden',
      },
    ),

    // Contributors
    css('.standard-bento__contributors').styles(
      fontSize: 11.px,
      color: const Color('#8B4513'), // warm-copper
      margin: Margin.only(bottom: 16.px),
    ),

    css(
      '.standard-bento__contributors-label',
    ).styles(fontWeight: FontWeight.w400),

    css(
      '.standard-bento__contributors-list',
    ).styles(fontWeight: FontWeight.w600),

    // Footer with metrics and actions
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
      display: Display.flex,
      alignItems: AlignItems.center,
      gap: Gap.all(4.px),
      fontSize: 11.px,
      color: const Color('#8B4513'), // warm-copper
      fontWeight: FontWeight.w500,
    ),

    // Action buttons
    css('.standard-bento__actions').styles(
      display: Display.flex,
      alignItems: AlignItems.center,
      gap: Gap.all(8.px),
    ),

    css('.standard-bento__action-btn').styles(
      padding: Padding.symmetric(horizontal: 12.px, vertical: 6.px),
      backgroundColor: const Color.rgba(139, 69, 19, 0.1),
      radius: BorderRadius.circular(20.px),
      fontSize: 11.px,
      fontWeight: FontWeight.w600,
      color: const Color('#8B4513'), // warm-copper
      border: Border.none,
      cursor: Cursor.pointer,
      transition: const Transition('all', duration: 200),
      textDecoration: TextDecoration.none,
    ),

    css('.standard-bento__action-btn:hover').styles(
      backgroundColor: const Color('#8B4513'), // warm-copper
      color: const Color('#F5F1EB'), // warm-paper
      transform: Transform.scale(1.05),
    ),

    // Enhanced expand button styling
    css('.standard-bento__expand-btn').styles(
      backgroundColor: const Color.rgba(139, 69, 19, 0.15),
      border: Border(
        style: BorderStyle.solid,
        color: const Color.rgba(139, 69, 19, 0.3),
        width: 1.px,
      ),
      position: Position.relative(),
      overflow: Overflow.hidden,
    ),

    css('.standard-bento__expand-btn:hover').styles(
      backgroundColor: const Color('#8B4513'), // warm-copper
      border: Border(
        style: BorderStyle.solid,
        color: const Color('#8B4513'),
        width: 1.px,
      ),
      shadow: BoxShadow.combine([
        BoxShadow(
          offsetX: 0.px,
          offsetY: 2.px,
          blur: 8.px,
          color: const Color.rgba(139, 69, 19, 0.3),
        ),
      ]),
    ),

    css('.standard-bento__expand-btn::before').styles(
      raw: const {
        'content': '""',
        'position': 'absolute',
        'top': '0',
        'left': '-100%',
        'width': '100%',
        'height': '100%',
        'background':
            'linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent)',
        'transition': 'left 0.5s',
      },
    ),

    css(
      '.standard-bento__expand-btn:hover::before',
    ).styles(raw: const {'left': '100%'}),

    // Type-specific styling
    css('.standard-bento--app').styles(
      border: Border(
        style: BorderStyle.solid,
        color: const Color.rgba(59, 130, 246, 0.3),
        width: 1.px,
      ),
    ),

    css('.standard-bento--game').styles(
      border: Border(
        style: BorderStyle.solid,
        color: const Color.rgba(147, 51, 234, 0.3),
        width: 1.px,
      ),
    ),

    css('.standard-bento--library').styles(
      border: Border(
        style: BorderStyle.solid,
        color: const Color.rgba(34, 197, 94, 0.3),
        width: 1.px,
      ),
    ),

    css('.standard-bento--utility').styles(
      border: Border(
        style: BorderStyle.solid,
        color: const Color.rgba(99, 102, 241, 0.3),
        width: 1.px,
      ),
    ),
  ];
}
