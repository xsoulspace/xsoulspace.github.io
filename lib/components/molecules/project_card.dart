import 'package:jaspr/jaspr.dart';

import '../atoms/badges.dart';
import '../atoms/typography.dart';

/// Project card molecule for displaying project information
/// Enhanced cards with ceramic-inspired styling and hover effects

enum CardSize {
  standard, // 1x1
  wide, // 2x1
  tall, // 1x2
  featured, // 2x2
}

class ProjectCard extends StatelessComponent {
  const ProjectCard({
    required this.title,
    required this.description,
    this.subtitle,
    this.href,
    this.status,
    this.category,
    this.tags = const [],
    this.size = CardSize.standard,
    this.featured = false,
    this.imageUrl,
    this.metadata,
    super.key,
  });

  final String title;
  final String description;
  final String? subtitle;
  final String? href;
  final BadgeType? status;
  final CategoryType? category;
  final List<String> tags;
  final CardSize size;
  final bool featured;
  final String? imageUrl;
  final String? metadata;

  String get _sizeClass {
    switch (size) {
      case CardSize.standard:
        return 'card-standard';
      case CardSize.wide:
        return 'card-wide';
      case CardSize.tall:
        return 'card-tall';
      case CardSize.featured:
        return 'card-featured';
    }
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final classes = [
      'project-card',
      _sizeClass,
      if (featured) 'card-featured-highlight',
    ].join(' ');

    final cardContent = [
      // Card header with image if provided
      if (imageUrl != null) ...[
        div([
          DomComponent(
            tag: 'img',
            attributes: {'src': imageUrl!, 'alt': title},
            classes: 'card-image',
          ),
        ], classes: 'card-image-container'),
      ],

      // Card content
      div([
        // Title and subtitle
        div([
          CardTitle(title),
          if (subtitle != null) CardSubtitle(subtitle!),
        ], classes: 'card-header'),

        // Description
        CardDescription(description),

        // Badges section
        if (status != null || category != null) ...[
          div([
            if (status != null) ...[
              StatusBadge(type: status!, text: _getStatusText(status!)),
            ],
            if (category != null) ...[
              CategoryBadge(type: category!, text: _getCategoryText(category!)),
            ],
          ], classes: 'card-badges'),
        ],

        // Tags
        if (tags.isNotEmpty) ...[
          div([
            for (final tag in tags) ...[
              DomComponent(
                tag: 'span',
                children: [Text(tag)],
                classes: 'card-tag',
              ),
            ],
          ], classes: 'card-tags'),
        ],

        // Metadata
        if (metadata != null) ...[CardMeta(metadata!)],
      ], classes: 'card-content'),
    ];

    // Wrap in link if href provided, otherwise just a div
    if (href != null) {
      yield a(cardContent, href: href!, classes: classes);
    } else {
      yield div(cardContent, classes: classes);
    }
  }

  String _getStatusText(BadgeType type) {
    switch (type) {
      case BadgeType.active:
        return 'Active';
      case BadgeType.beta:
        return 'Beta';
      case BadgeType.archive:
        return 'Archive';
      case BadgeType.featured:
        return 'Featured';
    }
  }

  String _getCategoryText(CategoryType type) {
    switch (type) {
      case CategoryType.appsGames:
        return 'Apps & Games';
      case CategoryType.dartFlutter:
        return 'Dart & Flutter';
      case CategoryType.officeExcel:
        return 'Office & Excel';
      case CategoryType.gamingValues:
        return 'Gaming & Values';
      case CategoryType.community:
        return 'Community';
    }
  }
}

class ProjectCardGrid extends StatelessComponent {
  const ProjectCardGrid({required this.cards, this.columns = 3, super.key});

  final List<ProjectCard> cards;
  final int columns;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div([
      for (final card in cards) card,
    ], classes: 'project-card-grid grid-cols-$columns');
  }
}
