import 'package:jaspr/jaspr.dart';

import '../atoms/badges.dart';
import '../atoms/typography.dart';

/// Section header molecule for content organization
/// Provides clear visual hierarchy with ceramic-inspired styling

class SectionHeader extends StatelessComponent {
  const SectionHeader({
    required this.title,
    this.subtitle,
    this.count,
    this.icon,
    this.accent,
    super.key,
  });

  final String title;
  final String? subtitle;
  final int? count;
  final String? icon;
  final String? accent; // CSS class for accent color

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final classes = ['section-header', if (accent != null) accent!].join(' ');

    yield header([
      div([
        // Icon and title row
        div([
          if (icon != null) ...[
            DomComponent(
              tag: 'span',
              children: [Text(icon!)],
              classes: 'section-icon',
            ),
          ],
          SectionTitle(title),
          if (count != null) ...[CountBadge(count!)],
        ], classes: 'section-title-row'),

        // Subtitle if provided
        if (subtitle != null) ...[
          p([
            DomComponent(
              tag: 'span',
              children: [Text(subtitle!)],
              classes: 'section-subtitle',
            ),
          ]),
        ],
      ], classes: 'section-header-content'),
    ], classes: classes);
  }
}

class CategorySection extends StatelessComponent {
  const CategorySection({
    required this.title,
    required this.children,
    this.subtitle,
    this.count,
    this.icon,
    this.categoryType,
    super.key,
  });

  final String title;
  final List<Component> children;
  final String? subtitle;
  final int? count;
  final String? icon;
  final CategoryType? categoryType;

  String? get _accentClass {
    if (categoryType == null) return null;
    switch (categoryType!) {
      case CategoryType.appsGames:
        return 'accent-terracotta';
      case CategoryType.dartFlutter:
        return 'accent-sage';
      case CategoryType.officeExcel:
        return 'accent-sandstone';
      case CategoryType.gamingValues:
        return 'accent-coral';
      case CategoryType.community:
        return 'accent-mint';
    }
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield section([
      SectionHeader(
        title: title,
        subtitle: subtitle,
        count: count,
        icon: icon,
        accent: _accentClass,
      ),
      div(children, classes: 'section-content'),
    ], classes: 'category-section');
  }
}
