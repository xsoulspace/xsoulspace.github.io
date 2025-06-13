// dart format off
// ignore_for_file: type=lint

// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/jaspr.dart';
import 'package:xsoulspace_web/pages/home_page.dart' as prefix0;
import 'package:xsoulspace_web/app.dart' as prefix1;
import 'package:xsoulspace_web/main.dart' as prefix2;

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
    prefix0.HomePage: ClientTarget<prefix0.HomePage>('pages/home_page'),
  },
  styles: () => [
    ...prefix0.HomePage.styles,
    ...prefix1.App.styles,
    ...prefix2.globalStyles,
  ],
);
