// dart format off
// ignore_for_file: type=lint

// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/jaspr.dart';
import 'package:xsoulspace_web/components/molecules/accent_card.dart'
    as prefix0;
import 'package:xsoulspace_web/components/molecules/project_card.dart'
    as prefix1;
import 'package:xsoulspace_web/components/molecules/sticky_nav.dart' as prefix2;
import 'package:xsoulspace_web/components/organisms/bento_grid.dart' as prefix3;
import 'package:xsoulspace_web/pages/home_page.dart' as prefix4;
import 'package:xsoulspace_web/styles/ceramic_theme.dart' as prefix5;
import 'package:xsoulspace_web/app.dart' as prefix6;
import 'package:xsoulspace_web/main.dart' as prefix7;

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
    prefix4.HomePage: ClientTarget<prefix4.HomePage>('pages/home_page'),
  },
  styles: () => [
    ...prefix0.AccentCard.styles,
    ...prefix1.ProjectCard.styles,
    ...prefix2.StickyNav.styles,
    ...prefix3.BentoGrid.styles,
    ...prefix4.HomePage.styles,
    ...prefix5.ceramicTheme,
    ...prefix6.App.styles,
    ...prefix7.globalStyles,
  ],
);
