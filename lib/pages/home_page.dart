import 'package:jaspr/jaspr.dart';
import 'package:jaspr/server.dart';
import 'package:xsoulspace_web/components/atoms/loading_indicator.dart';
import 'package:xsoulspace_web/components/models/bento_block_model.dart';
import 'package:xsoulspace_web/components/models/project_group_model.dart';
import 'package:xsoulspace_web/components/models/project_model.dart';
import 'package:xsoulspace_web/components/molecules/sticky_nav.dart';
import 'package:xsoulspace_web/components/organisms/bento_section.dart';
import 'package:xsoulspace_web/services/projects_service.dart';

// Global state container to be injected into each client component tree
final _projectsServiceContainer = ProjectsService.instance;

// Inherited component to provide the service down the tree
class InheritedProjectsService extends InheritedComponent {
  const InheritedProjectsService({
    required this.service,
    required super.child,
    super.key,
  });

  final ProjectsService service;

  static ProjectsService of(BuildContext context) {
    final inherited = context
        .dependOnInheritedComponentOfExactType<InheritedProjectsService>();
    return inherited?.service ?? ProjectsService.instance;
  }

  @override
  bool updateShouldNotify(InheritedProjectsService oldWidget) {
    return service != oldWidget.service;
  }
}

// By using the @client annotation this component will be automatically compiled to javascript and mounted
// on the client. Therefore:
// - this file and any imported file must be compilable for both server and client environments.
// - this component and any child components will be built once on the server during pre-rendering and then
//   again on the client during normal rendering.
@client
class HomePage extends StatefulComponent {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

  @css
  static List<StyleRule> get styles => [
    // Main page container
    css('.home-page').styles(
      raw: const {
        'min-height': '100vh',
        'background-color': '#FAF6F0', // unglazed-bisque
        'background-image': '''
        radial-gradient(circle at 20% 50%, rgba(224, 122, 95, 0.03) 0%, transparent 50%),
        radial-gradient(circle at 80% 20%, rgba(129, 178, 154, 0.03) 0%, transparent 50%),
        radial-gradient(circle at 40% 80%, rgba(242, 204, 143, 0.03) 0%, transparent 50%)
      ''',
      },
    ),
    css('.home-page-layout').styles(
      raw: const {
        'display': 'grid',
        'grid-template-columns': '250px 1fr',
        'gap': '2rem',
        'max-width': '1800px',
        'margin': '0 auto',
        'padding-top': '4rem',
      },
    ),
    css('.home-page-layout__nav').styles(raw: const {'grid-column': '1'}),
    css('.home-page-layout__main').styles(
      raw: const {
        'grid-column': '2',
        'min-width': '0', // Prevents grid blowout
      },
    ),

    // Hero section
    css('.home-hero').styles(
      raw: const {
        'padding': '4rem 2rem 2rem',
        'text-align': 'center',
        'max-width': '800px',
        'margin': '0 auto',
      },
    ),

    css('.home-hero__title').styles(
      raw: const {
        'font-size': '3rem',
        'font-weight': '300',
        'color': '#4E342E', // earthy-brown
        'margin': '0 0 1rem',
        'line-height': '1.2',
        'background': 'linear-gradient(135deg, #4E342E 0%, #6B4E3D 100%)',
        'background-clip': 'text',
        '-webkit-background-clip': 'text',
        '-webkit-text-fill-color': 'transparent',
      },
    ),

    css('.home-hero__subtitle').styles(
      raw: const {
        'font-size': '1.25rem',
        'font-weight': '400',
        'color': '#6B4E3D', // warm-umber
        'margin': '0 0 2rem',
        'line-height': '1.6',
        'max-width': '600px',
        'margin-left': 'auto',
        'margin-right': 'auto',
      },
    ),

    css('.home-hero__tagline').styles(
      raw: const {
        'font-size': '1rem',
        'font-weight': '400',
        'color': '#8B7355', // muted-taupe
        'margin': '0',
        'font-style': 'italic',
      },
    ),

    // Empty state
    css('.empty-state-container').styles(
      raw: const {
        'display': 'flex',
        'flex-direction': 'column',
        'align-items': 'center',
        'justify-content': 'center',
        'min-height': '400px',
        'gap': '2rem',
      },
    ),
    css('.empty-state-text').styles(
      raw: const {
        'font-size': '1.125rem',
        'color': '#6B4E3D',
        'font-weight': '500',
      },
    ),

    // Responsive design
    css.media(MediaQuery.screen(maxWidth: 768.px), [
      css('.home-hero').styles(raw: const {'padding': '2rem 1rem 1rem'}),

      css('.home-hero__title').styles(raw: const {'font-size': '2.25rem'}),

      css('.home-hero__subtitle').styles(raw: const {'font-size': '1.125rem'}),
    ]),

    css.media(MediaQuery.screen(maxWidth: 480.px), [
      css('.home-hero__title').styles(raw: const {'font-size': '1.875rem'}),

      css('.home-hero__subtitle').styles(raw: const {'font-size': '1rem'}),
    ]),
  ];
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // Initialize client-side logic if needed
    if (kIsWeb) {
      // Ensure the service is initialized on the client
      _projectsServiceContainer.fetchProjects();
    }
  }

  @override
  Iterable<Component> build(final BuildContext context) sync* {
    // Inject the shared container at the root of the client component tree
    yield InheritedProjectsService(
      service: _projectsServiceContainer,
      child: _HomePageContent(),
    );
  }
}

