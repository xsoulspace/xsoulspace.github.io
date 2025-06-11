import 'package:jaspr/jaspr.dart';

import 'pages/home_page.dart';

class App extends StatelessComponent {
  const App({super.key});

  @override
  Iterable<Component> build(final BuildContext context) sync* {
    // Subtle grain overlay for cinematic texture
    yield div(classes: 'grain-overlay', [const HomePage()]);
  }

  @css
  static List<StyleRule> get styles => [
    // Subtle grain overlay for cinematic texture
    css('.grain-overlay').styles(
      position: Position.fixed(
        top: 0.px,
        left: 0.px,
        right: 0.px,
        bottom: 0.px,
      ),
      pointerEvents: PointerEvents.none,
      zIndex: const ZIndex(1000),
      opacity: 0.015,
      backgroundImage: const ImageStyle.url(
        'radial-gradient(circle at 1px 1px, rgba(139, 69, 19, 0.6) 1px, transparent 0)',
      ),
      raw: const {
        'background-size': '6px 6px',
        'animation': 'grain 16s steps(8) infinite',
      },
    ),

    // Refined grain animation keyframes
    css.keyframes('grain', {
      '0%, 100%': Styles(
        transform: Transform.translate(x: 0.px, y: 0.px),
      ),
      '12.5%': Styles(
        transform: Transform.translate(x: (-1).px, y: (-1).px),
      ),
      '25%': Styles(
        transform: Transform.translate(x: (-1).px, y: 1.px),
      ),
      '37.5%': Styles(
        transform: Transform.translate(x: 1.px, y: (-1).px),
      ),
      '50%': Styles(
        transform: Transform.translate(x: 1.px, y: 1.px),
      ),
      '62.5%': Styles(
        transform: Transform.translate(x: (-1).px, y: 0.px),
      ),
      '75%': Styles(
        transform: Transform.translate(x: 1.px, y: 0.px),
      ),
      '87.5%': Styles(
        transform: Transform.translate(x: 0.px, y: (-1).px),
      ),
    }),
  ];
}
