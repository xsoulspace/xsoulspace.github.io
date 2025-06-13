import 'package:jaspr/jaspr.dart';

import '../components/ui_kit.dart';

/// Example usage of the UI kit components
/// Demonstrates the ceramic-inspired design system

class UIKitExample extends StatelessComponent {
  const UIKitExample({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    // Sample navigation data
    final navigationCategories = [
      NavigationCategory(
        title: 'Apps & Games',
        icon: '📱',
        items: [
          NavigationItem(text: 'Flutter Apps', href: '/apps'),
          NavigationItem(text: 'Web Games', href: '/games'),
        ],
      ),
      NavigationCategory(
        title: 'Development',
        icon: '🔧',
        items: [
          NavigationItem(text: 'Dart Packages', href: '/packages'),
          NavigationItem(text: 'Tools', href: '/tools'),
        ],
      ),
    ];

    // Sample project cards
    final sampleProjects = [
      ProjectCard(
        title: 'Flutter Portfolio',
        description: 'A beautiful portfolio app built with Flutter',
        subtitle: 'Mobile Application',
        href: '/projects/portfolio',
        status: BadgeType.active,
        category: CategoryType.appsGames,
        tags: ['Flutter', 'Mobile', 'Portfolio'],
        metadata: 'Updated 2 days ago',
      ),
      ProjectCard(
        title: 'Dart Utils Package',
        description: 'Utility functions for Dart development',
        subtitle: 'Open Source Package',
        href: '/projects/utils',
        status: BadgeType.beta,
        category: CategoryType.dartFlutter,
        tags: ['Dart', 'Utils', 'Package'],
        size: CardSize.wide,
        metadata: 'v1.2.0',
      ),
    ];

    // Sample bento grid sections
    final bentoSections = [
      BentoGridSection(
        title: 'Featured Projects',
        subtitle: 'Highlighted work and achievements',
        icon: '⭐',
        categoryType: CategoryType.appsGames,
        projects: sampleProjects,
      ),
    ];

    yield AppLayout(
      sidebar: SidebarNav(
        brandTitle: 'XSoulSpace',
        brandSubtitle: 'Creative Development',
        categories: navigationCategories,
        currentPath: '/apps',
      ),
      content: MainContent(
        children: [
          PageHeader(
            title: 'UI Kit Example',
            subtitle: 'Ceramic-inspired design system components',
            breadcrumbs: ['Home', 'Examples', 'UI Kit'],
          ),

          ContentSection(children: [BentoGrid(sections: bentoSections)]),
        ],
      ),
    );
  }
}

/// Example page demonstrating individual components
class ComponentShowcase extends StatelessComponent {
  const ComponentShowcase({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div([
      // Typography examples
      SectionHeader(
        title: 'Typography',
        subtitle: 'Text components with ceramic styling',
        icon: '📝',
      ),

      div([
        BrandTitle('Brand Title Example'),
        BrandSubtitle('Brand subtitle with warm styling'),
        SectionTitle('Section Title'),
        CardTitle('Card Title'),
        CardSubtitle('Card Subtitle'),
        CardDescription('This is a card description with muted taupe color.'),
        CardMeta('Metadata • Updated recently'),
      ], classes: 'typography-examples'),

      // Badge examples
      SectionHeader(
        title: 'Badges',
        subtitle: 'Status and category indicators',
        icon: '🏷️',
      ),

      div([
        StatusBadge(type: BadgeType.active, text: 'Active'),
        StatusBadge(type: BadgeType.beta, text: 'Beta'),
        StatusBadge(type: BadgeType.archive, text: 'Archive'),
        StatusBadge(type: BadgeType.featured, text: 'Featured'),
      ], classes: 'badge-examples'),

      div([
        CategoryBadge(type: CategoryType.appsGames, text: 'Apps & Games'),
        CategoryBadge(type: CategoryType.dartFlutter, text: 'Dart & Flutter'),
        CategoryBadge(type: CategoryType.officeExcel, text: 'Office & Excel'),
        CategoryBadge(type: CategoryType.gamingValues, text: 'Gaming & Values'),
        CategoryBadge(type: CategoryType.community, text: 'Community'),
      ], classes: 'category-badge-examples'),

      // Button examples
      SectionHeader(
        title: 'Buttons',
        subtitle: 'Interactive elements with ceramic styling',
        icon: '🔘',
      ),

      div([
        CeramicButton(
          text: 'Primary Button',
          variant: ButtonVariant.primary,
          onPressed: () => print('Primary clicked'),
        ),
        CeramicButton(
          text: 'Secondary Button',
          variant: ButtonVariant.secondary,
          onPressed: () => print('Secondary clicked'),
        ),
        CeramicButton(
          text: 'Ghost Button',
          variant: ButtonVariant.ghost,
          onPressed: () => print('Ghost clicked'),
        ),
        LinkButton(
          text: 'External Link',
          href: 'https://example.com',
          external: true,
          icon: '🔗',
        ),
      ], classes: 'button-examples'),
    ], classes: 'component-showcase');
  }
}
