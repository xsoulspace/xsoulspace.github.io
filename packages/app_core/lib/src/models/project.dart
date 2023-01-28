// ignore_for_file: invalid_annotation_target

part of 'models.dart';

typedef ProjectModelId = String;

enum ProjectStatus {
  released,
  upcoming,
  legacy,
}

enum ProjectType {
  game,
  app,
  excelAddin,
}

@immutable
@Freezed(
  fromJson: true,
  toJson: true,
  equal: true,
  addImplicitFinal: true,
  copyWith: true,
)
class ProjectModel with _$ProjectModel {
  @JsonSerializable(
    explicitToJson: true,
  )
  const factory ProjectModel({
    required final ProjectModelId id,
    required final String title,
    required final String subtitle,
    required final String shortDescription,
    required final ProjectStatus status,
    required final ProjectType type,
    @JsonKey(fromJson: fromMaybeTimestamp, toJson: toMaybeTimestamp)
        final DateTime? releasedAt,
    @Default(UsageOptionsModel.empty) final UsageOptionsModel usageOptions,
    @JsonKey(fromJson: fromMaybeTimestamp, toJson: toMaybeTimestamp)
        final DateTime? completedAt,
    @Default([]) final List<String> tags,
    // provide url for every path
    @Default([]) final List<String> mediaLinks,
  }) = _ProjectModel;

  const ProjectModel._();

  factory ProjectModel.fromJson(final dynamic json) =>
      _$ProjectModelFromJson(json as Map<String, dynamic>);
  factory ProjectModel.fromFirestore(
    final DocumentSnapshot<Map<String, dynamic>> snapshot,
    // ignore: avoid_unused_constructor_parameters
    final SnapshotOptions? options,
  ) {
    final json = snapshot.data();
    return ProjectModel.fromJson(json);
  }

  static Map<String, Object?> toFirestore(
    final ProjectModel value,
    final SetOptions? options,
  ) {
    return value.toJson();
  }
}

@immutable
@Freezed(
  fromJson: true,
  toJson: true,
  equal: true,
  addImplicitFinal: true,
  copyWith: true,
)
class UsageOptionsModel with _$UsageOptionsModel {
  @JsonSerializable(
    explicitToJson: true,
  )
  const factory UsageOptionsModel({
    @Default('') final String githubLink,
    @Default('') final String snapStoreLink,
    @Default('') final String googlePlayLink,
    @Default('') final String appleStoreLink,
    @Default('') final String windowsStoreLink,
    @Default('') final String ruStoreLink,
    @Default('') final String huaweiAppGalleryLink,
    @Default('') final String ownSiteLink,
    @Default('') final String itchIoLink,
    @Default('') final String yandexGamesLink,
  }) = _UsageOptionsModel;
  const UsageOptionsModel._();

  factory UsageOptionsModel.fromJson(final dynamic json) =>
      _$UsageOptionsModelFromJson(json as Map<String, dynamic>);
  factory UsageOptionsModel.fromFirestore(
    final DocumentSnapshot<Map<String, dynamic>> snapshot,
    // ignore: avoid_unused_constructor_parameters
    final SnapshotOptions? options,
  ) {
    final json = snapshot.data();
    return UsageOptionsModel.fromJson(json);
  }

  static Map<String, Object?> toFirestore(
    final UsageOptionsModel value,
    final SetOptions? options,
  ) {
    return value.toJson();
  }

  static const empty = UsageOptionsModel();
}
