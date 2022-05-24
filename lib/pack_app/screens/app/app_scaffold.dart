part of pack_app;

class AppScaffold extends StatefulWidget {
  const AppScaffold({final Key? key}) : super(key: key);

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  late final RouteState<AppRouteParameters> routeState;
  late final SimpleRouterDelegate routerDelegate;
  late final TemplateRouteParser<AppRouteParameters> routeParser;
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    /// Configure the parser with all of the app's allowed path templates.
    routeParser = TemplateRouteParser<AppRouteParameters>(
      allowedPaths: AppRoutesName.values,
      parametersFromJsonCallback: AppRouteParameters.fromJson,
      guards: [],
    );

    routeState = RouteState(routeParser);

    routerDelegate = SimpleRouterDelegate(
      routeState: routeState,
      navigatorKey: navigatorKey,
      builder: (final context) => AppNavigator(
        navigatorKey: navigatorKey,
        routeState: routeState,
      ),
    );

    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    return RouteStateScope(
      notifier: routeState,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,

        /// Providing a restorationScopeId allows the Navigator built by
        /// the MaterialApp to restore the navigation stack when a user
        /// leaves and returns to the app after it has been killed while
        /// running in the background.
        restorationScopeId: 'app',

        // Define a light and dark color theme. Then, read the user's
        // preferred ThemeMode (light, dark, or system default) from the
        // SettingsController to display the correct theme.
        theme: lightThemeData,

        routerDelegate: routerDelegate,
        routeInformationParser: routeParser,
      ),
    );
  }
}
