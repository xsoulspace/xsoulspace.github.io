part of app_navigator;

/// In case of new routes all routes should be added to values!
///
/// [code] is a [AppCode] in English in lower case
class AppRoutesName {
  AppRoutesName._();
  static const home = '/';
  static const apps = '/ideas';
  static const app = '$apps/:appCode';
  static String getAppPath({required final String code}) => '$apps/$code';
  static const games = '/games';
  static const game = '$games/:gameCode';
  static String getGamePath({required final String code}) => '$games/$code';
  static const libraries = '/libs';
  static const libary = '$libraries/:libraryCode';
  static String getLibaryPath({required final String code}) =>
      '$libraries/$code';
  static const excelAddins = '/e-addins';
  static const excelAddin = '$excelAddins/:excelAddinCode';
  static String getExcelAddinPath({required final String code}) =>
      '$excelAddins/$code';

  static const contacts = '/contacts';
  static const about = '/about';

  /// In case of new routes all routes should be added to values!
  static const values = [
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
