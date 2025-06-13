import 'package:jaspr/jaspr.dart';
import 'package:jaspr/server.dart';
import 'package:xsoulspace_web/examples/ui_kit_example.dart';
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
  static List<StyleRule> get styles => [];
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

    // On server: render directly without ListenableBuilder since notifyListeners won't be called
    // On client: use ListenableBuilder for reactive updates
    if (kIsWeb) {
      yield ListenableBuilder(
        listenable: projectsService,
        builder: (context) sync* {
          yield* _buildContent(projectsService);
        },
      );
    } else {
      // Server-side: render directly
      yield* _buildContent(projectsService);
    }
  }

  Iterable<Component> _buildContent(ProjectsService projectsService) sync* {
    final isLoading = projectsService.isLoading;
    final projects = projectsService.projects;
    yield UIKitExample();
    // yield div(classes: 'home-page', []);
  }
}
