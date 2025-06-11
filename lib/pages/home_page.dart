import 'package:jaspr/jaspr.dart';
import 'package:xsoulspace_web/components/models/project_model.dart';
import 'package:xsoulspace_web/services/projects_service.dart';

import '../components/bento_grid.dart';

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
    // Color variables
    css('.home-page').styles(
      minHeight: 100.vh,
      backgroundColor: const Color('#F5F1EB'), // warm-paper
      color: const Color('#2C1810'), // deep-espresso
      fontFamily: const FontFamily.list([
        FontFamily('Inter'),
        FontFamilies.sansSerif,
      ]),
    ),

    // Hero Section
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
        'linear-gradient(135deg, #F5F1EB 0%, #E8E2D8 100%)',
      ),
    ),

    css('.hero-content').styles(
      position: Position.relative(),
      zIndex: const ZIndex(10),
      textAlign: TextAlign.center,
      maxWidth: 56.rem, // max-w-4xl
      margin: Margin.symmetric(horizontal: Unit.auto),
      padding: Padding.symmetric(horizontal: 1.5.rem),
    ),

    css('.hero-title').styles(
      fontSize: 3.75.rem, // text-6xl
      fontWeight: FontWeight.w300,
      margin: Margin.only(bottom: 1.5.rem),
    ),

    css('.hero-subtitle').styles(
      fontSize: 1.25.rem, // text-xl
      color: const Color('#8B4513'), // warm-copper
      margin: Margin.only(bottom: 2.rem),
      maxWidth: 42.rem, // max-w-2xl
      lineHeight: 1.625.rem, // leading-relaxed
    ),

    css('.cta-button').styles(
      display: Display.inlineBlock,
      padding: Padding.symmetric(horizontal: 2.rem, vertical: 1.rem),
      backgroundColor: const Color('#E6B17A'), // creamy-amber
      color: const Color('#2C1810'), // deep-espresso
      radius: BorderRadius.circular(0.5.rem),
      cursor: Cursor.pointer,
      transition: const Transition('all', duration: 300),
    ),

    css('.cta-button:hover').styles(
      backgroundColor: const Color('#8B4513'), // warm-copper
      color: const Color('#F5F1EB'), // warm-paper
    ),

    // Main Content
    css('.main-content').styles(
      maxWidth: 1200.px,
      margin: Margin.symmetric(horizontal: Unit.auto),
      padding: Padding.all(1.5.rem),
    ),

    // Loading Spinner
    css('.loading-spinner').styles(
      width: 48.px,
      height: 48.px,
      border: Border.all(
        BorderSide(width: 5.px, color: const Color.rgba(139, 69, 19, 0.2)),
      ),
      radius: BorderRadius.circular(50.percent),
      margin: Margin.all(Unit.auto),
      raw: const {
        'border-top': '5px solid #8B4513',
        'animation': 'spin 1s linear infinite',
      },
    ),

    css.keyframes('spin', {
      '0%': Styles(transform: Transform.rotate(0.deg)),
      '100%': Styles(transform: Transform.rotate(360.deg)),
    }),

    // Footer
    css('.footer').styles(
      backgroundColor: const Color('#2C1810'), // deep-espresso
      color: const Color('#F5F1EB'), // warm-paper
      padding: Padding.symmetric(vertical: 3.rem),
    ),

    css('.footer-content').styles(
      maxWidth: 1200.px,
      margin: Margin.symmetric(horizontal: Unit.auto),
      padding: Padding.symmetric(horizontal: 1.5.rem),
      textAlign: TextAlign.center,
    ),

    css('.footer-text').styles(
      color: const Color('#9B8B7A'), // grain-muted
      margin: Margin.only(bottom: 1.rem),
    ),

    css('.footer-copyright').styles(
      fontSize: 0.875.rem, // text-sm
      color: const Color('#9B8B7A'), // grain-muted
    ),

    // Responsive design
    css.media(MediaQuery.screen(minWidth: 768.px), [
      css('.hero-title').styles(fontSize: 6.rem), // md:text-8xl
      css('.hero-subtitle').styles(fontSize: 1.5.rem), // md:text-2xl
      css(
        '.main-content',
      ).styles(padding: Padding.symmetric(horizontal: 2.rem)),
      css(
        '.footer-content',
      ).styles(padding: Padding.symmetric(horizontal: 2.rem)),
    ]),
  ];
}

class _HomePageState extends State<HomePage> {
  late final ProjectsService _projectsService;
  List<ProjectModel> _projects = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _projectsService = ProjectsService();
    _fetchProjects();
  }

  Future<void> _fetchProjects() async {
    final projects = await _projectsService.fetchProjects();
    setState(() {
      _projects = projects;
      _isLoading = false;
    });
  }

  @override
  Iterable<Component> build(final BuildContext context) sync* {
    yield div(classes: 'home-page', [
      // Hero Section
      section(classes: 'hero-section', [
        div(classes: 'hero-background', []),
        div(classes: 'hero-content', [
          h1(classes: 'hero-title', [text('xsoulspace')]),
          p(classes: 'hero-subtitle', [
            text(
              'A cinematic showcase of ethical creative projects, where every story matters and every contributor shapes the future.',
            ),
          ]),
          div(classes: 'cta-button', [text('Explore Projects')]),
        ]),
      ]),

      // Main Content
      div(classes: 'main-content', [
        if (_isLoading)
          div(classes: 'loading-spinner', [])
        else
          BentoGrid(projects: _projects),
      ]),

      // Footer
      footer(classes: 'footer', [
        div(classes: 'footer-content', [
          p(classes: 'footer-text', [
            text('Built with ethical principles and cinematic passion'),
          ]),
          p(classes: 'footer-copyright', [
            text('© 2024 xsoulspace - Where creativity meets consciousness'),
          ]),
        ]),
      ]),
    ]);
  }
}
