import 'package:jaspr/jaspr.dart';

import '../models/project_model.dart';

/// {@template project_card}
/// A card component that displays project information in the bento grid layout.
/// Features ceramic-inspired styling with responsive sizing based on project type.
/// {@endtemplate}
class ProjectCard extends StatelessComponent {
  /// {@macro project_card}
  const ProjectCard({
    required this.project,
    this.size = ProjectCardSize.standard,
    super.key,
  });

  final ProjectModel project;
  final ProjectCardSize size;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield article(classes: _getCardClasses(), [
      // Preview content (image, gif, or video)
      if (project.hasPreviewContent) _buildPreviewContent(),

      // Content section
      div(classes: 'project-card__content', [
        // Header with title and type
        header(classes: 'project-card__header', [
          h3(classes: 'project-card__title', [text(project.title)]),
          if (project.type.isNotEmpty)
            span(classes: 'project-card__type', [text(project.type)]),
        ]),

        // Description
        if (project.description.isNotEmpty)
          p(classes: 'project-card__description', [text(project.description)]),

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
        if (size == ProjectCardSize.featured && project.metrics.hasMetrics)
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
    final sizeClass = 'project-card--${size.name}';
    final typeClass = 'project-card--${project.type.toLowerCase()}';
    return '$baseClass $sizeClass $typeClass';
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

  @css
  static List<StyleRule> get styles => [
    // Base card styles
    css('.project-card').styles(
      raw: const {
        'background-color': '#F5F1EB',
        'border': '1px solid #D4C4B0',
        'border-radius': '0.75rem',
        'padding': '0',
        'position': 'relative',
        'overflow': 'hidden',
        'transition': 'all 300ms ease',
        'cursor': 'pointer',
        'display': 'flex',
        'flex-direction': 'column',
        'height': '100%',
      },
    ),

    // Hover effects
    css('.project-card:hover').styles(
      raw: const {
        'box-shadow': '0 8px 24px rgba(78, 52, 46, 0.15)',
        'transform': 'translateY(-2px)',
        'border-color': 'rgba(224, 122, 95, 0.3)',
      },
    ),

    // Card size variations
    css('.project-card--micro').styles(
      raw: const {
        'grid-column': 'span 1',
        'grid-row': 'span 1',
        'min-height': '180px',
      },
    ),

    css('.project-card--standard').styles(
      raw: const {
        'grid-column': 'span 1',
        'grid-row': 'span 1',
        'min-height': '220px',
      },
    ),

    css('.project-card--featured').styles(
      raw: const {
        'grid-column': 'span 2',
        'grid-row': 'span 2',
        'min-height': '320px',
      },
    ),

    // Preview content
    css('.project-card__preview').styles(
      raw: const {
        'width': '100%',
        'position': 'relative',
        'overflow': 'hidden',
        'aspect-ratio': '16/9',
        'flex-shrink': '0',
      },
    ),

    css('.project-card__preview img, .project-card__preview video').styles(
      raw: const {
        'width': '100%',
        'height': '100%',
        'object-fit': 'cover',
        'object-position': 'center',
      },
    ),

    css('.project-card__preview--placeholder').styles(
      raw: const {
        'background-color': '#EDE7DD',
        'display': 'flex',
        'align-items': 'center',
        'justify-content': 'center',
      },
    ),

    css(
      '.project-card__preview-icon',
    ).styles(raw: const {'font-size': '2rem', 'color': '#8B7355'}),

    // Content section
    css('.project-card__content').styles(
      raw: const {
        'padding': '1rem',
        'display': 'flex',
        'flex-direction': 'column',
        'flex-grow': '1',
      },
    ),

    // Header
    css('.project-card__header').styles(
      raw: const {
        'display': 'flex',
        'align-items': 'flex-start',
        'justify-content': 'space-between',
        'gap': '0.5rem',
      },
    ),

    css('.project-card__title').styles(
      raw: const {
        'font-size': '1.125rem',
        'font-weight': '500',
        'color': '#4E342E',
        'line-height': '1.3',
        'margin': '0',
      },
    ),

    css('.project-card__type').styles(
      raw: const {
        'font-size': '0.75rem',
        'font-weight': '400',
        'color': '#8B7355',
        'padding': '0.25rem 0.5rem',
        'border-radius': '0.375rem',
        'background-color': '#EDE7DD',
        'white-space': 'nowrap',
        'flex-shrink': '0',
      },
    ),

    // Description
    css('.project-card__description').styles(
      raw: const {
        'font-size': '0.8125rem',
        'font-weight': '400',
        'color': '#8B7355',
        'line-height': '1.4',
        'margin': '0',
        'display': '-webkit-box',
        '-webkit-line-clamp': '3',
        '-webkit-box-orient': 'vertical',
        'overflow': 'hidden',
      },
    ),

    // Tags
    css('.project-card__tags').styles(
      raw: const {
        'display': 'flex',
        'flex-wrap': 'wrap',
        'gap': '0.375rem',
        'margin-top': 'auto',
      },
    ),

    css('.project-card__tag').styles(
      raw: const {
        'font-size': '0.6875rem',
        'font-weight': '400',
        'color': '#6B4E3D',
        'padding': '0.125rem 0.375rem',
        'border-radius': '0.25rem',
        'background-color': '#F2CC8F',
        'white-space': 'nowrap',
      },
    ),

    css(
      '.project-card__tag--more',
    ).styles(raw: const {'background-color': '#E07A5F', 'color': '#FFFFFF'}),

    // Metrics
    css('.project-card__metrics').styles(
      raw: const {'display': 'flex', 'gap': '1rem', 'margin-top': '0.5rem'},
    ),

    css('.project-card__metric').styles(
      raw: const {'display': 'flex', 'align-items': 'center', 'gap': '0.25rem'},
    ),

    css(
      '.project-card__metric-icon',
    ).styles(raw: const {'font-size': '0.875rem'}),

    css('.project-card__metric-value').styles(
      raw: const {
        'font-size': '0.75rem',
        'font-weight': '500',
        'color': '#4E342E',
      },
    ),

    // Footer
    css('.project-card__footer').styles(
      raw: const {
        'padding': '0 1rem 1rem',
        'margin-top': 'auto',
        'display': 'flex',
        'gap': '0.5rem',
      },
    ),

    css('.project-card__action-link').styles(
      raw: const {
        'display': 'inline-flex',
        'align-items': 'center',
        'gap': '0.35rem',
        'background-color': '#EDE7DD',
        'color': '#4E342E',
        'border-radius': '99px',
        'padding': '0.4rem 0.8rem',
        'text-decoration': 'none',
        'font-weight': '500',
        'font-size': '0.875rem',
        'transition': 'all 0.2s ease-in-out',
      },
    ),

    css('.project-card__action-link:hover').styles(
      raw: const {
        'background-color': '#D4C4B0',
        'transform': 'translateY(-1px)',
        'box-shadow': '0 2px 8px rgba(0,0,0,0.05)',
      },
    ),

    // Type-specific styling
    css(
      '.project-card--app',
    ).styles(raw: const {'border-left': '4px solid #E07A5F'}),

    css(
      '.project-card--game',
    ).styles(raw: const {'border-left': '4px solid #D4756B'}),

    css(
      '.project-card--package',
    ).styles(raw: const {'border-left': '4px solid #81B29A'}),

    css(
      '.project-card--bot',
    ).styles(raw: const {'border-left': '4px solid #A8C4A2'}),

    css(
      '.project-card--web',
    ).styles(raw: const {'border-left': '4px solid #F2CC8F'}),

    css(
      '.project-card--utility',
    ).styles(raw: const {'border-left': '4px solid #81B29A'}),

    // Card type specific styling (e.g., game, app)
    css('.project-card--game:hover').styles(
      raw: const {
        'border-left': '4px solid #D4756B',
        'transform': 'translateY(-2px)',
        'box-shadow': '0 8px 24px rgba(78, 52, 46, 0.15)',
      },
    ),
  ];
}

/// Represents the different size variations for project cards in the bento grid.
enum ProjectCardSize {
  micro,
  standard,
  featured;

  /// Returns the appropriate size based on project data.
  static ProjectCardSize fromProject(ProjectModel project) {
    if (project.preferredSize.isFeatured) return ProjectCardSize.featured;
    if (project.preferredSize.isMicro) return ProjectCardSize.micro;
    return ProjectCardSize.standard;
  }
}
