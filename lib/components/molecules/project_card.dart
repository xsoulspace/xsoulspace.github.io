import 'package:jaspr/jaspr.dart';

import '../models/project_model.dart';

/// {@template project_card}
/// A card component that displays project information in the bento grid layout.
/// Features ceramic-inspired styling with responsive sizing based on project type.
/// {@endtemplate}
class ProjectCard extends StatelessComponent {
  /// {@macro project_card}
  const ProjectCard({required this.project, super.key});

  final ProjectModel project;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield article(classes: _getCardClasses(), [
      // Preview content (image, gif, or video)
      if (project.hasPreviewContent) _buildPreviewContent(),

      // Content section
      div(classes: _getContentLayoutClasses(), [
        // Header with title and type
        header(classes: 'project-card__header', [
          h3(classes: 'project-card__title', [text(project.title)]),
          if (project.type.isNotEmpty)
            span(classes: 'project-card__type', [text(project.type)]),
        ]),

        // Description
        if (project.description.isNotEmpty)
          p(
            classes: 'project-card__description',
            styles: Styles.raw({
              '-webkit-line-clamp': _getDescriptionClampLines(),
            }),
            [text(project.description)],
          ),

        // Tags
        if (project.tags.isNotEmpty)
          div(classes: 'project-card__tags', [
            for (final tag in project.tags.take(3))
              span(classes: 'project-card__tag', [text('#$tag')]),
            if (project.tags.length > 3)
              span(classes: 'project-card__tag project-card__tag--more', [
                text('+${project.tags.length - 3}'),
              ]),
          ]),

        // Metrics (for featured cards)
        if (project.priority.isFeatured && project.metrics.hasMetrics)
          _buildMetrics(),
      ]),

      // Footer with actions
      footer(classes: 'project-card__footer', [
        if (project.links.telegram.isNotEmpty)
          a(
            href: project.links.telegram,
            classes: 'project-card__action-link',
            attributes: {'target': '_blank'},
            [
              span([text('Open Bot')]),
              span(classes: 'project-card__action-icon', [text('→')]),
            ],
          ),
        if (project.links.hasDemo)
          a(
            href: project.links.demoUrl,
            classes: 'project-card__action-link',
            attributes: {'target': '_blank'},
            [
              span([text('Live Demo')]),
              span(classes: 'project-card__action-icon', [text('→')]),
            ],
          ),
        if (project.links.hasLivePreview)
          a(
            href: project.links.livePreviewUrl,
            classes: 'project-card__action-link',
            attributes: {'target': '_blank'},
            [text('Preview')],
          ),
      ]),
    ]);
  }

  String _getCardClasses() {
    final baseClass = 'project-card';
    final priorityClass = 'project-card--priority-${project.priority.value}';
    final emphasisClass =
        'project-card--emphasis-${project.contentEmphasis.value}';
    final typeClass = 'project-card--${project.type.toLowerCase()}';
    return '$baseClass $priorityClass $emphasisClass $typeClass';
  }

  String _getContentLayoutClasses() {
    final emphasis = project.contentEmphasis;
    final baseClass = 'project-card__content';

    if (emphasis.emphasizeImage) {
      return '$baseClass project-card__content--image-emphasis';
    } else if (emphasis.emphasizeText) {
      return '$baseClass project-card__content--text-emphasis';
    } else if (emphasis.emphasizeMetrics) {
      return '$baseClass project-card__content--metrics-emphasis';
    } else if (emphasis.emphasizeInteractive) {
      return '$baseClass project-card__content--interactive-emphasis';
    }
    return baseClass;
  }

  Component _buildPreviewContent() {
    final preview = project.previewContent;

    if (preview.type.isVideo && preview.hasVideo) {
      return div(
        classes: 'project-card__preview project-card__preview--video',
        [
          video(
            src: preview.videoUrl,
            attributes: {
              'autoplay': 'true',
              'muted': 'true',
              'loop': 'true',
              'playsinline': 'true',
            },
            [
              // Fallback to thumbnail if video fails
              if (preview.hasThumbnail)
                img(src: preview.thumbnailUrl, alt: '${project.title} preview'),
            ],
          ),
        ],
      );
    }

    if (preview.type.isGif && preview.hasGif) {
      return div(classes: 'project-card__preview project-card__preview--gif', [
        img(src: preview.gifUrl, alt: '${project.title} demo'),
      ]);
    }

    if (preview.hasThumbnail) {
      return div(
        classes: 'project-card__preview project-card__preview--image',
        [img(src: preview.thumbnailUrl, alt: '${project.title} preview')],
      );
    }

    return div(
      classes: 'project-card__preview project-card__preview--placeholder',
      [
        div(classes: 'project-card__preview-icon', [text(_getPreviewIcon())]),
      ],
    );
  }

  Component _buildMetrics() {
    final metrics = project.metrics;
    return div(classes: 'project-card__metrics', [
      if (metrics.stars > 0)
        div(classes: 'project-card__metric', [
          span(classes: 'project-card__metric-icon', [text('⭐')]),
          span(classes: 'project-card__metric-value', [
            text('${metrics.stars}'),
          ]),
        ]),
      if (metrics.downloads > 0)
        div(classes: 'project-card__metric', [
          span(classes: 'project-card__metric-icon', [text('📥')]),
          span(classes: 'project-card__metric-value', [
            text(_formatNumber(metrics.downloads)),
          ]),
        ]),
      if (metrics.forks > 0)
        div(classes: 'project-card__metric', [
          span(classes: 'project-card__metric-icon', [text('🔗')]),
          span(classes: 'project-card__metric-value', [
            text('${metrics.forks}'),
          ]),
        ]),
    ]);
  }

  String _getPreviewIcon() {
    if (project.isApp) return '📱';
    if (project.isGame) return '🎮';
    if (project.isLibrary) return '📦';
    if (project.type.toLowerCase() == 'bot') return '🤖';
    if (project.type.toLowerCase().contains('web')) return '🌐';
    return '💼';
  }

  String _formatNumber(int number) {
    if (number >= 1000000) {
      return '${(number / 1000000).toStringAsFixed(1)}M';
    } else if (number >= 1000) {
      return '${(number / 1000).toStringAsFixed(1)}K';
    }
    return number.toString();
  }

  bool _shouldShowExpandedMetrics() {
    return project.contentEmphasis.emphasizeMetrics &&
        project.metrics.hasMetrics;
  }

  bool _shouldPrioritizeImage() {
    return project.contentEmphasis.emphasizeImage && project.hasPreviewContent;
  }

  String _getDescriptionClampLines() {
    if (project.contentEmphasis.emphasizeText) return '4';
    if (project.contentEmphasis.emphasizeImage) return '2';
    return '3'; // default
  }

  @css
  static List<StyleRule> get styles => [
    // Base card styles with enhanced ceramic aesthetics
    css('.project-card').styles(
      raw: const {
        'background-color': 'var(--warm-ceramic)',
        'border': '1px solid var(--clay-border)',
        'border-radius': '0.75rem',
        'padding': '0',
        'position': 'relative',
        'overflow': 'hidden',
        'transition': 'all 300ms ease',
        'cursor': 'pointer',
        'display': 'flex',
        'flex-direction': 'column',
        'height': '100%',
        'box-shadow': '0 4px 12px rgba(78, 52, 46, 0.1)',
      },
    ),

    // Enhanced hover effects with ceramic glow
    css('.project-card:hover').styles(
      raw: const {
        'transform': 'translateY(-2px)',
        'box-shadow': '0 8px 24px rgba(78, 52, 46, 0.15)',
        'border-color': 'var(--terracotta)',
      },
    ),

    // Priority-based styling with ceramic accent colors
    css('.project-card--priority-1').styles(
      raw: const {
        'opacity': '0.85',
        'border-left': '2px solid var(--clay-border)',
      },
    ),
    css(
      '.project-card--priority-2',
    ).styles(raw: const {'border-left': '3px solid var(--muted-taupe)'}),
    css('.project-card--priority-3').styles(
      raw: const {
        'border-left': '4px solid var(--terracotta)',
        'box-shadow': '0 4px 16px rgba(224, 122, 95, 0.2)',
      },
    ),
    css('.project-card--priority-4').styles(
      raw: const {
        'border-left': '5px solid var(--terracotta)',
        'box-shadow': '0 8px 24px rgba(224, 122, 95, 0.3)',
        'transform': 'scale(1.02)',
        'background':
            'linear-gradient(135deg, var(--warm-ceramic) 0%, rgba(224, 122, 95, 0.05) 100%)',
      },
    ),

    // Content emphasis styling
    css(
      '.project-card--emphasis-image .project-card__preview',
    ).styles(raw: const {'aspect-ratio': '16/9', 'flex-shrink': '0'}),
    css(
      '.project-card--emphasis-text .project-card__title',
    ).styles(raw: const {'font-size': '1.25rem', 'font-weight': '600'}),
    css(
      '.project-card--emphasis-metrics .project-card__metrics',
    ).styles(raw: const {'font-size': '1rem', 'margin-top': '0.75rem'}),

    // Enhanced content emphasis styling
    css(
      '.project-card__content--image-emphasis',
    ).styles(raw: const {'flex-direction': 'column-reverse'}),

    css(
      '.project-card__content--image-emphasis .project-card__preview',
    ).styles(raw: const {'aspect-ratio': '4/3', 'margin-bottom': '0.75rem'}),

    css(
      '.project-card__content--text-emphasis .project-card__header',
    ).styles(raw: const {'margin-bottom': '1rem'}),

    css(
      '.project-card__content--text-emphasis .project-card__description',
    ).styles(raw: const {'-webkit-line-clamp': '4', 'font-size': '0.875rem'}),

    css(
      '.project-card__content--metrics-emphasis .project-card__metrics',
    ).styles(
      raw: const {
        'display': 'grid',
        'grid-template-columns': 'repeat(auto-fit, minmax(60px, 1fr))',
        'gap': '0.5rem',
        'padding': '0.75rem',
        'background-color': 'var(--soft-clay)',
        'border-radius': '0.5rem',
        'margin-top': '1rem',
        'border': '1px solid var(--clay-border)',
      },
    ),

    css(
      '.project-card__content--interactive-emphasis .project-card__footer',
    ).styles(
      raw: const {
        'background':
            'linear-gradient(135deg, var(--sandstone) 0%, rgba(242, 204, 143, 0.8) 100%)',
        'padding': '1rem',
        'margin': '1rem -1rem -1rem',
        'border-radius': '0 0 0.75rem 0.75rem',
        'border-top': '1px solid var(--clay-border)',
      },
    ),

    // Type-based styling with ceramic category colors
    css(
      '.project-card--app',
    ).styles(raw: const {'border-left': '4px solid var(--terracotta)'}),
    css(
      '.project-card--game',
    ).styles(raw: const {'border-left': '4px solid var(--warm-coral)'}),
    css(
      '.project-card--package',
    ).styles(raw: const {'border-left': '4px solid var(--sage-glaze)'}),
    css(
      '.project-card--bot',
    ).styles(raw: const {'border-left': '4px solid var(--sandstone)'}),

    // Preview content with ceramic styling
    css('.project-card__preview').styles(
      raw: const {
        'width': '100%',
        'position': 'relative',
        'overflow': 'hidden',
        'aspect-ratio': '16/9',
        'flex-shrink': '0',
        'border-radius': '0.75rem 0.75rem 0 0',
      },
    ),

    css('.project-card__preview img, .project-card__preview video').styles(
      raw: const {
        'width': '100%',
        'height': '100%',
        'object-fit': 'cover',
        'object-position': 'center',
        'transition': 'transform 300ms ease',
      },
    ),

    // Subtle hover effect on preview images
    css(
      '.project-card:hover .project-card__preview img, .project-card:hover .project-card__preview video',
    ).styles(raw: const {'transform': 'scale(1.05)'}),

    css('.project-card__preview--placeholder').styles(
      raw: const {
        'background':
            'linear-gradient(135deg, var(--soft-clay) 0%, var(--unglazed-bisque) 100%)',
        'display': 'flex',
        'align-items': 'center',
        'justify-content': 'center',
        'border-bottom': '1px solid var(--clay-border)',
      },
    ),

    css('.project-card__preview-icon').styles(
      raw: const {
        'font-size': '2rem',
        'color': 'var(--muted-taupe)',
        'opacity': '0.6',
      },
    ),

    // Content section with improved ceramic styling
    css('.project-card__content').styles(
      raw: const {
        'padding': '1rem',
        'display': 'flex',
        'flex-direction': 'column',
        'flex-grow': '1',
        'background-color': 'var(--warm-ceramic)',
      },
    ),

    // Header with ceramic typography
    css('.project-card__header').styles(
      raw: const {
        'display': 'flex',
        'align-items': 'flex-start',
        'justify-content': 'space-between',
        'gap': '0.5rem',
        'margin-bottom': '0.5rem',
      },
    ),

    css('.project-card__title').styles(
      raw: const {
        'font-size': '1.125rem',
        'font-weight': '500',
        'color': 'var(--earthy-brown)',
        'line-height': '1.3',
        'margin': '0',
      },
    ),

    css('.project-card__type').styles(
      raw: const {
        'font-size': '0.75rem',
        'font-weight': '400',
        'color': 'var(--muted-taupe)',
        'padding': '0.25rem 0.5rem',
        'border-radius': '0.375rem',
        'background-color': 'var(--soft-clay)',
        'white-space': 'nowrap',
        'flex-shrink': '0',
        'border': '1px solid var(--clay-border)',
      },
    ),

    // Description with ceramic color scheme
    css('.project-card__description').styles(
      raw: const {
        'font-size': '0.8125rem',
        'font-weight': '400',
        'color': 'var(--muted-taupe)',
        'line-height': '1.4',
        'margin': '0 0 0.75rem 0',
        'display': '-webkit-box',
        '-webkit-line-clamp': '3',
        '-webkit-box-orient': 'vertical',
        'overflow': 'hidden',
      },
    ),

    // Tags with ceramic accent colors
    css('.project-card__tags').styles(
      raw: const {
        'display': 'flex',
        'flex-wrap': 'wrap',
        'gap': '0.375rem',
        'margin-top': 'auto',
        'margin-bottom': '0.5rem',
      },
    ),

    css('.project-card__tag').styles(
      raw: const {
        'font-size': '0.6875rem',
        'font-weight': '400',
        'color': 'var(--warm-umber)',
        'padding': '0.125rem 0.375rem',
        'border-radius': '0.25rem',
        'background-color': 'var(--sandstone)',
        'white-space': 'nowrap',
        'border': '1px solid rgba(242, 204, 143, 0.3)',
      },
    ),

    css('.project-card__tag--more').styles(
      raw: const {
        'background-color': 'var(--terracotta)',
        'color': 'var(--unglazed-bisque)',
        'border-color': 'var(--terracotta)',
      },
    ),

    // Metrics with ceramic styling
    css('.project-card__metrics').styles(
      raw: const {
        'display': 'flex',
        'gap': '1rem',
        'margin-top': '0.5rem',
        'padding': '0.5rem',
        'background-color': 'var(--unglazed-bisque)',
        'border-radius': '0.375rem',
        'border': '1px solid var(--clay-border)',
      },
    ),

    css('.project-card__metric').styles(
      raw: const {'display': 'flex', 'align-items': 'center', 'gap': '0.25rem'},
    ),

    css(
      '.project-card__metric-icon',
    ).styles(raw: const {'font-size': '0.875rem', 'filter': 'grayscale(20%)'}),

    css('.project-card__metric-value').styles(
      raw: const {
        'font-size': '0.75rem',
        'font-weight': '500',
        'color': 'var(--earthy-brown)',
      },
    ),

    // Footer with enhanced ceramic button styling
    css('.project-card__footer').styles(
      raw: const {
        'padding': '0 1rem 1rem',
        'margin-top': 'auto',
        'display': 'flex',
        'gap': '0.5rem',
        'flex-wrap': 'wrap',
      },
    ),

    css('.project-card__action-link').styles(
      raw: const {
        'display': 'inline-flex',
        'align-items': 'center',
        'gap': '0.35rem',
        'background':
            'linear-gradient(135deg, var(--soft-clay) 0%, var(--unglazed-bisque) 100%)',
        'color': 'var(--earthy-brown)',
        'border': '1px solid var(--clay-border)',
        'border-radius': '99px',
        'padding': '0.4rem 0.8rem',
        'text-decoration': 'none',
        'font-weight': '500',
        'font-size': '0.875rem',
        'transition': 'all 0.2s ease-in-out',
        'box-shadow': '0 2px 4px rgba(78, 52, 46, 0.08)',
      },
    ),

    css('.project-card__action-link:hover').styles(
      raw: const {
        'background':
            'linear-gradient(135deg, var(--terracotta) 0%, rgba(224, 122, 95, 0.9) 100%)',
        'color': 'var(--unglazed-bisque)',
        'border-color': 'var(--terracotta)',
        'transform': 'translateY(-1px)',
        'box-shadow': '0 4px 12px rgba(224, 122, 95, 0.25)',
      },
    ),

    css(
      '.project-card__action-icon',
    ).styles(raw: const {'transition': 'transform 0.2s ease-in-out'}),

    css(
      '.project-card__action-link:hover .project-card__action-icon',
    ).styles(raw: const {'transform': 'translateX(2px)'}),
  ];
}
