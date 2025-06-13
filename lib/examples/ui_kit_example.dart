import 'package:jaspr/jaspr.dart';

import '../components/models/project_model.dart';
import '../components/molecules/project_card.dart';
import '../components/organisms/bento_grid.dart';

/// Example page demonstrating the UI kit components with ceramic-inspired styling
class UIKitExample extends StatelessComponent {
  const UIKitExample({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final exampleProjects = _createExampleProjects();

    yield div(classes: 'ui-kit-example', [
      header(classes: 'ui-kit-header', [
        h1([text('xsoulspace UI Kit')]),
        p([text('A showcase of our ceramic-inspired design components')]),
      ]),

      // Individual Project Cards Section
      section(classes: 'cards-section', [
        h2([text('Project Cards')]),
        div(classes: 'cards-grid', [
          for (final project in exampleProjects.take(3))
            ProjectCard(
              project: project,
              size: ProjectCardSize.fromProject(project),
            ),
        ]),
      ]),

      // Bento Grid Section
      section(classes: 'bento-section', [
        h2([text('Bento Grid Layout')]),
        BentoGrid(projects: exampleProjects),
      ]),
    ]);
  }

  List<ProjectModel> _createExampleProjects() {
    return [
      ProjectModel.fromJson({
        'id': 'example-app',
        'title': 'Example App',
        'type': 'App',
        'repository': 'https://github.com/example/app',
        'description':
            'A beautiful example application showcasing our design principles.',
        'tags': ['flutter', 'mobile', 'design'],
        'links': {
          'demoUrl': 'https://example.com/demo',
          'website': 'https://example.com',
        },
        'languages': ['EN'],
        'coverImage': 'assets/example.png',
        'contributors': ['designer'],
        'hasPrivacy': true,
        'hasTerms': true,
        'hasLicense': true,
        'preferredSize': 'featured',
        'previewContent': {
          'thumbnailUrl': 'assets/example-thumb.png',
          'type': 'image',
        },
        'screenshots': [],
        'hasInteractiveDemo': true,
        'metrics': {
          'downloads': 1500,
          'stars': 42,
          'forks': 8,
          'issues': 2,
          'lastActivity': '2024-01-15T10:30:00Z',
        },
      }),
      ProjectModel.fromJson({
        'id': 'example-game',
        'title': 'Example Game',
        'type': 'Game',
        'repository': 'https://github.com/example/game',
        'description': 'An engaging game that demonstrates interactive design.',
        'tags': ['game', 'interactive', 'fun'],
        'links': {'demoUrl': 'https://example.com/play'},
        'languages': ['EN'],
        'coverImage': 'assets/game.png',
        'contributors': ['developer'],
        'hasPrivacy': false,
        'hasTerms': false,
        'hasLicense': true,
        'preferredSize': 'standard',
        'previewContent': {
          'thumbnailUrl': 'assets/game-thumb.png',
          'type': 'image',
        },
        'screenshots': [],
        'hasInteractiveDemo': false,
        'metrics': {
          'downloads': 890,
          'stars': 28,
          'forks': 5,
          'issues': 1,
          'lastActivity': '2024-01-10T14:20:00Z',
        },
      }),
      ProjectModel.fromJson({
        'id': 'example-package',
        'title': 'Example Package',
        'type': 'Package',
        'repository': 'https://github.com/example/package',
        'description': 'A useful utility package for developers.',
        'tags': ['dart', 'package', 'utility'],
        'links': {'pub.dev': 'https://pub.dev/packages/example'},
        'languages': ['EN'],
        'coverImage': 'assets/package.png',
        'contributors': ['maintainer'],
        'hasPrivacy': false,
        'hasTerms': false,
        'hasLicense': true,
        'preferredSize': 'micro',
        'previewContent': {
          'thumbnailUrl': 'assets/package-thumb.png',
          'type': 'image',
        },
        'screenshots': [],
        'hasInteractiveDemo': false,
        'metrics': {
          'downloads': 2500,
          'stars': 67,
          'forks': 12,
          'issues': 0,
          'lastActivity': '2024-01-18T09:15:00Z',
        },
      }),
      ProjectModel.fromJson({
        'id': 'example-bot',
        'title': 'Example Bot',
        'type': 'Bot',
        'repository': '',
        'description': 'A helpful bot for automation tasks.',
        'tags': ['bot', 'automation', 'telegram'],
        'links': {'telegram': 'https://t.me/example_bot'},
        'languages': ['EN', 'RU'],
        'coverImage': 'assets/bot.png',
        'contributors': ['creator'],
        'hasPrivacy': true,
        'hasTerms': true,
        'hasLicense': false,
        'preferredSize': 'standard',
        'previewContent': {
          'thumbnailUrl': 'assets/bot-thumb.png',
          'type': 'image',
        },
        'screenshots': [],
        'hasInteractiveDemo': false,
        'metrics': {
          'downloads': 0,
          'stars': 24,
          'forks': 3,
          'issues': 1,
          'lastActivity': '2024-01-12T16:45:00Z',
        },
      }),
    ];
  }

  @css
  static List<StyleRule> get styles => [
    css('.ui-kit-example').styles(
      raw: const {'max-width': '1200px', 'margin': '0 auto', 'padding': '2rem'},
    ),

    css(
      '.ui-kit-header',
    ).styles(raw: const {'text-align': 'center', 'margin-bottom': '3rem'}),

    css('.ui-kit-header h1').styles(
      raw: const {
        'font-size': '2.5rem',
        'color': '#4E342E',
        'margin': '0 0 1rem',
      },
    ),

    css('.ui-kit-header p').styles(
      raw: const {'font-size': '1.125rem', 'color': '#6B4E3D', 'margin': '0'},
    ),

    css(
      '.cards-section, .bento-section',
    ).styles(raw: const {'margin-bottom': '4rem'}),

    css('.cards-section h2, .bento-section h2').styles(
      raw: const {
        'font-size': '1.75rem',
        'color': '#4E342E',
        'margin': '0 0 2rem',
        'border-bottom': '2px solid #EDE7DD',
        'padding-bottom': '0.5rem',
      },
    ),

    css('.cards-grid').styles(
      raw: const {
        'display': 'grid',
        'grid-template-columns': 'repeat(auto-fit, minmax(300px, 1fr))',
        'gap': '1.5rem',
      },
    ),
  ];
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
