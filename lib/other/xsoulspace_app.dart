import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:xsoulspace/common_imports.dart';
import 'package:xsoulspace/router.dart';

class XSoulSpaceApp extends StatelessWidget {
  const XSoulSpaceApp({super.key});
  @override
  Widget build(final BuildContext context) => GlobalStatesProvider(
        builder: (final context) => const Portal(child: _AppScaffold()),
      );
}

class _AppScaffold extends StatefulWidget {
  const _AppScaffold();

  @override
  State<_AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<_AppScaffold> {
  late final _initializer = GlobalStatesInitializer(
    dto: GlobalStatesInitializerDto(context: context),
    router: appRouter,
  );
  @override
  void initState() {
    super.initState();
    unawaited(_initializer.onLoad());
  }

  @override
  Widget build(final BuildContext context) {
    final locale = context.select<UserNotifier, Locale>(
      (final c) => c.locale.value,
    );
    final themeMode = context.select<UserNotifier, ThemeMode>(
      (final c) => c.settings.themeMode,
    );
    return MaterialApp.router(
      /// Providing a restorationScopeId allows the Navigator built by
      /// the MaterialApp to restore the navigation stack when a user
      /// leaves and returns to the app after it has been killed while
      /// running in the background.
      restorationScopeId: 'app',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      builder: (final context, final child) =>
          UiTheme(scheme: UiThemeScheme.m3(context), child: child!),
      locale: locale,
      supportedLocales: Locales.values,
      onGenerateTitle: (final context) => 'XSoulSpace',
      theme: AppThemeData.brandLight,
      darkTheme: AppThemeData.brandDark,
      themeMode: themeMode,
      routerDelegate: appRouter.routerDelegate,
      routeInformationProvider: appRouter.routeInformationProvider,
      routeInformationParser: appRouter.routeInformationParser,
    );
  }
}