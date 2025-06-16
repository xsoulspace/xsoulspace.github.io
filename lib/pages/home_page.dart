import 'package:jaspr/jaspr.dart';
import 'package:jaspr/server.dart';
import 'package:xsoulspace_web/components/molecules/sticky_nav.dart';
import 'package:xsoulspace_web/components/organisms/bento_grid.dart';
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

    // Loading state
    css('.loading-container').styles(
      raw: const {
        'display': 'flex',
        'flex-direction': 'column',
        'align-items': 'center',
        'justify-content': 'center',
        'min-height': '400px',
        'gap': '2rem',
      },
    ),

    css('.loading-spinner').styles(
      raw: const {
        'width': '48px',
        'height': '48px',
        'border': '4px solid #EDE7DD',
        'border-top': '4px solid #E07A5F',
        'border-radius': '50%',
        'animation': 'spin 1s linear infinite',
      },
    ),

    css('.loading-text').styles(
      raw: const {
        'font-size': '1.125rem',
        'color': '#6B4E3D',
        'font-weight': '500',
      },
    ),

    // Keyframe animation
    css('@keyframes spin').styles(
      raw: const {
        '0%': 'transform: rotate(0deg)',
        '100%': 'transform: rotate(360deg)',
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
                NavItem(title: 'Apps & Bots', targetId: 'apps-bots'),
                NavItem(title: 'Games', targetId: 'games'),
                NavItem(
                  title: 'Libraries & Utilities',
                  targetId: 'libraries-utilities',
                ),
                NavItem(title: 'Office & Excel', targetId: 'office-excel'),
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
      yield div(classes: 'loading-container', [
        div([], classes: 'loading-spinner'),
        p(classes: 'loading-text', [text('Loading projects...')]),
      ]);
      return;
    }

    if (projects.isEmpty) {
      yield div(classes: 'loading-container', [
        p(classes: 'loading-text', [text('No projects found.')]),
      ]);
      return;
    }

    // Display projects in the bento grid
    yield BentoGrid(projects: projects);
  }
}
