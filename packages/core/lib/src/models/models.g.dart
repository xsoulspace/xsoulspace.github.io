// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MixedResponse<T> _$MixedResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    MixedResponse<T>(
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
      errors: (json['errors'] as List<dynamic>?)
          ?.map(ResponseErrorDescription.fromJson)
          .toList(),
    );

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

_$SuccessfulDataResponseImpl<T> _$$SuccessfulDataResponseImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$SuccessfulDataResponseImpl<T>(
      data: fromJsonT(json['data']),
      $type: json['runtime_type'] as String?,
    );

Map<String, dynamic> _$$SuccessfulDataResponseImplToJson<T>(
  _$SuccessfulDataResponseImpl<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': toJsonT(instance.data),
      'runtime_type': instance.$type,
    };

_$SuccessfulVoidResponseImpl<T> _$$SuccessfulVoidResponseImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$SuccessfulVoidResponseImpl<T>(
      $type: json['runtime_type'] as String?,
    );

Map<String, dynamic> _$$SuccessfulVoidResponseImplToJson<T>(
  _$SuccessfulVoidResponseImpl<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'runtime_type': instance.$type,
    };

_$BadResponseImpl<T> _$$BadResponseImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$BadResponseImpl<T>(
      errors: (json['errors'] as List<dynamic>?)
              ?.map(ResponseErrorDescription.fromJson)
              .toList() ??
          const [],
      $type: json['runtime_type'] as String?,
    );

Map<String, dynamic> _$$BadResponseImplToJson<T>(
  _$BadResponseImpl<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'errors': instance.errors.map((e) => e.toJson()).toList(),
      'runtime_type': instance.$type,
    };

