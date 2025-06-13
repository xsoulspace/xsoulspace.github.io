import 'package:jaspr/jaspr.dart';

import 'sidebar_nav.dart';

/// Main content area organism
/// Primary content display with ceramic-inspired layout

class MainContent extends StatelessComponent {
  const MainContent({
    required this.children,
    this.sidebarOpen = true,
    this.padding = true,
    super.key,
  });

  final List<Component> children;
  final bool sidebarOpen;
  final bool padding;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final classes = [
      'main-content',
      if (sidebarOpen) 'content-with-sidebar' else 'content-full-width',
      if (padding) 'content-padded',
    ].join(' ');

    yield DomComponent(
      tag: 'main',
      children: [div(children, classes: 'content-inner')],
      classes: classes,
    );
  }
}

class AppLayout extends StatelessComponent {
  const AppLayout({
    required this.sidebar,
    required this.content,
    this.mobileToggle,
    this.overlay,
    super.key,
  });

  final SidebarNav sidebar;
  final MainContent content;
  final MobileSidebarToggle? mobileToggle;
  final SidebarOverlay? overlay;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div([
      // Mobile toggle button
      if (mobileToggle != null) mobileToggle!,

      // Sidebar
      sidebar,

      // Main content
      content,

      // Mobile overlay
      if (overlay != null) overlay!,
    ], classes: 'app-layout ceramic-theme');
  }
}

class ContentSection extends StatelessComponent {
  const ContentSection({
    required this.children,
    this.spacing = true,
    this.background,
    super.key,
  });

  final List<Component> children;
  final bool spacing;
  final String? background; // CSS class for background variant

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final classes = [
      'content-section',
      if (spacing) 'section-spaced',
      if (background != null) background!,
    ].join(' ');

    yield div(children, classes: classes);
  }
}

class HeroSection extends StatelessComponent {
  const HeroSection({
    required this.title,
    required this.description,
    this.subtitle,
    this.actions = const [],
    this.backgroundImage,
    super.key,
  });

  final String title;
  final String description;
  final String? subtitle;
  final List<Component> actions;
  final String? backgroundImage;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final classes = [
      'hero-section',
      if (backgroundImage != null) 'hero-with-bg',
    ].join(' ');

    yield section([
      div([
        div([
          h1([Text(title)], classes: 'hero-title'),
          if (subtitle != null) ...[
            p([Text(subtitle!)], classes: 'hero-subtitle'),
          ],
          p([Text(description)], classes: 'hero-description'),
          if (actions.isNotEmpty) ...[div(actions, classes: 'hero-actions')],
        ], classes: 'hero-content'),
      ], classes: 'hero-inner'),
    ], classes: classes);
  }
}

class PageHeader extends StatelessComponent {
  const PageHeader({
    required this.title,
    this.subtitle,
    this.breadcrumbs = const [],
    this.actions = const [],
    super.key,
  });

  final String title;
  final String? subtitle;
  final List<String> breadcrumbs;
  final List<Component> actions;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield header([
      div([
        // Breadcrumbs
        if (breadcrumbs.isNotEmpty) ...[
          nav([
            for (int i = 0; i < breadcrumbs.length; i++) ...[
              if (i > 0) ...[
                DomComponent(
                  tag: 'span',
                  children: [Text(' / ')],
                  classes: 'breadcrumb-separator',
                ),
              ],
              DomComponent(
                tag: 'span',
                children: [Text(breadcrumbs[i])],
                classes: i == breadcrumbs.length - 1
                    ? 'breadcrumb-current'
                    : 'breadcrumb-item',
              ),
            ],
          ], classes: 'breadcrumbs'),
        ],

        // Title section
        div([
          h1([Text(title)], classes: 'page-title'),
          if (subtitle != null) ...[
            p([Text(subtitle!)], classes: 'page-subtitle'),
          ],
        ], classes: 'page-title-section'),

        // Actions
        if (actions.isNotEmpty) ...[div(actions, classes: 'page-actions')],
      ], classes: 'page-header-content'),
    ], classes: 'page-header');
  }
}