class _HomePageContent extends StatelessComponent {
  const _HomePageContent({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final projectsService = InheritedProjectsService.of(context);

    yield div(classes: 'home-page', [
      // Hero section
      section(classes: 'home-hero', [
        p(classes: 'home-hero__subtitle', [text('xsoulspace')]),
        h1(classes: 'home-hero__title', [
          text('Crafting digital pieces to make life friendlier:)'),
        ]),
        p(classes: 'home-hero__tagline', [
          text('or a careful mix of experiences, art, tech, and ethics'),
        ]),
      ]),

      // Main layout with sticky nav
      div(classes: 'home-page-layout', [
        // Sidebar Navigation
        aside(classes: 'home-page-layout__nav', [
          if (!projectsService.isLoading)
            StickyNav(
              items: [
                NavItem(
                  title: 'Apps, Bots & Games',
                  targetId: 'apps-bots-games',
                ),
                NavItem(
                  title: 'Dart & Flutter packages',
                  targetId: 'dart-flutter-packages',
                ),
                NavItem(title: 'Office & Excel', targetId: 'office-excel'),
                NavItem(title: 'Ethics & Values', targetId: 'ethics-values'),
                NavItem(
                  title: 'Thoughts To Care',
                  targetId: 'thoughts-to-care',
                ),
              ],
            ),
        ]),

        // Main content area
        main_(classes: 'home-page-layout__main', [
          // On server: render directly without ListenableBuilder
          // On client: use ListenableBuilder for reactive updates
          if (kIsWeb)
            ListenableBuilder(
              listenable: projectsService,
              builder: (context) sync* {
                yield* _buildContent(projectsService);
              },
            )
          else
            // Server-side: render directly
            ..._buildContent(projectsService),
        ]),
      ]),
    ]);
  }

  Iterable<Component> _buildContent(ProjectsService projectsService) sync* {
    final isLoading = projectsService.isLoading;
    final projects = projectsService.projects;

    if (isLoading) {
      yield LoadingIndicator(textMessage: 'Loading projects...');
      return;
    }

    if (projects.isEmpty) {
      yield div(classes: 'empty-state-container', [
        p(classes: 'empty-state-text', [text('No projects found.')]),
      ]);
      return;
    }

    final projectGroups = _createPredefinedSections(projects);

    // Display projects in bento sections
    for (final group in projectGroups) {
      yield BentoSection(group: group);
    }
  }

  List<ProjectGroup> _createPredefinedSections(
    Map<ProjectId, ProjectModel> projects,
  ) {
    return [
      // Section 1: Apps, Bots & Games
      ProjectGroup(
        anchor: 'Apps, Bots & Games',
        title: 'Apps, Bots & Games',
        icon: '🪄',
        accentColor: '#E07A5F', // terracotta
        blocks: _createBlocksFromIds([
          'health', // accent
          'world_by_word_game',
          'daily_budget_planner',
          'vitamin-mix-bot',
          'last_answer',
          'learn_play', // accent
        ], projects),
        layoutType: 'showcase',
      ),

      // Section 2: Dart & Flutter packages
      ProjectGroup(
        anchor: 'Dart & Flutter packages',
        title: 'Development tools and reusable packages',
        icon: '🥢',
        accentColor: '#81B29A', // sage-glaze
        blocks: _createBlocksFromIds([
          'flutter_dart_utilities', // accent
          'xsoulspace_lints',
          'from_json_to_json',
          'is_dart_empty_or_not',
          'xsoulspace_locale',
          'flutter_cli_ui',
          'xsoulspace_foundation', // actual project
        ], projects),
      ),

      // Section 3: Office & Excel
      ProjectGroup(
        anchor: 'Office & Excel',
        title: 'Productivity and business tools',
        icon: '🧩',
        accentColor: '#F2CC8F', // sandstone
        blocks: _createBlocksFromIds([
          'flutter_addins_excel', // accent
          'excel_outlook_compatible', // accent
          'tables_syncer',
          'dart_office_addins', // accent
          'officejs_dart',
          'sheets_manager',
          'office_addin_helper',
        ], projects),
      ),

      // Section 4: Ethics & Values (accents only)
      ProjectGroup(
        anchor: 'Ethics & Values',
        title: 'Everything is based on Ethics Foundation',
        icon: '✨',
        accentColor: '#B48A6E', // muted earth tone
        blocks: _createBlocksFromIds([
          'apps_ethics_games', // accent
          'convenience_simplicity_usefulness', // accent
          'safety_longevity_creativity_fun', // accent
          'usefulness_challenge_style', // accent
        ], projects),
      ),

      // Section 5: Personal Thoughts
      ProjectGroup(
        anchor: 'Thoughts To Care',
        title: 'Personal Thoughts of why to care:',
        icon: '💭',
        accentColor: '#4A5C6A', // dark slate blue
        blocks: _createBlocksFromIds([
          'personal_thoughts', // accent with long text
        ], projects),
      ),
    ];
  }

  List<BentoBlock> _createBlocksFromIds(
    List<String> ids,
    Map<ProjectId, ProjectModel> projects,
  ) {
    return ids
        .map((id) {
          // Check if it's a project ID
          final projectId = ProjectId(id);
          if (projects.containsKey(projectId)) {
            return BentoBlock(project: projects[projectId]);
          }

          // Otherwise, create an accent block
          return BentoBlock(accent: _createAccentBlock(id));
        })
        .where((block) => block.project != null || block.accent != null)
        .toList();
  }

  AccentBlock _createAccentBlock(String id) {
    switch (id) {
      case 'health':
        return AccentBlock(
          title: 'Health',
          backgroundColor: '#4A5C6A', // Dark slate blue
          size: ProjectSize.standard,
        );
      case 'learn_play':
        return AccentBlock(
          title: 'Learn & Play',
          backgroundColor: '#B48A6E', // Muted earth tone
          size: ProjectSize.standard,
        );
      case 'flutter_dart_utilities':
        return AccentBlock(
          title: 'Flutter & Dart utilities and packages',
          backgroundColor: '#81B29A', // sage-glaze
          size: ProjectSize.featured,
        );
      case 'xsoulspace_foundation_packages':
        return AccentBlock(
          title: 'xsoulspace foundation packages',
          backgroundColor: '#81B29A', // sage-glaze
          size: ProjectSize.standard,
        );
      case 'flutter_addins_excel':
        return AccentBlock(
          title: 'Flutter Addins for MS Excel',
          backgroundColor: '#F2CC8F', // sandstone
          size: ProjectSize.standard,
        );
      case 'excel_outlook_compatible':
        return AccentBlock(
          title: 'can be used for Excel, Outlook',
          backgroundColor: '#F2CC8F', // sandstone
          size: ProjectSize.micro,
        );
      case 'dart_office_addins':
        return AccentBlock(
          title: 'Dart for Microsoft Office Web Addins',
          backgroundColor: '#F2CC8F', // sandstone
          size: ProjectSize.standard,
        );
      case 'apps_ethics_games':
        return AccentBlock(
          title: 'Apps, Ethics & Values, Games',
          subtitle: 'Core categories of work',
          backgroundColor: '#B48A6E', // muted earth tone
          size: ProjectSize.featured,
        );
      case 'convenience_simplicity_usefulness':
        return AccentBlock(
          title: 'Convenience, Simplicity, Usefulness',
          backgroundColor: '#E07A5F', // terracotta
          size: ProjectSize.standard,
        );
      case 'safety_longevity_creativity_fun':
        return AccentBlock(
          title: 'Safety, Longevity (Durability), Creativity, Fun',
          backgroundColor: '#81B29A', // sage-glaze
          size: ProjectSize.standard,
        );
      case 'usefulness_challenge_style':
        return AccentBlock(
          title: 'Usefulness, Challenge, Style',
          backgroundColor: '#F2CC8F', // sandstone
          size: ProjectSize.standard,
        );
      case 'personal_thoughts':
        return AccentBlock(
          title: '',
          subtitle: '''I love to use Excel.
For me the most important thing in it is its durability:
even if a file created 10 years ago it will still work like or almost like intended.. 

The same thing with macOS - it just works, even you spilled at it the whole cup of lemon water and it was half of year in repair. When you open it again, it still has everything untouched like you just worked.

Playing games, drawing, studying and reading books is fun. And I think the art should be a part of the everything - game, education and science can coexist together and the best way to learn something - by doing..
Anton Malofeev (Arenukvern)''',
          backgroundColor: '#4A5C6A', // dark slate blue
          size: ProjectSize.text,
        );
      default:
        return AccentBlock(
          title: 'Placeholder',
          backgroundColor: '#8B7355', // muted-taupe
          size: ProjectSize.micro,
        );
    }
  }
}
