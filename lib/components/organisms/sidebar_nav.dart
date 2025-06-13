import 'package:jaspr/jaspr.dart';

import '../atoms/typography.dart';
import '../molecules/sidebar_nav_item.dart';

/// Sidebar navigation organism
/// Main navigation component with ceramic-inspired design

class NavigationItem {
  const NavigationItem({
    required this.text,
    required this.href,
    this.icon,
    this.count,
  });

  final String text;
  final String href;
  final String? icon;
  final int? count;
}

class NavigationCategory {
  const NavigationCategory({
    required this.title,
    required this.items,
    this.icon,
  });

  final String title;
  final List<NavigationItem> items;
  final String? icon;
}

class SidebarNav extends StatelessComponent {
  const SidebarNav({
    required this.brandTitle,
    required this.brandSubtitle,
    required this.categories,
    this.currentPath = '',
    this.isOpen = true,
    super.key,
  });

  final String brandTitle;
  final String brandSubtitle;
  final List<NavigationCategory> categories;
  final String currentPath;
  final bool isOpen;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final classes = [
      'sidebar-nav',
      if (isOpen) 'sidebar-open' else 'sidebar-closed',
    ].join(' ');

    yield aside([
      // Brand header
      div([
        BrandTitle(brandTitle),
        BrandSubtitle(brandSubtitle),
      ], classes: 'sidebar-brand'),

      // Navigation content
      nav([
        for (final category in categories) ...[
          div([
            // Category header
            SidebarCategoryHeader(
              title: category.title,
              icon: category.icon,
              count: category.items.length,
            ),

            // Category items
            div([
              for (final item in category.items) ...[
                SidebarNavItem(
                  text: item.text,
                  href: item.href,
                  icon: item.icon,
                  count: item.count,
                  isActive: _isActive(item.href),
                ),
              ],
            ], classes: 'nav-category-items'),
          ], classes: 'nav-category'),
        ],
      ], classes: 'sidebar-navigation'),
    ], classes: classes);
  }

  bool _isActive(String href) {
    if (currentPath.isEmpty) return false;
    return currentPath == href || currentPath.startsWith('$href/');
  }
}

class MobileSidebarToggle extends StatelessComponent {
  const MobileSidebarToggle({required this.isOpen, this.onToggle, super.key});

  final bool isOpen;
  final VoidCallback? onToggle;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield button(
      [
        div([
          DomComponent(tag: 'span', classes: 'hamburger-line'),
          DomComponent(tag: 'span', classes: 'hamburger-line'),
          DomComponent(tag: 'span', classes: 'hamburger-line'),
        ], classes: 'hamburger-icon'),
      ],
      classes: 'mobile-sidebar-toggle ${isOpen ? 'toggle-open' : ''}',
      attributes: {
        'type': 'button',
        'aria-label': isOpen ? 'Close navigation' : 'Open navigation',
      },
      events: {if (onToggle != null) 'click': (event) => onToggle!()},
    );
  }
}

class SidebarOverlay extends StatelessComponent {
  const SidebarOverlay({required this.isVisible, this.onClose, super.key});

  final bool isVisible;
  final VoidCallback? onClose;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    if (!isVisible) return;

    yield div(
      [],
      classes: 'sidebar-overlay',
      events: {if (onClose != null) 'click': (event) => onClose!()},
    );
  }
}
