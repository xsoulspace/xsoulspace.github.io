import 'package:jaspr/jaspr.dart';

import 'models/bento_config.dart';
import 'models/project_model.dart';

/// Full-featured expanded bento card for showcasing projects with live previews.
///
/// Designed for 2x3 or 3x2 grid units with comprehensive project information,
/// interactive elements, and cinematic presentation. Follows Jaspr CSS constraints.
class ExpandedBento extends StatelessComponent {
  const ExpandedBento({
    required this.project,
    required this.onCollapse,
    this.onHover,
    this.config = BentoConfig.defaultConfig,
    super.key,
  });

  final ProjectModel project;
  final VoidCallback onCollapse;
  final void Function(bool isHovered)? onHover;
  final BentoConfig config;

  void _handleCollapse() {
    onCollapse();
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
        return 'expanded-bento--app';
      case 'game':
        return 'expanded-bento--game';
      case 'package':
      case 'library':
        return 'expanded-bento--library';
      case 'bot':
      case 'utility':
      case 'web add-in':
        return 'expanded-bento--utility';
      default:
        return 'expanded-bento--default';
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
    final cardClasses = ['expanded-bento', _getTypeClass()].join(' ');

    yield div(
      classes: cardClasses,
      events: {
        'mouseenter': (_) => _handleMouseEnter(),
        'mouseleave': (_) => _handleMouseLeave(),
      },
      [
        // Background overlay for cinematic depth
        div(classes: 'expanded-bento__overlay', []),

        // Close button
        button(
          classes: 'expanded-bento__close-btn',
          events: {'click': (_) => _handleCollapse()},
          [text('✕')],
        ),

        // Main content container
        div(classes: 'expanded-bento__content', [
          // Header section
          _buildExpandedHeader(),

          // Live preview section
          _buildLivePreview(),

          // Footer section
          _buildExpandedFooter(),
        ]),
      ],
    );
  }

  Component _buildExpandedHeader() {
    return div(classes: 'expanded-bento__header', [
      // Project icon and title
      div(classes: 'expanded-bento__title-section', [
        div(classes: 'expanded-bento__icon', [text(_getProjectIcon())]),
        div(classes: 'expanded-bento__title-group', [
          h2(classes: 'expanded-bento__title', [text(project.title)]),
          div(classes: 'expanded-bento__type', [
            text(project.type.toUpperCase()),
          ]),
        ]),
      ]),

      // Contributors
      if (project.contributors.isNotEmpty)
        div(classes: 'expanded-bento__contributors', [
          span(classes: 'expanded-bento__contributors-label', [text('by ')]),
          span(classes: 'expanded-bento__contributors-list', [
            text(project.contributors.take(3).join(', ')),
            if (project.contributors.length > 3)
              text(' +${project.contributors.length - 3}'),
          ]),
        ]),
    ]);
  }

  Component _buildLivePreview() {
    return div(classes: 'expanded-bento__preview', [
      // Preview content based on available media
      if (project.hasInteractiveDemo && project.links.hasLivePreview)
        _buildInteractivePreview()
      else if (project.previewContent.hasVideo)
        _buildVideoPreview()
      else if (project.previewContent.hasGif)
        _buildGifPreview()
      else if (project.screenshots.isNotEmpty)
        _buildImageGallery()
      else if (project.previewContent.hasThumbnail)
        _buildThumbnailPreview()
      else
        _buildFallbackPreview(),

      // Preview overlay with project description
      div(classes: 'expanded-bento__preview-overlay', [
        p(classes: 'expanded-bento__description', [text(project.description)]),
      ]),
    ]);
  }

  Component _buildInteractivePreview() {
    return div(classes: 'expanded-bento__interactive-preview', [
      // Interactive demo iframe
      div(classes: 'expanded-bento__iframe-container', [
        text('🌐 Interactive Demo Available'),
        p([text('Click "Live Demo" to experience the full application')]),
      ]),
    ]);
  }

  Component _buildVideoPreview() {
    return div(classes: 'expanded-bento__video-preview', [
      img(
        classes: 'expanded-bento__preview-media',
        src: project.previewContent.thumbnailUrl.isNotEmpty
            ? project.previewContent.thumbnailUrl
            : project.coverImage,
        alt: '${project.title} preview',
      ),
      div(classes: 'expanded-bento__video-indicator', [text('▶️ Video Demo')]),
    ]);
  }

