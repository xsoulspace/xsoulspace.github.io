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
    @Default([]) final List<String> imagesLinks,
    @Default([]) final List<String> videosLinks,
    @Default('') final String markdownPrivacyPolicy,
    @Default('') final String markdownTermsAndConditions,
    @Default('') final String markdownChangelog,
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

  static final mock = ProjectModel(
    id: '',
    shortDescription: 'short description',
    status: ProjectStatus.released,
    subtitle: 'subtitle',
    title: 'Word By Word: Adventure',
    type: ProjectType.game,
    markdownChangelog:
        'https://raw.githubusercontent.com/xsoulspace/word_by_word_game/master/CHANGELOG.md',
    markdownPrivacyPolicy:
        'https://raw.githubusercontent.com/xsoulspace/word_by_word_game/master/PRIVACY_POLICY.md',
    markdownTermsAndConditions:
        'https://raw.githubusercontent.com/xsoulspace/word_by_word_game/master/TERMS_AND_CONDITIONS.md',
    imagesLinks: const [
      'https://dashboard.snapcraft.io/site_media/appmedia/2023/01/Desktop_-_2.png',
      'https://dashboard.snapcraft.io/site_media/appmedia/2023/01/Desktop_-_2.png',
      'https://dashboard.snapcraft.io/site_media/appmedia/2023/01/Desktop_-_2.png'
    ],
    videosLinks: const [
      '<iframe width="100%" height="100%" src="https://www.youtube.com/embed/gnA24BBxAeY" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>',
    ],
    releasedAt: DateTime.now().subtract(const Duration(days: 365)),
    tags: const [
      'for creators',
      'for developers',
      'lifestyle',
      'ideas management'
    ],
    usageOptions: UsageOptionsModel.empty,
  );
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
