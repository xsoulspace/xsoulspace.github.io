// ignore_for_file: invalid_annotation_target

part of 'models.dart';

@immutable
@Freezed(
  fromJson: true,
  toJson: true,
  equal: true,
  addImplicitFinal: true,
  copyWith: true,
)
class AppRouteParameters with _$AppRouteParameters {
  @JsonSerializable(
    explicitToJson: true,
  )
  const factory AppRouteParameters({
    @Default('') final String appCode,
    @Default('') final String gameCode,
    @Default('') final String libraryCode,
    @Default('') final String excelAddinCode,
  }) = _AppRouteParameters;

  const AppRouteParameters._();

  factory AppRouteParameters.fromJson(final Map<String, dynamic> json) =>
      _$AppRouteParametersFromJson(json);
}