_$ResponseErrorDescriptionImpl _$$ResponseErrorDescriptionImplFromJson(
        Map<String, dynamic> json) =>
    _$ResponseErrorDescriptionImpl(
      code: json['code'] as String,
      id: json['id'] as String,
      message: json['message'] as String,
      detail: json['detail'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$ResponseErrorDescriptionImplToJson(
        _$ResponseErrorDescriptionImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'id': instance.id,
      'message': instance.message,
      'detail': instance.detail,
      'status': instance.status,
    };

_$ProjectModelImpl _$$ProjectModelImplFromJson(Map<String, dynamic> json) =>
    _$ProjectModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      shortDescription: json['shortDescription'] as String,
      status: $enumDecode(_$ProjectStatusEnumMap, json['status']),
      type: $enumDecode(_$ProjectTypeEnumMap, json['type']),
      releasedAt: fromMaybeTimestamp(json['releasedAt'] as Timestamp?),
      usageOptions: json['usageOptions'] == null
          ? UsageOptionsModel.empty
          : UsageOptionsModel.fromJson(json['usageOptions']),
      completedAt: fromMaybeTimestamp(json['completedAt'] as Timestamp?),
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      imagesLinks: (json['imagesLinks'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      videosLinks: (json['videosLinks'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      markdownPrivacyPolicy: json['markdownPrivacyPolicy'] as String? ?? '',
      markdownTermsAndConditions:
          json['markdownTermsAndConditions'] as String? ?? '',
      markdownChangelog: json['markdownChangelog'] as String? ?? '',
    );

Map<String, dynamic> _$$ProjectModelImplToJson(_$ProjectModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'shortDescription': instance.shortDescription,
      'status': _$ProjectStatusEnumMap[instance.status]!,
      'type': _$ProjectTypeEnumMap[instance.type]!,
      'releasedAt': toMaybeTimestamp(instance.releasedAt),
      'usageOptions': instance.usageOptions.toJson(),
      'completedAt': toMaybeTimestamp(instance.completedAt),
      'tags': instance.tags,
      'imagesLinks': instance.imagesLinks,
      'videosLinks': instance.videosLinks,
      'markdownPrivacyPolicy': instance.markdownPrivacyPolicy,
      'markdownTermsAndConditions': instance.markdownTermsAndConditions,
      'markdownChangelog': instance.markdownChangelog,
    };

const _$ProjectStatusEnumMap = {
  ProjectStatus.released: 'released',
  ProjectStatus.upcoming: 'upcoming',
  ProjectStatus.legacy: 'legacy',
};

const _$ProjectTypeEnumMap = {
  ProjectType.game: 'game',
  ProjectType.app: 'app',
  ProjectType.excelAddin: 'excelAddin',
};

_$UsageOptionsModelImpl _$$UsageOptionsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UsageOptionsModelImpl(
      githubLink: json['githubLink'] as String? ?? '',
      snapStoreLink: json['snapStoreLink'] as String? ?? '',
      googlePlayLink: json['googlePlayLink'] as String? ?? '',
      appleStoreLink: json['appleStoreLink'] as String? ?? '',
      windowsStoreLink: json['windowsStoreLink'] as String? ?? '',
      ruStoreLink: json['ruStoreLink'] as String? ?? '',
      huaweiAppGalleryLink: json['huaweiAppGalleryLink'] as String? ?? '',
      ownSiteLink: json['ownSiteLink'] as String? ?? '',
      itchIoLink: json['itchIoLink'] as String? ?? '',
      yandexGamesLink: json['yandexGamesLink'] as String? ?? '',
    );

Map<String, dynamic> _$$UsageOptionsModelImplToJson(
        _$UsageOptionsModelImpl instance) =>
    <String, dynamic>{
      'githubLink': instance.githubLink,
      'snapStoreLink': instance.snapStoreLink,
      'googlePlayLink': instance.googlePlayLink,
      'appleStoreLink': instance.appleStoreLink,
      'windowsStoreLink': instance.windowsStoreLink,
      'ruStoreLink': instance.ruStoreLink,
      'huaweiAppGalleryLink': instance.huaweiAppGalleryLink,
      'ownSiteLink': instance.ownSiteLink,
      'itchIoLink': instance.itchIoLink,
      'yandexGamesLink': instance.yandexGamesLink,
    };

_$RouteArgumentsModelImpl _$$RouteArgumentsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RouteArgumentsModelImpl(
      projectId: json['projectId'] as String? ?? '',
    );

Map<String, dynamic> _$$RouteArgumentsModelImplToJson(
        _$RouteArgumentsModelImpl instance) =>
    <String, dynamic>{
      'projectId': instance.projectId,
    };

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['id'] as String? ?? '',
      locale: localeFromString(json['locale'] as String?),
      themeMode: $enumDecodeNullable(_$ThemeModeEnumMap, json['themeMode']) ??
          ThemeMode.system,
      settings: json['settings'] == null
          ? UserSettingsModel.initial
          : UserSettingsModel.fromJson(
              json['settings'] as Map<String, dynamic>),
      hasCompletedOnboarding: json['hasCompletedOnboarding'] as bool? ?? false,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'locale': localeToString(instance.locale),
      'themeMode': _$ThemeModeEnumMap[instance.themeMode]!,
      'settings': instance.settings.toJson(),
      'hasCompletedOnboarding': instance.hasCompletedOnboarding,
    };

const _$ThemeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
};

_$UserSettingsModelImpl _$$UserSettingsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserSettingsModelImpl(
      themeMode: json['themeMode'] == null
          ? ThemeMode.system
          : _themeModeFromJson(json['themeMode'] as int?),
      isProjectsListReversed: json['isProjectsListReversed'] as bool? ?? true,
      charactersLimitForNewNotes:
          json['charactersLimitForNewNotes'] as int? ?? 0,
      locale: _localeFromJson(json['locale'] as String),
    );

Map<String, dynamic> _$$UserSettingsModelImplToJson(
        _$UserSettingsModelImpl instance) =>
    <String, dynamic>{
      'themeMode': _themeModeToJson(instance.themeMode),
      'isProjectsListReversed': instance.isProjectsListReversed,
      'charactersLimitForNewNotes': instance.charactersLimitForNewNotes,
      'locale': _localeToJson(instance.locale),
    };
