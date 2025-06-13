import 'package:jaspr/jaspr.dart';

/// Badge atoms for status indicators and category markers
/// Provides consistent visual indicators across the application

enum BadgeType { active, beta, archive, featured }

enum CategoryType {
  appsGames,
  dartFlutter,
  officeExcel,
  gamingValues,
  community,
}

class StatusBadge extends StatelessComponent {
  const StatusBadge({required this.type, required this.text, super.key});

  final BadgeType type;
  final String text;

  String get _badgeClass {
    switch (type) {
      case BadgeType.active:
        return 'badge-active';
      case BadgeType.beta:
        return 'badge-beta';
      case BadgeType.archive:
        return 'badge-archive';
      case BadgeType.featured:
        return 'badge-featured';
    }
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield DomComponent(
      tag: 'span',
      children: [Text(text)],
      classes: 'status-badge $_badgeClass',
    );
  }
}

class CategoryBadge extends StatelessComponent {
  const CategoryBadge({required this.type, required this.text, super.key});

  final CategoryType type;
  final String text;

  String get _categoryClass {
    switch (type) {
      case CategoryType.appsGames:
        return 'category-apps-games';
      case CategoryType.dartFlutter:
        return 'category-dart-flutter';
      case CategoryType.officeExcel:
        return 'category-office-excel';
      case CategoryType.gamingValues:
        return 'category-gaming-values';
      case CategoryType.community:
        return 'category-community';
    }
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield DomComponent(
      tag: 'span',
      children: [Text(text)],
      classes: 'category-badge $_categoryClass',
    );
  }
}

class TagBadge extends StatelessComponent {
  const TagBadge(this.text, {super.key});
  final String text;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield DomComponent(
      tag: 'span',
      children: [Text(text)],
      classes: 'tag-badge',
    );
  }
}

class CountBadge extends StatelessComponent {
  const CountBadge(this.count, {super.key});
  final int count;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield DomComponent(
      tag: 'span',
      children: [Text(count.toString())],
      classes: 'count-badge',
    );
  }
}
