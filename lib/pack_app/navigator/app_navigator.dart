part of pack_app;

class AppNavigator extends StatefulWidget {
  const AppNavigator({
    required final this.navigatorKey,
    required final this.routeState,
    final Key? key,
  }) : super(key: key);
  final GlobalKey<NavigatorState> navigatorKey;
  final RouteState<AppRouteParameters> routeState;

  @override
  _AppNavigatorState createState() => _AppNavigatorState();
}

class _AppNavigatorState extends State<AppNavigator> {
  final _homeKey = const ValueKey<String>('home');
  late final AppNavigatorController _navigatorController =
      AppNavigatorController.use(
    context: context,
    routeState: widget.routeState,
  );
  RouteState<AppRouteParameters> get routeState => widget.routeState;

  @override
  Widget build(final BuildContext context) {
    final popper = AppNavigatorPopper(
      navigatorController: _navigatorController,
      routeState: routeState,
    );

    List<Page> buildPages() {
      return [
        NavigatorPage(
          key: _homeKey,
          popper: popper,
          child: const HomeScreen(),
        ),
      ];
    }

    return Navigator(
      onGenerateRoute: (final _) => null,
      key: widget.navigatorKey,
      onPopPage: (final route, final dynamic result) {
        /// ! here will go selected pages logic.
        final popped = route.didPop(result);

        return popped;
      },
      pages: buildPages(),
    );
  }
}
