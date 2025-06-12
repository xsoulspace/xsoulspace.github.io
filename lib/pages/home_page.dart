import 'package:jaspr/jaspr.dart';
import 'package:jaspr/server.dart';
import 'package:xsoulspace_web/services/projects_service.dart';

import '../components/dynamic_bento_grid.dart';

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
    // Color variables and base styles
    css('.home-page').styles(
      minHeight: 100.vh,
      backgroundColor: const Color('#F5F1EB'), // warm-paper
      color: const Color('#2C1810'), // deep-espresso
      fontFamily: const FontFamily.list([
        FontFamily('Inter'),
        FontFamilies.sansSerif,
      ]),
      position: Position.relative(),
    ),

    // Enhanced Hero Section with cinematic feel
    css('.hero-section').styles(
      position: Position.relative(),
      height: 100.vh,
      display: Display.flex,
      alignItems: AlignItems.center,
      justifyContent: JustifyContent.center,
      overflow: Overflow.hidden,
    ),

    css('.hero-background').styles(
      position: Position.absolute(
        top: 0.px,
        right: 0.px,
        bottom: 0.px,
        left: 0.px,
      ),
      backgroundImage: const ImageStyle.url(
        'linear-gradient(135deg, #F5F1EB 0%, #E8E2D8 50%, #E6B17A 100%)',
      ),
      opacity: 0.8,
    ),

    css('.hero-content').styles(
      position: Position.relative(),
      zIndex: const ZIndex(10),
      textAlign: TextAlign.center,
      maxWidth: 64.rem, // max-w-5xl
      margin: Margin.symmetric(horizontal: Unit.auto),
      padding: Padding.symmetric(horizontal: 2.rem),
      raw: const {'animation': 'hero-fade-in 1.5s ease-out'},
    ),

    css('.hero-title').styles(
      fontSize: 4.5.rem, // Enhanced from 3.75rem
      fontWeight: FontWeight.w200, // Lighter weight for elegance
      margin: Margin.only(bottom: 1.5.rem),
      letterSpacing: (-0.02).em,
      lineHeight: 1.1.rem,
      raw: const {'text-shadow': '0 2px 4px rgba(44, 24, 16, 0.1)'},
    ),

    css('.hero-subtitle').styles(
      fontSize: 1.375.rem, // Slightly larger
      color: const Color('#8B4513'), // warm-copper
      margin: Margin.only(bottom: 3.rem), // More space
      maxWidth: 48.rem, // Wider for better readability
      lineHeight: 1.7.rem, // Better line height
      fontWeight: FontWeight.w400,
      raw: const {'animation': 'subtitle-slide-up 1.5s ease-out 0.3s both'},
    ),

    css('.cta-button').styles(
      display: Display.inlineBlock,
      padding: Padding.symmetric(horizontal: 2.5.rem, vertical: 1.25.rem),
      backgroundColor: const Color('#E6B17A'), // creamy-amber
      color: const Color('#2C1810'), // deep-espresso
      radius: BorderRadius.circular(0.75.rem),
      cursor: Cursor.pointer,
      transition: const Transition('all', duration: 400),
      fontSize: 1.125.rem,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.025.em,
      border: Border.all(
        BorderSide(color: const Color.rgba(139, 69, 19, 0.2), width: 1.px),
      ),
      shadow: BoxShadow.combine([
        BoxShadow(
          offsetX: 0.px,
          offsetY: 4.px,
          blur: 12.px,
          color: const Color.rgba(44, 24, 16, 0.15),
        ),
      ]),
      raw: const {'animation': 'cta-fade-in 1.5s ease-out 0.6s both'},
    ),

    css('.cta-button:hover').styles(
      backgroundColor: const Color('#8B4513'), // warm-copper
      color: const Color('#F5F1EB'), // warm-paper
      transform: Transform.translate(y: (-2).px),
      shadow: BoxShadow.combine([
        BoxShadow(
          offsetX: 0.px,
          offsetY: 8.px,
          blur: 25.px,
          color: const Color.rgba(44, 24, 16, 0.25),
        ),
      ]),
    ),

    // Enhanced Main Content
    css('.main-content').styles(
      maxWidth:
          100.percent, // Remove fixed max-width since grid container handles it
      margin:
          Margin.zero, // Remove margin since grid container handles centering
      padding: Padding.symmetric(
        horizontal: 0.rem,
        vertical: 4.rem,
      ), // Remove horizontal padding
    ),

    // Cinematic Loading Experience
    css('.loading-container').styles(
      display: Display.flex,
      flexDirection: FlexDirection.column,
      alignItems: AlignItems.center,
      justifyContent: JustifyContent.center,
      minHeight: 40.vh,
      gap: Gap.all(2.rem),
    ),

    css('.loading-spinner').styles(
      width: 64.px,
      height: 64.px,
      border: Border.all(
        BorderSide(width: 3.px, color: const Color.rgba(139, 69, 19, 0.2)),
      ),
      radius: BorderRadius.circular(50.percent),
      position: Position.relative(),
      raw: const {
        'border-top': '3px solid #E6B17A',
        'animation': 'spin 1.2s cubic-bezier(0.4, 0.0, 0.2, 1) infinite',
      },
    ),

    css('.loading-text').styles(
      fontSize: 1.125.rem,
      color: const Color('#8B4513'), // warm-copper
      fontWeight: FontWeight.w400,
      letterSpacing: 0.05.em,
      raw: const {'animation': 'loading-pulse 2s ease-in-out infinite'},
    ),

    css('.loading-subtitle').styles(
      fontSize: 0.875.rem,
      color: const Color('#9B8B7A'), // grain-muted
      textAlign: TextAlign.center,
      maxWidth: 24.rem,
      lineHeight: 1.5.rem,
    ),

    // Enhanced Footer
    css('.footer').styles(
      backgroundColor: const Color('#2C1810'), // deep-espresso
      color: const Color('#F5F1EB'), // warm-paper
      padding: Padding.symmetric(vertical: 4.rem),
      position: Position.relative(),
    ),

    css('.footer::before').styles(
      content: '""',
      position: Position.absolute(top: 0.px, left: 0.px, right: 0.px),
      height: 1.px,
      backgroundImage: const ImageStyle.url(
        'linear-gradient(90deg, transparent, rgba(245, 241, 235, 0.3), transparent)',
      ),
    ),

    css('.footer-content').styles(
      maxWidth: 1280.px,
      margin: Margin.symmetric(horizontal: Unit.auto),
      padding: Padding.symmetric(horizontal: 2.rem),
      textAlign: TextAlign.center,
    ),

    css('.footer-text').styles(
      color: const Color('#9B8B7A'), // grain-muted
      margin: Margin.only(bottom: 1.5.rem),
      fontSize: 1.125.rem,
      fontWeight: FontWeight.w300,
    ),

    css('.footer-copyright').styles(
      fontSize: 0.875.rem,
      color: const Color('#9B8B7A'), // grain-muted
      opacity: 0.8,
    ),

    // Scroll indicator
    css('.scroll-indicator').styles(
      position: Position.absolute(bottom: 2.rem, left: 50.percent),
      transform: Transform.translate(x: (-50).percent),
      color: const Color('#8B4513'), // warm-copper
      fontSize: 0.875.rem,
      display: Display.flex,
      flexDirection: FlexDirection.column,
      alignItems: AlignItems.center,
      gap: Gap.all(0.5.rem),
      raw: const {'animation': 'scroll-bounce 2s ease-in-out infinite'},
    ),

    // Keyframe animations
    css.keyframes('hero-fade-in', {
      '0%': Styles(opacity: 0, transform: Transform.translate(y: 20.px)),
      '100%': Styles(opacity: 1, transform: Transform.translate(y: 0.px)),
    }),

    css.keyframes('subtitle-slide-up', {
      '0%': Styles(opacity: 0, transform: Transform.translate(y: 30.px)),
      '100%': Styles(opacity: 1, transform: Transform.translate(y: 0.px)),
    }),

    css.keyframes('cta-fade-in', {
      '0%': Styles(opacity: 0, transform: Transform.scale(0.9)),
      '100%': Styles(opacity: 1, transform: Transform.scale(1)),
    }),

    css.keyframes('spin', {
      '0%': Styles(transform: Transform.rotate(0.deg)),
      '100%': Styles(transform: Transform.rotate(360.deg)),
    }),

    css.keyframes('loading-pulse', {
      '0%, 100%': Styles(opacity: 1),
      '50%': Styles(opacity: 0.6),
    }),

    css.keyframes('scroll-bounce', {
      '0%, 100%': Styles(
        transform: Transform.translate(x: (-50).percent, y: 0.px),
      ),
      '50%': Styles(
        transform: Transform.translate(x: (-50).percent, y: 4.px),
      ),
    }),

    // Responsive design
    css.media(MediaQuery.screen(minWidth: 768.px), [
      css('.hero-title').styles(fontSize: 6.rem),
      css('.hero-subtitle').styles(fontSize: 1.5.rem),
      css(
        '.hero-content',
      ).styles(padding: Padding.symmetric(horizontal: 3.rem)),
      css('.main-content').styles(
        padding: Padding.symmetric(
          horizontal: 0.rem,
          vertical: 6.rem,
        ), // Keep no horizontal padding
      ),
      css(
        '.footer-content',
      ).styles(padding: Padding.symmetric(horizontal: 3.rem)),
    ]),

    css.media(MediaQuery.screen(minWidth: 1024.px), [
      css('.hero-title').styles(fontSize: 7.rem),
      css('.hero-subtitle').styles(fontSize: 1.625.rem),
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

    yield div(classes: 'home-page', [
      // Enhanced Hero Section
      section(classes: 'hero-section', [
        div(classes: 'hero-background', []),
        div(classes: 'hero-content', [
          h1(classes: 'hero-title', [text('xsoulspace')]),
          p(classes: 'hero-subtitle', [
            text(
              'A cinematic showcase of ethical creative projects, where every story matters and every contributor shapes the future of conscious technology.',
            ),
          ]),
          div(classes: 'cta-button', [text('Explore Our Universe')]),
        ]),
        div(classes: 'scroll-indicator', [text('Discover Stories'), text('↓')]),
      ]),

      // Enhanced Main Content
      div(classes: 'main-content', [
        if (isLoading)
          div(classes: 'loading-container', [
            div(classes: 'loading-spinner', []),
            div(classes: 'loading-text', [text('Crafting Stories...')]),
            p(classes: 'loading-subtitle', [
              text(
                'Each project tells a unique tale of creativity, ethics, and human collaboration.',
              ),
            ]),
          ])
        else
          DynamicBentoGrid(projects: projects),
      ]),

      // Enhanced Footer
      footer(classes: 'footer', [
        div(classes: 'footer-content', [
          p(classes: 'footer-text', [
            text('Built with ethical principles and cinematic passion'),
          ]),
          p(classes: 'footer-copyright', [
            text(
              '© 2021-${DateTime.now().year} xsoulspace - Where creativity meets consciousness',
            ),
          ]),
        ]),
      ]),
    ]);
  }
}
