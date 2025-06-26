import 'package:jaspr/jaspr.dart';
import 'package:jaspr/server.dart';
import 'package:xsoulspace_web/components/atoms/loading_indicator.dart';
import 'package:xsoulspace_web/components/models/bento_block_model.dart';
import 'package:xsoulspace_web/components/models/project_group_model.dart';
import 'package:xsoulspace_web/components/models/project_model.dart';
import 'package:xsoulspace_web/components/molecules/sticky_nav.dart';
import 'package:xsoulspace_web/components/organisms/bento_section.dart';
import 'package:xsoulspace_web/components/organisms/mobile_menu_overlay.dart';
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
    css('.home-page__top-nav').styles(
      raw: const {
        'display': 'none', // Hidden on desktop
        'justify-content': 'space-between',
        'align-items': 'center',
      },
    ),
    css(
      '.home-page__top-nav-title',
    ).styles(raw: const {'font-weight': '600', 'color': '#4E342E'}),
    css('.home-page__menu-button').styles(
      raw: const {
        'background': 'none',
        'border': 'none',
        'cursor': 'pointer',
        'padding': '0.5rem',
        'font-size': '1.5rem',
        'color': '#4E342E',
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
    css('.gap__8').styles(raw: const {'height': '8rem'}),
    css('.gap__4').styles(raw: const {'height': '4rem'}),

    // Responsive design
    css.media(MediaQuery.screen(maxWidth: 1024.px), [
      css('.home-page-layout').styles(
        raw: const {
          'grid-template-columns': '1fr', // Single column layout on mobile
          'padding-top': '1rem',
        },
      ),
      css('.home-page-layout__nav').styles(
        raw: const {
          'display': 'none', // Hide sidebar on mobile
        },
      ),
      css('.home-page-layout__main').styles(
        raw: const {
          'grid-column': '1', // Main content takes full width
        },
      ),
      css('.home-page__top-nav').styles(
        raw: const {
          'display': 'flex', // Show top nav on mobile
          'padding': '0 1rem',
          'height': '60px',
          'background-color': 'rgba(250, 246, 240, 0.8)',
          'backdrop-filter': 'blur(10px)',
          'border-bottom': '1px solid #D4C4B0',
          'position': 'sticky',
        },
      ),
    ]),

    css.media(MediaQuery.screen(maxWidth: 768.px), [
      css('.home-hero').styles(raw: const {'padding': '2rem 1rem 1rem'}),

      css('.home-hero__title').styles(raw: const {'font-size': '2.25rem'}),

      css('.home-hero__subtitle').styles(raw: const {'font-size': '1.125rem'}),
    ]),

    css.media(MediaQuery.screen(maxWidth: 480.px), [
      css('.home-hero__title').styles(raw: const {'font-size': '1.875rem'}),

      css('.home-hero__subtitle').styles(raw: const {'font-size': '1rem'}),
    ]),

    // Animation for overlay
    css('.menu-overlay-enter-active, .menu-overlay-leave-active').styles(
      raw: const {'transition': 'opacity 0.3s ease, transform 0.3s ease'},
    ),
    css(
      '.menu-overlay-enter-from, .menu-overlay-leave-to',
    ).styles(raw: const {'opacity': '0', 'transform': 'translateY(20px)'}),
  ];
}

class _HomePageState extends State<HomePage> {
  bool _isMenuOpen = false;

