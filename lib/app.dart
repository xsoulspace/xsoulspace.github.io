import 'package:jaspr/jaspr.dart';

import 'pages/home_page.dart';

class App extends StatelessComponent {
  const App({super.key});

  @override
  Iterable<Component> build(final BuildContext context) sync* {
    // Grain overlay for cinematic texture
    yield div(classes: 'grain-overlay', [const HomePage()]);
  }

  @css
  static List<StyleRule> get styles => [
    // Grain overlay for cinematic texture
    css('.grain-overlay').styles(
      position: Position.fixed(
        top: 0.px,
        left: 0.px,
        right: 0.px,
        bottom: 0.px,
      ),
      pointerEvents: PointerEvents.none,
      zIndex: const ZIndex(1000),
      opacity: 0.03,
      backgroundImage: const ImageStyle.url(
        'radial-gradient(circle at 1px 1px, rgba(139, 69, 19, 0.8) 1px, transparent 0)',
      ),
      raw: const {
        'background-size': '4px 4px',
        'animation': 'grain 8s steps(10) infinite',
      },
    ),

    // Grain animation keyframes
    css.keyframes('grain', {
      '0%, 100%': Styles(transform: Transform.translate(x: 0.px, y: 0.px)),
      '10%': Styles(transform: Transform.translate(x: (-1).px, y: (-1).px)),
      '20%': Styles(transform: Transform.translate(x: (-1).px, y: 1.px)),
      '30%': Styles(transform: Transform.translate(x: 1.px, y: (-1).px)),
      '40%': Styles(transform: Transform.translate(x: 1.px, y: 1.px)),
      '50%': Styles(transform: Transform.translate(x: (-1).px, y: 0.px)),
      '60%': Styles(transform: Transform.translate(x: 1.px, y: 0.px)),
      '70%': Styles(transform: Transform.translate(x: 0.px, y: (-1).px)),
      '80%': Styles(transform: Transform.translate(x: 0.px, y: 1.px)),
      '90%': Styles(transform: Transform.translate(x: (-1).px, y: (-1).px)),
    }),
  ];
}
