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
class UserModel with _$UserModel {
  @JsonSerializable(
    explicitToJson: true,
  )
  const factory UserModel({
    @Default('') final String id,
    @JsonKey(
      fromJson: localeFromString,
      toJson: localeToString,
    )
    final Locale? locale,
    @Default(ThemeMode.system) final ThemeMode themeMode,
    @Default(UserSettingsModel.initial) final UserSettingsModel settings,
    @Default(false) final bool hasCompletedOnboarding,
  }) = _UserModel;

  const UserModel._();

  factory UserModel.fromJson(final dynamic json) =>
      _$UserModelFromJson(json as Map<String, dynamic>);
  factory UserModel.fromFirestore(
    final DocumentSnapshot<Map<String, dynamic>> snapshot,
    // ignore: avoid_unused_constructor_parameters
    final SnapshotOptions? options,
  ) {
    final json = snapshot.data();
    return UserModel.fromJson(json);
  }

  static Map<String, Object?> toFirestore(
    final UserModel value,
    final SetOptions? options,
  ) =>
      value.toJson();

  static const empty = UserModel();
}

@freezed
class UserSettingsModel with _$UserSettingsModel {
  const factory UserSettingsModel({
    @JsonKey(fromJson: _themeModeFromJson, toJson: _themeModeToJson)
    @Default(ThemeMode.system)
    final ThemeMode themeMode,
    @Default(true) final bool isProjectsListReversed,
    @Default(0) final int charactersLimitForNewNotes,
    @JsonKey(fromJson: _localeFromJson, toJson: _localeToJson)
    final Locale? locale,
  }) = _UserSettingsModel;
  factory UserSettingsModel.fromJson(final Map<String, dynamic> json) =>
      _$UserSettingsModelFromJson(json);
  static const initial = UserSettingsModel();
}

ThemeMode _themeModeFromJson(final int? index) {
  final i = int.tryParse('$index');
  if (i == null) return ThemeMode.system;
  if (i > ThemeMode.values.length || i < 0) return ThemeMode.system;

  return ThemeMode.values[i];
}

int _themeModeToJson(final ThemeMode theme) => theme.index;

Locale _localeFromJson(final String languageCode) {
  try {
    if (languageCode.isEmpty) return Locales.en;

    return Locale.fromSubtags(languageCode: languageCode);
    // ignore: avoid_catches_without_on_clauses
  } catch (e) {
    return Locales.en;
  }
}

String _localeToJson(final Locale? locale) => locale?.languageCode ?? '';
