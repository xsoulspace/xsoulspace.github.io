import 'package:jaspr/jaspr.dart';

import 'models/bento_config.dart';
import 'models/project_model.dart';

/// Full-featured expanded bento card for showcasing projects with live previews.
///
/// Enhanced with seamless transition support from any bento type (micro/standard).
/// Features cinematic expansion animations, adaptive content layout, and immersive
/// preview experiences. Designed to work as an overlay or in-place expansion.
class ExpandedBento extends StatelessComponent {
  const ExpandedBento({
    required this.project,
    required this.onCollapse,
    this.onHover,
    this.config = BentoConfig.defaultConfig,
    this.isOverlay = false,
    this.sourcePosition,
    this.animationState = ExpansionAnimationState.expanded,
    super.key,
  });

  final ProjectModel project;
  final VoidCallback onCollapse;
  final void Function(bool isHovered)? onHover;
  final BentoConfig config;

  /// Whether this expanded bento is rendered as an overlay (modal-style)
  final bool isOverlay;

  /// Original position of the source bento for smooth transitions
  final BentoPosition? sourcePosition;

  /// Current animation state for transition choreography
  final ExpansionAnimationState animationState;

  void _handleCollapse() {
    onCollapse();
  }

  void _handleMouseEnter() {
    onHover?.call(true);
  }

  void _handleMouseLeave() {
    onHover?.call(false);
  }

