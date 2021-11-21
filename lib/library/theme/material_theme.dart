part of theme;

final _lightBase = ThemeData.from(
  colorScheme: lightColorScheme,
  // textTheme: lightTextTheme,
);

final lightThemeData = _lightBase.copyWith(
  appBarTheme: _lightBase.appBarTheme.copyWith(
    backgroundColor: Colors.transparent,
    elevation: 0,
    foregroundColor: AppColors.black,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarColor: _lightBase.canvasColor,
      statusBarIconBrightness: Brightness.dark,
    ),
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  inputDecorationTheme: _lightBase.inputDecorationTheme.copyWith(
    isDense: true,
  ),
);
