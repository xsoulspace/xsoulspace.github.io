import 'package:xsoul_core/xsoul_core.dart';

/// !If you want to add new route, please add the route to the [routes]
class NavigationRoutes {
  NavigationRoutes._();
  static const home = '/';
  static const apps = '/app';
  static const app = '/app/:appCode';
  static const appPrivacy = '/app/:appCode/privacy';
  static String getAppPath({required final String code}) => '/app/$code';
  static String getAppPrivacy({required final String code}) =>
      '/app/$code/privacy';
  static const games = '/game';
  static const game = '/game/:gameCode';
  static String getGamePath({required final String code}) => '/game/$code';
  static const libraries = '/libs';
  static const libary = '/libs/:libraryCode';
  static String getLibaryPath({required final String code}) => '/libs/$code';
  static const excelAddins = '/e-addins';
  static const excelAddin = '/e-addins/:excelAddinCode';
  static String getExcelAddinPath({required final String code}) =>
      '/e-addins/$code';

  static const contacts = '/contacts';
  static const about = '/about';

  /// In case of new routes all routes should be added to values!
  static const routes = [
    home,
    apps,
    app,
    games,
    game,
    libraries,
    libary,
    excelAddins,
    excelAddin,
    contacts,
    about,
  ];
}

class AppRouterController extends RouterController {
  AppRouterController.use(super.read) : super.use();

  void goHome() => to(NavigationRoutes.home);
  void goToApp({required final String code}) =>
      to(NavigationRoutes.getAppPath(code: code));
  void goToGame({required final String code}) =>
      to(NavigationRoutes.getGamePath(code: code));
  void goToLibrary({required final String code}) =>
      to(NavigationRoutes.getLibaryPath(code: code));
  void goToExcelAddin({required final String code}) =>
      to(NavigationRoutes.getExcelAddinPath(code: code));
}
