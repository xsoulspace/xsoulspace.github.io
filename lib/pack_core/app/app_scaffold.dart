import 'package:app_core/app_core.dart';
import 'package:app_design_core/app_design_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:life_hooks/life_hooks.dart';
import 'package:provider/provider.dart';
import 'package:xsoulspace/firebase_options.dart';
import 'package:xsoulspace/pack_core/app/app_services_provider.dart';
import 'package:xsoulspace/pack_core/global_states/global_states.dart';
import 'package:xsoulspace/pack_core/pack_core.dart';

part 'app_scaffold_state.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({required this.servicesDiDto, super.key});
  final AppServicesProviderDiDto servicesDiDto;
  @override
  Widget build(final BuildContext context) => AppServicesProvider(
        diDto: servicesDiDto,
        builder: (final context) => StateLoader(
          initializer: GlobalSettingsInitializer(),
          loader: const LoadingScreen(),
          child: RouterScaffold(
            builder: (final context, final parser) => AppScaffoldBuilder(
              routeParser: parser,
            ),
          ),
        ),
      );
}

class RouterScaffold extends HookWidget {
  const RouterScaffold({
    required this.builder,
    super.key,
  });
  final Widget Function(BuildContext context, TemplateRouteParser parser)
      builder;
  @override
  Widget build(final BuildContext context) {
    final state = useAppScaffoldState();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<RouteState>(
          create: (final context) => state.routeState,
        ),
        Provider<AppRouterController>(
          create: (final context) => AppRouterController.use(context.read),
        ),
      ],
      builder: (final context, final child) =>
          builder(context, state.routeParser),
    );
  }
}

class AppScaffoldBuilder extends HookWidget {
  const AppScaffoldBuilder({required this.routeParser, super.key});
  final TemplateRouteParser routeParser;
  @override
  Widget build(final BuildContext context) {
    final state = useAppScaffoldBodyState(context.read);
    final settingsNotifier = context.watch<UserNotifier>();

    return AnimatedBuilder(
      animation: settingsNotifier,
      builder: (final context, final child) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        routeInformationParser: routeParser,
        routerDelegate: state.routerDelegate,
        supportedLocales: Locales.values,
        localeListResolutionCallback: (final locales, final supportedLocales) {
          final defaultLocale = () {
            if (locales == null || locales.isEmpty) return null;
            for (final locale in locales) {
              if (S.delegate.isSupported(locale)) {
                return locale;
              }
            }
          }();

          /// in case if we will needed preferrable system locale
          settingsNotifier.systemLocale = defaultLocale;

          /// if language is set by user, then use it
          if (settingsNotifier.locale != null) return settingsNotifier.locale;

          return defaultLocale;
        },
        locale: settingsNotifier.locale,
        theme: AppThemeData.brandLight.copyWith(),
        darkTheme: AppThemeData.brandDark,
        themeMode: settingsNotifier.theme,
        builder: (final context, final child) => UiTheme(
          scheme: UiThemeScheme.m3(context),
          child: StateLoader(
            initializer: GlobalStateInitializer(
              firebaseOptions: DefaultFirebaseOptions.currentPlatform,
            ),
            loader: const LoadingScreen(),
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: child!,
            ),
          ),
        ),
      ),
    );
  }
}
