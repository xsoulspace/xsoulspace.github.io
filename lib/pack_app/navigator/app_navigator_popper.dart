part of pack_app;

@immutable
class AppNavigatorPopper {
  const AppNavigatorPopper({
    required this.routeState,
    required this.navigatorController,
  });
  final RouteState routeState;
  final AppNavigatorController navigatorController;
  Future<bool> onWillPop() async {
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
        navigatorController.goHome();
        break;
      case AppRoutesName.home:
    }

    return false;
  }
}
