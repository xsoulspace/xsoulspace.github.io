part of app_navigator;

class AppNavigatorController {
  AppNavigatorController.use({
    required final this.routeState,
    required final this.context,
  });
  final RouteState routeState;
  final BuildContext context;

  void goHome() => routeState.go(AppRoutesName.home);
  void goToApp({required final String code}) =>
      routeState.go(AppRoutesName.getAppPath(code: code));
  void goToGame({required final String code}) =>
      routeState.go(AppRoutesName.getGamePath(code: code));
  void goToLibrary({required final String code}) =>
      routeState.go(AppRoutesName.getLibaryPath(code: code));
  void goToExcelAddin({required final String code}) =>
      routeState.go(AppRoutesName.getExcelAddinPath(code: code));
}