  Component _buildGifPreview() {
    return div(classes: 'expanded-bento__gif-preview', [
      img(
        classes: 'expanded-bento__preview-media',
        src: project.previewContent.gifUrl,
        alt: '${project.title} animated preview',
      ),
    ]);
  }

  Component _buildImageGallery() {
    return div(classes: 'expanded-bento__image-gallery', [
      // Primary screenshot
      img(
        classes: 'expanded-bento__preview-media',
        src: project.screenshots.first,
        alt: '${project.title} screenshot',
      ),
      // Gallery indicator
      if (project.screenshots.length > 1)
        div(classes: 'expanded-bento__gallery-indicator', [
          text('📸 ${project.screenshots.length} Screenshots'),
        ]),
    ]);
  }

  Component _buildThumbnailPreview() {
    return div(classes: 'expanded-bento__thumbnail-preview', [
      img(
        classes: 'expanded-bento__preview-media',
        src: project.previewContent.thumbnailUrl,
        alt: '${project.title} thumbnail',
      ),
    ]);
  }

  Component _buildFallbackPreview() {
    return div(classes: 'expanded-bento__fallback-preview', [
      div(classes: 'expanded-bento__fallback-icon', [text(_getProjectIcon())]),
      p(classes: 'expanded-bento__fallback-text', [
        text('Preview not available'),
      ]),
    ]);
  }