  void _handleBackdropClick() {
    if (isOverlay) {
      _handleCollapse();
    }
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

  String _getAnimationClass() {
    switch (animationState) {
      case ExpansionAnimationState.expanding:
        return 'expanded-bento--expanding';
      case ExpansionAnimationState.expanded:
        return 'expanded-bento--expanded';
      case ExpansionAnimationState.collapsing:
        return 'expanded-bento--collapsing';
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
      'expanded-bento',
      _getTypeClass(),
      _getAnimationClass(),
      if (isOverlay) 'expanded-bento--overlay',
    ].join(' ');

    // Render overlay backdrop if in overlay mode
    if (isOverlay) {
      yield div(
        classes: 'expanded-bento__backdrop',
        events: {'click': (_) => _handleBackdropClick()},
        [],
      );
    }

    yield div(
      classes: cardClasses,
      events: {
        'mouseenter': (_) => _handleMouseEnter(),
        'mouseleave': (_) => _handleMouseLeave(),
      },
      styles: sourcePosition != null
          ? Styles(raw: _buildTransitionStyles())
          : null,
      [
        // Cinematic background overlay with depth
        div(classes: 'expanded-bento__overlay', []),

        // Enhanced close button with better positioning
        button(
          classes: 'expanded-bento__close-btn',
          events: {'click': (_) => _handleCollapse()},
          [
            div(classes: 'expanded-bento__close-icon', [text('✕')]),
          ],
        ),

        // Main content container with improved layout
        div(classes: 'expanded-bento__content', [
          // Header section with enhanced typography
          _buildExpandedHeader(),

          // Live preview section with adaptive content
          _buildLivePreview(),

          // Footer section with enhanced actions
          _buildExpandedFooter(),
        ]),

        // Expansion indicator for visual feedback
        if (animationState == ExpansionAnimationState.expanding)
          div(classes: 'expanded-bento__expansion-indicator', [
            text(
              '✨ Expanding from ${project.preferredSize.isMicro ? 'micro' : 'standard'} bento...',
            ),
          ]),
      ],
    );
  }

  /// Build transition styles for smooth expansion from source position
  Map<String, String>? _buildTransitionStyles() {
    if (sourcePosition == null) return null;

    return {
      '--source-x': '${sourcePosition!.x}px',
      '--source-y': '${sourcePosition!.y}px',
      '--source-width': '${sourcePosition!.width}px',
      '--source-height': '${sourcePosition!.height}px',
    };
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
    // Base expanded bento styles with improved positioning
    css('.expanded-bento').styles(
      backgroundColor: const Color('#E8E2D8'), // soft-linen
      radius: BorderRadius.circular(24.px),
      padding: Padding.all(32.px),
      position: Position.relative(),
      overflow: Overflow.hidden,
      // Remove fixed dimensions - let grid control sizing
      width: 100.percent,
      height: 100.percent,
      minHeight: 320.px,
      border: Border(
        style: BorderStyle.solid,
        color: const Color.rgba(139, 69, 19, 0.15),
        width: 1.px,
      ),
      transition: const Transition('all', duration: 400),
      display: Display.flex,
      flexDirection: FlexDirection.column,
      justifyContent: JustifyContent.spaceBetween,
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

    // Responsive design with improved grid spanning
    css.media(MediaQuery.screen(maxWidth: 768.px), [
      css('.expanded-bento').styles(
        minWidth: 300.px,
        maxWidth: 90.vw,
        minHeight: 400.px,
        maxHeight: 80.vh,
        padding: Padding.all(20.px),
        // Mobile: span full width
        raw: const {'grid-column': 'span 1', 'grid-row': 'span 1'},
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

    // Tablet responsive rules
    css.media(MediaQuery.screen(minWidth: 768.px, maxWidth: 1024.px), [
      css('.expanded-bento').styles(
        raw: const {
          'grid-column': 'span 2', // Span 2 columns on tablet
          'grid-row': 'span 2',
        },
      ),
    ]),

    // Desktop responsive rules
    css.media(MediaQuery.screen(minWidth: 1024.px, maxWidth: 1280.px), [
      css('.expanded-bento').styles(
        raw: const {
          'grid-column': 'span 2', // Span 2 of 3 columns on desktop
          'grid-row': 'span 2',
        },
      ),
    ]),

    // Large screen responsive rules
    css.media(MediaQuery.screen(minWidth: 1280.px), [
      css('.expanded-bento').styles(
        raw: const {
          'grid-column': 'span 2', // Span 2 of 4 columns on large screens
          'grid-row': 'span 2',
        },
      ),
    ]),

    // Enhanced animation state classes
    css('.expanded-bento--expanding').styles(
      raw: const {
        'animation': 'expandingPulse 0.5s ease-out',
        'transform-origin': 'var(--source-x, center) var(--source-y, center)',
      },
    ),

    css('.expanded-bento--expanded').styles(
      raw: const {
        'animation': 'expandedGlow 2s ease-in-out infinite alternate',
      },
    ),

    css('.expanded-bento--collapsing').styles(
      raw: const {
        'animation': 'collapsingFade 0.4s ease-in',
        'transform-origin': 'var(--source-x, center) var(--source-y, center)',
      },
    ),

    // Overlay mode enhancements
    css('.expanded-bento--overlay').styles(
      position: Position.fixed(top: 50.percent, left: 50.percent),
      raw: const {
        'transform': 'translate(-50%, -50%)',
        'z-index': '1001',
        'max-width': '90vw',
        'max-height': '90vh',
        'box-shadow': '0 20px 60px rgba(44, 24, 16, 0.3)',
      },
    ),

    // Backdrop for overlay mode
    css('.expanded-bento__backdrop').styles(
      position: Position.fixed(
        top: 0.px,
        left: 0.px,
        right: 0.px,
        bottom: 0.px,
      ),
      backgroundColor: const Color.rgba(0, 0, 0, 0.8),
      zIndex: const ZIndex(1000),
      raw: const {
        'backdrop-filter': 'blur(8px)',
        'animation': 'backdropFadeIn 0.3s ease-out',
      },
    ),

    // Enhanced expansion indicator
    css('.expanded-bento__expansion-indicator').styles(
      position: Position.absolute(top: 50.percent, left: 50.percent),
      raw: const {
        'transform': 'translate(-50%, -50%)',
        'z-index': '10',
        'background': 'rgba(139, 69, 19, 0.9)',
        'color': '#F5F1EB',
        'padding': '12px 24px',
        'border-radius': '24px',
        'font-size': '14px',
        'font-weight': '600',
        'animation': 'expandingIndicator 0.5s ease-out',
      },
    ),

    // Animation keyframes for enhanced feedback
    css('@keyframes expandingPulse', []).styles(
      raw: const {
        '0%': '''
          transform: scale(0.1) translate(var(--source-x, 0px), var(--source-y, 0px));
          opacity: 0;
          filter: blur(4px);
        ''',
        '50%': '''
          transform: scale(0.6) translate(calc(var(--source-x, 0px) * 0.4), calc(var(--source-y, 0px) * 0.4));
          opacity: 0.8;
          filter: blur(2px);
        ''',
        '100%': '''
          transform: scale(1) translate(0px, 0px);
          opacity: 1;
          filter: blur(0px);
        ''',
      },
    ),

    css('@keyframes expandedGlow', []).styles(
      raw: const {
        '0%': 'box-shadow: 0 20px 60px rgba(44, 24, 16, 0.3)',
        '100%':
            'box-shadow: 0 25px 80px rgba(139, 69, 19, 0.4), 0 0 30px rgba(230, 177, 122, 0.2)',
      },
    ),

    css('@keyframes collapsingFade', []).styles(
      raw: const {
        '0%': '''
          transform: scale(1) translate(0px, 0px);
          opacity: 1;
          filter: blur(0px);
        ''',
        '50%': '''
          transform: scale(0.6) translate(calc(var(--source-x, 0px) * 0.4), calc(var(--source-y, 0px) * 0.4));
          opacity: 0.6;
          filter: blur(1px);
        ''',
        '100%': '''
          transform: scale(0.1) translate(var(--source-x, 0px), var(--source-y, 0px));
          opacity: 0;
          filter: blur(3px);
        ''',
      },
    ),

    css('@keyframes backdropFadeIn', []).styles(
      raw: const {
        '0%': 'opacity: 0; backdrop-filter: blur(0px)',
        '100%': 'opacity: 1; backdrop-filter: blur(8px)',
      },
    ),

    css('@keyframes expandingIndicator', []).styles(
      raw: const {
        '0%': 'opacity: 0; transform: translate(-50%, -50%) scale(0.5)',
        '50%': 'opacity: 1; transform: translate(-50%, -50%) scale(1.1)',
        '100%': 'opacity: 0; transform: translate(-50%, -50%) scale(1)',
      },
    ),
  ];
}