  void _toggleMenu() {
    setState(() => _isMenuOpen = !_isMenuOpen);
  }

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
      child: Builder(
        builder: (context) sync* {
          final projectsService = InheritedProjectsService.of(context);
          final sidebar = StickyNav(
            items: [
              NavItem(title: 'Apps, Bots & Games', targetId: 'apps-bots-games'),
              NavItem(
                title: 'Dart & Flutter packages',
                targetId: 'dart-flutter-packages',
              ),
              NavItem(title: 'Office & Excel', targetId: 'office-excel'),
              NavItem(title: 'Ethics & Values', targetId: 'ethics-values'),
              NavItem(title: 'Thoughts To Care', targetId: 'thoughts-to-care'),
            ],
          );
          yield div(classes: 'home-page', [
            // Top navigation for mobile
            header(classes: 'home-page__top-nav', [
              span(classes: 'home-page__top-nav-title', [text('xsoulspace')]),
              button(
                classes: 'home-page__menu-button',
                events: {'click': (e) => _toggleMenu()},
                [i(classes: _isMenuOpen ? 'fas fa-times' : 'fas fa-bars', [])],
              ),
            ]),

            // Mobile Menu Overlay
            if (_isMenuOpen)
              MobileMenuOverlay(items: sidebar.items, onClose: _toggleMenu),

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
            div(classes: 'gap__4', []),

            // Main layout with sticky nav
            div(classes: 'home-page-layout', [
              // Sidebar Navigation
              aside(classes: 'home-page-layout__nav', [
                if (kIsWeb)
                  ListenableBuilder(
                    listenable: projectsService,
                    builder: (context) sync* {
                      if (!projectsService.isLoading) {
                        yield sidebar;
                      }
                    },
                  )
                // Server-side: render directly
                else if (!projectsService.isLoading)
                  sidebar,
              ]),

              // Main content area
              main_(classes: 'home-page-layout__main', [
                // On server: render directly without ListenableBuilder
                // On client: use ListenableBuilder for reactive updates
                if (kIsWeb)
                  ListenableBuilder(
                    listenable: projectsService,
                    builder: (context) sync* {
                      yield* _buildContent(
                        projectsService,
                        isMenuOpen: _isMenuOpen,
                      );
                    },
                  )
                else
                  // Server-side: render directly
                  ..._buildContent(projectsService, isMenuOpen: _isMenuOpen),
              ]),
            ]),
          ]);
        },
      ),
    );
  }

  Iterable<Component> _buildContent(
    ProjectsService projectsService, {
    required bool isMenuOpen,
  }) sync* {
    if (projectsService.isLoading && !isMenuOpen) {
      yield LoadingIndicator(textMessage: 'Loading projects...');
      return;
    }

    final projectGroups = _buildProjectGroups(projectsService.projectGroups);

    if (projectGroups.isEmpty && !isMenuOpen) {
      yield div(classes: 'empty-state-container', [
        p(classes: 'empty-state-text', [text('No projects found.')]),
      ]);
      return;
    }

    // Display projects in bento sections
    for (final group in projectGroups) {
      yield BentoSection(group: group);
      yield div(classes: 'gap__8', []);
    }
  }

  List<ProjectGroup> _buildProjectGroups(
    Map<String, List<ProjectModel>> groups,
  ) {
    final groupMetadata = {
      'apps_and_games': {
        'anchor': 'apps-bots-games',
        'title': 'Apps, Bots & Games',
        'icon': '🪄',
        'accentColor': '#E07A5F',
      },
      'dart_packages': {
        'anchor': 'dart-flutter-packages',
        'title': 'Development tools and reusable packages',
        'icon': '🥢',
        'accentColor': '#81B29A',
      },
      'excel_addins': {
        'anchor': 'office-excel',
        'title': 'Productivity and business tools',
        'icon': '🧩',
        'accentColor': '#F2CC8F',
      },
      'ethics_and_values': {
        'anchor': 'ethics-values',
        'title': 'Everything is based on Ethics Foundation',
        'icon': '✨',
        'accentColor': '#B48A6E',
      },
    };

    final projectGroups = <ProjectGroup>[];

    for (final entry in groups.entries) {
      final groupKey = entry.key;
      final projects = entry.value;
      final metadata = groupMetadata[groupKey];

      if (metadata == null) continue;

      final blocks = projects.map((project) {
        if (project.projectType.isAccent ||
            project.projectType.isConcept ||
            project.projectType.isValue) {
          return BentoBlock(
            accent: AccentBlock(
              title: project.title,
              subtitle: project.description,
              colSpan: project.colSpan,
              rowSpan: project.rowSpan,
            ),
          );
        }
        return BentoBlock(project: project);
      }).toList();

      projectGroups.add(
        ProjectGroup(
          anchor: metadata['anchor']!,
          title: metadata['title']!,
          icon: metadata['icon']!,
          accentColor: metadata['accentColor']!,
          blocks: blocks,
        ),
      );
    }
    return projectGroups;
  }
}
