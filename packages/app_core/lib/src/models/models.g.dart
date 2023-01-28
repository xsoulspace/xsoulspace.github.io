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
          ?.map((e) => ResponseErrorDescription.fromJson(e))
          .toList(),
    );

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

_$SuccessfulDataResponse<T> _$$SuccessfulDataResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$SuccessfulDataResponse<T>(
      data: fromJsonT(json['data']),
      $type: json['runtime_type'] as String?,
    );

Map<String, dynamic> _$$SuccessfulDataResponseToJson<T>(
  _$SuccessfulDataResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': toJsonT(instance.data),
      'runtime_type': instance.$type,
    };

_$SuccessfulVoidResponse<T> _$$SuccessfulVoidResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$SuccessfulVoidResponse<T>(
      $type: json['runtime_type'] as String?,
    );

Map<String, dynamic> _$$SuccessfulVoidResponseToJson<T>(
  _$SuccessfulVoidResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'runtime_type': instance.$type,
    };

_$BadResponse<T> _$$BadResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$BadResponse<T>(
      errors: (json['errors'] as List<dynamic>?)
              ?.map((e) => ResponseErrorDescription.fromJson(e))
              .toList() ??
          const [],
      $type: json['runtime_type'] as String?,
    );

Map<String, dynamic> _$$BadResponseToJson<T>(
  _$BadResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'errors': instance.errors.map((e) => e.toJson()).toList(),
      'runtime_type': instance.$type,
    };

_$_ResponseErrorDescription _$$_ResponseErrorDescriptionFromJson(
        Map<String, dynamic> json) =>
    _$_ResponseErrorDescription(
      code: json['code'] as String,
      id: json['id'] as String,
      message: json['message'] as String,
      detail: json['detail'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$_ResponseErrorDescriptionToJson(
        _$_ResponseErrorDescription instance) =>
    <String, dynamic>{
      'code': instance.code,
      'id': instance.id,
      'message': instance.message,
      'detail': instance.detail,
      'status': instance.status,
    };

_$_ProjectModel _$$_ProjectModelFromJson(Map<String, dynamic> json) =>
    _$_ProjectModel(
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

Map<String, dynamic> _$$_ProjectModelToJson(_$_ProjectModel instance) =>
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

_$_UsageOptionsModel _$$_UsageOptionsModelFromJson(Map<String, dynamic> json) =>
    _$_UsageOptionsModel(
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

Map<String, dynamic> _$$_UsageOptionsModelToJson(
        _$_UsageOptionsModel instance) =>
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

_$_RouteArgumentsModel _$$_RouteArgumentsModelFromJson(
        Map<String, dynamic> json) =>
    _$_RouteArgumentsModel(
      projectId: json['projectId'] as String? ?? '',
    );

Map<String, dynamic> _$$_RouteArgumentsModelToJson(
        _$_RouteArgumentsModel instance) =>
    <String, dynamic>{
      'projectId': instance.projectId,
    };

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      id: json['id'] as String? ?? '',
      locale: localeFromString(json['locale'] as String?),
      themeMode: $enumDecodeNullable(_$ThemeModeEnumMap, json['themeMode']) ??
          ThemeMode.system,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'locale': localeToString(instance.locale),
      'themeMode': _$ThemeModeEnumMap[instance.themeMode]!,
    };

const _$ThemeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
};
