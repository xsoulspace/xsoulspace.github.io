import 'package:jaspr/jaspr.dart';

import '../atoms/typography.dart';

/// Sidebar navigation item molecule
/// Individual navigation elements with ceramic-inspired styling

class SidebarNavItem extends StatelessComponent {
  const SidebarNavItem({
    required this.text,
    required this.href,
    this.isActive = false,
    this.icon,
    this.count,
    super.key,
  });

  final String text;
  final String href;
  final bool isActive;
  final String? icon;
  final int? count;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final classes = [
      'sidebar-nav-item',
      if (isActive) 'nav-item-active',
    ].join(' ');

    yield a(
      [
        div([
          if (icon != null) ...[
            DomComponent(
              tag: 'span',
              children: [Text(icon!)],
              classes: 'nav-item-icon',
            ),
          ],
          NavItem(text),
          if (count != null) ...[
            DomComponent(
              tag: 'span',
              children: [Text(count.toString())],
              classes: 'nav-item-count',
            ),
          ],
        ], classes: 'nav-item-content'),
      ],
      href: href,
      classes: classes,
    );
  }
}

class SidebarCategoryHeader extends StatelessComponent {
  const SidebarCategoryHeader({
    required this.title,
    this.count,
    this.icon,
    super.key,
  });

  final String title;
  final int? count;
  final String? icon;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div([
      div([
        if (icon != null) ...[
          DomComponent(
            tag: 'span',
            children: [Text(icon!)],
            classes: 'category-icon',
          ),
        ],
        NavCategory(title),
        if (count != null) ...[
          DomComponent(
            tag: 'span',
            children: [Text('($count)')],
            classes: 'category-count',
          ),
        ],
      ], classes: 'category-header-content'),
    ], classes: 'sidebar-category-header');
  }
}
