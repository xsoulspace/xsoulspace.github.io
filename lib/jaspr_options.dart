// dart format off
// ignore_for_file: type=lint

// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/jaspr.dart';
import 'package:xsoulspace_web/components/bento_expansion_orchestrator.dart'
    as prefix0;
import 'package:xsoulspace_web/components/dynamic_bento_grid.dart' as prefix1;
import 'package:xsoulspace_web/components/expanded_bento.dart' as prefix2;
import 'package:xsoulspace_web/components/micro_bento.dart' as prefix3;
import 'package:xsoulspace_web/components/standard_bento.dart' as prefix4;
import 'package:xsoulspace_web/pages/home_page.dart' as prefix5;
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
    prefix5.HomePage: ClientTarget<prefix5.HomePage>('pages/home_page'),
  },
  styles: () => [
    ...prefix0.BentoExpansionOrchestrator.styles,
    ...prefix1.DynamicBentoGrid.styles,
    ...prefix2.ExpandedBento.styles,
    ...prefix3.MicroBento.styles,

    ...prefix4.StandardBento.styles,
    ...prefix5.HomePage.styles,
    ...prefix6.App.styles,
    ...prefix7.globalStyles,
  ],
);
