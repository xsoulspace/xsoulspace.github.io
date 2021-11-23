library app_navigator;

import 'package:flutter/material.dart';
import 'package:xsoulspace/screens/home.dart';
import 'package:xsoulspace/utils/utils.dart';

part 'app_routes.dart';
part 'navigator_controller.dart';

class AppNavigator extends StatefulWidget {
  const AppNavigator({
    required final this.navigatorKey,
    required final this.routeState,
    final Key? key,
  }) : super(key: key);
  final GlobalKey<NavigatorState> navigatorKey;
  final RouteState routeState;

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
  RouteState get routeState => widget.routeState;

  @override
  Widget build(final BuildContext context) {
    final String? appCode = routeState.route.parameters['appCode'];
    final String? gameCode = routeState.route.parameters['gameCode'];
    final String? libraryCode = routeState.route.parameters['libraryCode'];
    final String? excelAddinCode =
        routeState.route.parameters['excelAddinCode'];

    Future<bool> _handleWillPop() async {
      switch (routeState.route.pathTemplate) {
        case AppRoutesName.game:
          await routeState.go(AppRoutesName.games);
          break;
        case AppRoutesName.app:
          await routeState.go(AppRoutesName.apps);
          break;
        case AppRoutesName.libary:
          await routeState.go(AppRoutesName.libraries);
          break;
        case AppRoutesName.excelAddin:
          await routeState.go(AppRoutesName.excelAddins);
          break;
        case AppRoutesName.games:
        case AppRoutesName.apps:
        case AppRoutesName.libraries:
        case AppRoutesName.about:
        case AppRoutesName.contacts:
          _navigatorController.goHome();
          break;
        case AppRoutesName.home:
      }
      return false;
    }

    Widget willPopScope({required final Widget child}) {
      return WillPopScope(onWillPop: _handleWillPop, child: child);
    }

    List<Page> buildPages() {
      return [
        MaterialPage(
          key: _homeKey,
          child: willPopScope(
            child: const HomeScreen(),
          ),
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
