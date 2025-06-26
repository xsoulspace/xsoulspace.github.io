// dart format off
// ignore_for_file: type=lint

// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/jaspr.dart';
import 'package:xsoulspace_web/components/atoms/loading_indicator.dart'
    as prefix0;
import 'package:xsoulspace_web/components/molecules/accent_card.dart'
    as prefix1;
import 'package:xsoulspace_web/components/molecules/project_card.dart'
    as prefix2;
import 'package:xsoulspace_web/components/molecules/sticky_nav.dart' as prefix3;
import 'package:xsoulspace_web/components/organisms/bento_grid.dart' as prefix4;
import 'package:xsoulspace_web/components/organisms/bento_section.dart'
    as prefix5;
import 'package:xsoulspace_web/components/organisms/mobile_menu_overlay.dart'
    as prefix6;
import 'package:xsoulspace_web/pages/home_page.dart' as prefix7;
import 'package:xsoulspace_web/styles/ceramic_theme.dart' as prefix8;
import 'package:xsoulspace_web/app.dart' as prefix9;
import 'package:xsoulspace_web/main.dart' as prefix10;

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
    prefix0.LoadingIndicator: ClientTarget<prefix0.LoadingIndicator>(
      'components/atoms/loading_indicator',
      params: _prefix0LoadingIndicator,
    ),

    prefix7.HomePage: ClientTarget<prefix7.HomePage>('pages/home_page'),
  },
  styles: () => [
    ...prefix0.LoadingIndicator.styles,
    ...prefix1.AccentCard.styles,
    ...prefix2.ProjectCard.styles,
    ...prefix3.StickyNav.styles,
    ...prefix4.BentoGrid.styles,
    ...prefix5.BentoSection.styles,
    ...prefix6.MobileMenuOverlay.styles,
    ...prefix7.HomePage.styles,
    ...prefix8.ceramicTheme,
    ...prefix9.App.styles,
    ...prefix10.globalStyles,
  ],
);

Map<String, dynamic> _prefix0LoadingIndicator(prefix0.LoadingIndicator c) => {
  'textMessage': c.textMessage,
};
