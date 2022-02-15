part of pack_app;

@immutable
@JsonSerializable()
class AppRouteParameters {
  const AppRouteParameters({
    this.appCode,
    this.excelAddinCode,
    this.gameCode,
    this.libraryCode,
  });

  factory AppRouteParameters.fromJson(final Map<String, dynamic> json) =>
      _$AppRouteParametersFromJson(json);

  final String? appCode;
  final String? gameCode;
  final String? libraryCode;
  final String? excelAddinCode;
}
