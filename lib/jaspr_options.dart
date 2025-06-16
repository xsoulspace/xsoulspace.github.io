// dart format off
// ignore_for_file: type=lint

// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/jaspr.dart';
import 'package:xsoulspace_web/components/molecules/project_card.dart'
    as prefix0;
import 'package:xsoulspace_web/components/molecules/sticky_nav.dart' as prefix1;
import 'package:xsoulspace_web/components/organisms/bento_grid.dart' as prefix2;
import 'package:xsoulspace_web/pages/home_page.dart' as prefix3;
import 'package:xsoulspace_web/styles/ceramic_theme.dart' as prefix4;
import 'package:xsoulspace_web/app.dart' as prefix5;
import 'package:xsoulspace_web/main.dart' as prefix6;

/// Default [JasprOptions] for use with your jaspr project.
///
/// Use this to initialize jaspr **before** calling [runApp].
///
/// Example:
/// ```dart
/// import 'jaspr_options.dart';
///
/// void main() {
///   Jaspr.initializeApp(
///     options: defaultJasprOptions,
///   );
///
///   runApp(...);
/// }
/// ```
JasprOptions get defaultJasprOptions => JasprOptions(
  clients: {
    prefix3.HomePage: ClientTarget<prefix3.HomePage>('pages/home_page'),
  },
  styles: () => [
    ...prefix0.ProjectCard.styles,
    ...prefix1.StickyNav.styles,
    ...prefix2.BentoGrid.styles,
    ...prefix3.HomePage.styles,
    ...prefix4.ceramicTheme,
    ...prefix5.App.styles,
    ...prefix6.globalStyles,
  ],
);