  Component _buildExpandedFooter() {
    return div(classes: 'expanded-bento__footer', [
      // Technology tags
      if (project.tags.isNotEmpty)
        div(classes: 'expanded-bento__tags', [
          ...project.tags
              .take(6)
              .map((tag) => span(classes: 'expanded-bento__tag', [text(tag)])),
          if (project.tags.length > 6)
            span(classes: 'expanded-bento__tag expanded-bento__tag--more', [
              text('+${project.tags.length - 6}'),
            ]),
        ]),

      // Metrics and actions row
      div(classes: 'expanded-bento__bottom-row', [
        // Project metrics
        if (project.metrics.hasMetrics)
          div(classes: 'expanded-bento__metrics', [
            if (project.metrics.stars > 0)
              span(classes: 'expanded-bento__metric', [
                text('⭐ ${_formatNumber(project.metrics.stars)}'),
              ]),
            if (project.metrics.downloads > 0)
              span(classes: 'expanded-bento__metric', [
                text('⬇ ${_formatNumber(project.metrics.downloads)}'),
              ]),
            if (project.metrics.forks > 0)
              span(classes: 'expanded-bento__metric', [
                text('🍴 ${_formatNumber(project.metrics.forks)}'),
              ]),
            if (project.metrics.issues > 0)
              span(classes: 'expanded-bento__metric', [
                text('🐛 ${_formatNumber(project.metrics.issues)}'),
              ]),
          ]),

        // Action buttons
        div(classes: 'expanded-bento__actions', [
          if (project.links.hasLivePreview)
            a(
              classes:
                  'expanded-bento__action-btn expanded-bento__action-btn--primary',
              href: project.links.livePreviewUrl,
              target: Target.blank,
              [text('Live Demo')],
            ),
          if (project.links.hasDemo && !project.links.hasLivePreview)
            a(
              classes:
                  'expanded-bento__action-btn expanded-bento__action-btn--primary',
              href: project.links.demoUrl,
              target: Target.blank,
              [text('Demo')],
            ),
          if (project.repository.isNotEmpty)
            a(
              classes: 'expanded-bento__action-btn',
              href: project.repository,
              target: Target.blank,
              [text('Source')],
            ),
          if (project.links.website.isNotEmpty)
            a(
              classes: 'expanded-bento__action-btn',
              href: project.links.website,
              target: Target.blank,
              [text('Website')],
            ),
          if (project.links.pubDev.isNotEmpty)
            a(
              classes: 'expanded-bento__action-btn',
              href: project.links.pubDev,
              target: Target.blank,
              [text('pub.dev')],
            ),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    // Base expanded bento styles
    css('.expanded-bento').styles(
      backgroundColor: const Color('#E8E2D8'), // soft-linen
      radius: BorderRadius.circular(24.px),
      padding: Padding.all(32.px),
      position: Position.relative(),
      overflow: Overflow.hidden,
      minHeight: 500.px,
      minWidth: 600.px,
      maxWidth: 800.px,
      maxHeight: 600.px,
      border: Border(
        style: BorderStyle.solid,
        color: const Color.rgba(139, 69, 19, 0.2),
        width: 2.px,
      ),
      shadow: BoxShadow.combine([
        BoxShadow(
          offsetX: 0.px,
          offsetY: 30.px,
          blur: 80.px,
          color: const Color.rgba(44, 24, 16, 0.3),
        ),
      ]),
    ),

    // Background overlay for cinematic depth
    css('.expanded-bento__overlay').styles(
      position: Position.absolute(
        top: 0.px,
        left: 0.px,
        right: 0.px,
        bottom: 0.px,
      ),
      backgroundImage: const ImageStyle.url(
        'linear-gradient(135deg, rgba(245, 241, 235, 0.15) 0%, rgba(230, 177, 122, 0.08) 100%)',
      ),
      opacity: 1,
      pointerEvents: PointerEvents.none,
    ),

    // Close button
    css('.expanded-bento__close-btn').styles(
      position: Position.absolute(top: 16.px, right: 16.px),
      width: 32.px,
      height: 32.px,
      backgroundColor: const Color.rgba(44, 24, 16, 0.1),
      border: Border.none,
      radius: BorderRadius.circular(50.percent),
      cursor: Cursor.pointer,
      fontSize: 14.px,
      color: const Color('#9B8B7A'), // grain-muted
      display: Display.flex,
      alignItems: AlignItems.center,
      justifyContent: JustifyContent.center,
      transition: const Transition('all', duration: 200),
      zIndex: const ZIndex(10),
    ),

    css('.expanded-bento__close-btn:hover').styles(
      backgroundColor: const Color.rgba(44, 24, 16, 0.2),
      color: const Color('#2C1810'), // deep-espresso
      transform: Transform.scale(1.1),
    ),

    // Main content
    css('.expanded-bento__content').styles(
      display: Display.flex,
      flexDirection: FlexDirection.column,
      height: 100.percent,
      position: Position.relative(),
      zIndex: const ZIndex(2),
    ),

    // Header section
    css('.expanded-bento__header').styles(
      display: Display.flex,
      flexDirection: FlexDirection.column,
      margin: Margin.only(bottom: 24.px),
    ),

    css('.expanded-bento__title-section').styles(
      display: Display.flex,
      alignItems: AlignItems.center,
      margin: Margin.only(bottom: 12.px),
    ),

    css('.expanded-bento__icon').styles(
      fontSize: 48.px,
      margin: Margin.only(right: 16.px),
      lineHeight: 1.px,
    ),

    css(
      '.expanded-bento__title-group',
    ).styles(display: Display.flex, flexDirection: FlexDirection.column),

    css('.expanded-bento__title').styles(
      fontSize: 28.px,
      fontWeight: FontWeight.w700,
      color: const Color('#2C1810'), // deep-espresso
      margin: Margin.only(bottom: 4.px),
      lineHeight: 1.2.px,
    ),

    css('.expanded-bento__type').styles(
      fontSize: 12.px,
      fontWeight: FontWeight.w600,
      color: const Color('#9B8B7A'), // grain-muted
      letterSpacing: 0.1.em,
      padding: Padding.symmetric(horizontal: 12.px, vertical: 6.px),
      radius: BorderRadius.circular(16.px),
      backgroundColor: const Color.rgba(155, 139, 122, 0.15),
      alignSelf: AlignSelf.start,
    ),

    // Contributors
    css('.expanded-bento__contributors').styles(
      fontSize: 14.px,
      color: const Color('#8B4513'), // warm-copper
    ),

    css(
      '.expanded-bento__contributors-label',
    ).styles(fontWeight: FontWeight.w400),

    css(
      '.expanded-bento__contributors-list',
    ).styles(fontWeight: FontWeight.w600),

    // Preview section
    css('.expanded-bento__preview').styles(
      flex: Flex(grow: 1),
      position: Position.relative(),
      radius: BorderRadius.circular(16.px),
      overflow: Overflow.hidden,
      backgroundColor: const Color.rgba(44, 24, 16, 0.05),
      margin: Margin.only(bottom: 24.px),
      minHeight: 200.px,
      display: Display.flex,
      alignItems: AlignItems.center,
      justifyContent: JustifyContent.center,
    ),

    css('.expanded-bento__preview-media')
        .styles(width: 100.percent, height: 100.percent)
        .styles(
          raw: const {'object-fit': 'cover', 'object-position': 'center'},
        ),

    // Interactive preview
    css('.expanded-bento__interactive-preview').styles(
      display: Display.flex,
      flexDirection: FlexDirection.column,
      alignItems: AlignItems.center,
      justifyContent: JustifyContent.center,
      textAlign: TextAlign.center,
      padding: Padding.all(32.px),
      fontSize: 18.px,
      color: const Color('#8B4513'), // warm-copper
    ),

    // Video and gif previews
    css('.expanded-bento__video-preview, .expanded-bento__gif-preview').styles(
      position: Position.relative(),
      width: 100.percent,
      height: 100.percent,
    ),

    css('.expanded-bento__video-indicator').styles(
      position: Position.absolute(bottom: 12.px, left: 12.px),
      backgroundColor: const Color.rgba(44, 24, 16, 0.8),
      color: const Color('#F5F1EB'), // warm-paper
      padding: Padding.symmetric(horizontal: 12.px, vertical: 6.px),
      radius: BorderRadius.circular(12.px),
      fontSize: 12.px,
      fontWeight: FontWeight.w600,
    ),

    // Image gallery
    css('.expanded-bento__image-gallery').styles(
      position: Position.relative(),
      width: 100.percent,
      height: 100.percent,
    ),

    css('.expanded-bento__gallery-indicator').styles(
      position: Position.absolute(top: 12.px, right: 12.px),
      backgroundColor: const Color.rgba(44, 24, 16, 0.8),
      color: const Color('#F5F1EB'), // warm-paper
      padding: Padding.symmetric(horizontal: 12.px, vertical: 6.px),
      radius: BorderRadius.circular(12.px),
      fontSize: 12.px,
      fontWeight: FontWeight.w600,
    ),

    // Fallback preview
    css('.expanded-bento__fallback-preview').styles(
      display: Display.flex,
      flexDirection: FlexDirection.column,
      alignItems: AlignItems.center,
      justifyContent: JustifyContent.center,
      textAlign: TextAlign.center,
      padding: Padding.all(32.px),
    ),

    css('.expanded-bento__fallback-icon').styles(
      fontSize: 64.px,
      margin: Margin.only(bottom: 16.px),
      opacity: 0.6,
    ),

    css('.expanded-bento__fallback-text').styles(
      fontSize: 16.px,
      color: const Color('#9B8B7A'), // grain-muted
      fontWeight: FontWeight.w500,
    ),

    // Preview overlay
    css('.expanded-bento__preview-overlay').styles(
      position: Position.absolute(bottom: 0.px, left: 0.px, right: 0.px),
      backgroundColor: const Color.rgba(44, 24, 16, 0.9),
      padding: Padding.all(16.px),
      transform: Transform.translate(y: 100.percent),
      transition: const Transition('transform', duration: 300),
    ),

    css(
      '.expanded-bento__preview:hover .expanded-bento__preview-overlay',
    ).styles(transform: Transform.translate(y: 0.px)),

    css('.expanded-bento__description').styles(
      fontSize: 14.px,
      lineHeight: 1.5.px,
      color: const Color('#F5F1EB'), // warm-paper
      margin: Margin.zero,
    ),

    // Footer section
    css('.expanded-bento__footer').styles(
      display: Display.flex,
      flexDirection: FlexDirection.column,
      gap: Gap.all(16.px),
    ),

    // Technology tags
    css('.expanded-bento__tags').styles(
      display: Display.flex,
      flexWrap: FlexWrap.wrap,
      gap: Gap.all(8.px),
    ),

    css('.expanded-bento__tag').styles(
      fontSize: 11.px,
      fontWeight: FontWeight.w500,
      color: const Color('#8B4513'), // warm-copper
      backgroundColor: const Color.rgba(139, 69, 19, 0.1),
      padding: Padding.symmetric(horizontal: 10.px, vertical: 4.px),
      radius: BorderRadius.circular(12.px),
      border: Border(
        style: BorderStyle.solid,
        color: const Color.rgba(139, 69, 19, 0.2),
        width: 1.px,
      ),
    ),

    css('.expanded-bento__tag--more').styles(
      backgroundColor: const Color.rgba(155, 139, 122, 0.15),
      color: const Color('#9B8B7A'), // grain-muted
    ),

    // Bottom row with metrics and actions
    css('.expanded-bento__bottom-row').styles(
      display: Display.flex,
      alignItems: AlignItems.center,
      justifyContent: JustifyContent.spaceBetween,
    ),

    // Metrics
    css('.expanded-bento__metrics').styles(
      display: Display.flex,
      alignItems: AlignItems.center,
      gap: Gap.all(16.px),
    ),

    css('.expanded-bento__metric').styles(
      fontSize: 12.px,
      fontWeight: FontWeight.w600,
      color: const Color('#8B4513'), // warm-copper
    ),

    // Action buttons
    css('.expanded-bento__actions').styles(
      display: Display.flex,
      alignItems: AlignItems.center,
      gap: Gap.all(12.px),
    ),

    css('.expanded-bento__action-btn').styles(
      fontSize: 12.px,
      fontWeight: FontWeight.w600,
      color: const Color('#2C1810'), // deep-espresso
      backgroundColor: const Color('#F5F1EB'), // warm-paper
      padding: Padding.symmetric(horizontal: 16.px, vertical: 8.px),
      radius: BorderRadius.circular(20.px),
      border: Border(
        style: BorderStyle.solid,
        color: const Color.rgba(44, 24, 16, 0.1),
        width: 1.px,
      ),
      cursor: Cursor.pointer,
      transition: const Transition('all', duration: 200),
      textDecoration: TextDecoration.none,
    ),

    css('.expanded-bento__action-btn:hover').styles(
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

    css('.expanded-bento__action-btn--primary').styles(
      backgroundColor: const Color('#8B4513'), // warm-copper
      color: const Color('#F5F1EB'), // warm-paper
    ),

    css('.expanded-bento__action-btn--primary:hover').styles(
      backgroundColor: const Color('#A0522D'), // lighter warm-copper
    ),

    // Project type color variants
    css('.expanded-bento--app .expanded-bento__type').styles(
      backgroundColor: const Color.rgba(30, 64, 175, 0.15), // blue
      color: const Color('#1e40af'),
    ),

    css('.expanded-bento--game .expanded-bento__type').styles(
      backgroundColor: const Color.rgba(107, 33, 168, 0.15), // purple
      color: const Color('#6b21a8'),
    ),

    css('.expanded-bento--library .expanded-bento__type').styles(
      backgroundColor: const Color.rgba(22, 101, 52, 0.15), // green
      color: const Color('#166534'),
    ),

    css('.expanded-bento--utility .expanded-bento__type').styles(
      backgroundColor: const Color.rgba(55, 48, 163, 0.15), // indigo
      color: const Color('#3730a3'),
    ),

    css('.expanded-bento--default .expanded-bento__type').styles(
      backgroundColor: const Color.rgba(31, 41, 55, 0.15), // gray
      color: const Color('#1f2937'),
    ),

    // Responsive design
    css.media(MediaQuery.screen(maxWidth: 768.px), [
      css('.expanded-bento').styles(
        minWidth: 300.px,
        maxWidth: 90.vw,
        minHeight: 400.px,
        maxHeight: 80.vh,
        padding: Padding.all(20.px),
      ),

      css('.expanded-bento__title').styles(fontSize: 24.px),

      css('.expanded-bento__icon').styles(fontSize: 36.px),

      css('.expanded-bento__bottom-row').styles(
        flexDirection: FlexDirection.column,
        alignItems: AlignItems.stretch,
        gap: Gap.all(12.px),
      ),

      css(
        '.expanded-bento__actions',
      ).styles(justifyContent: JustifyContent.center),
    ]),
  ];
}
