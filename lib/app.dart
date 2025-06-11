import 'package:jaspr/jaspr.dart';

import 'pages/home_page.dart';

class App extends StatelessComponent {
  const App({super.key});

  @override
  Iterable<Component> build(final BuildContext context) sync* {
    yield const HomePage();
  }

  @css
  static List<StyleRule> get styles => [];
}
