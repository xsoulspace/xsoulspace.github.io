// GENERATED CODE - DO NOT MODIFY BY HAND

part of abstract;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Project _$ProjectFromJson(Map<String, dynamic> json) => Project(
      id: Project.idFromJson(json['id'] as String?),
      name: json['name'] as String,
      description: json['description'] as String,
      projectStatus:
          $enumDecode(_$ProjectStatusesEnumMap, json['projectStatus']),
      projectType: $enumDecode(_$ProjectTypesEnumMap, json['projectType']),
      links: Links.fromJson(json['links'] as Map<String, dynamic>),
      hashtags:
          (json['hashtags'] as List<dynamic>).map((e) => e as String).toList(),
      fullDescription: json['fullDescription'] as String?,
      imagesFolder: json['imagesFolder'] as String?,
      features: (json['features'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

const _$ProjectStatusesEnumMap = {
  ProjectStatuses.planned: 'planned',
  ProjectStatuses.workInProgress: 'workInProgress',
  ProjectStatuses.released: 'released',
};

const _$ProjectTypesEnumMap = {
  ProjectTypes.app: 'app',
  ProjectTypes.game: 'game',
  ProjectTypes.library: 'library',
  ProjectTypes.excelAddin: 'excelAddin',
  ProjectTypes.excelVba: 'excelVba',
};

Links _$LinksFromJson(Map<String, dynamic> json) => Links(
      githubLink: json['githubLink'] as String? ?? '',
      snapstoreLink: json['snapstoreLink'] as String? ?? '',
      googlePlayLink: json['googlePlayLink'] as String? ?? '',
      appleStoreLink: json['appleStoreLink'] as String? ?? '',
      liveSiteLink: json['liveSiteLink'] as String? ?? '',
    );

ProjectAssetsPaths _$ProjectAssetsPathsFromJson(Map<String, dynamic> json) =>
    ProjectAssetsPaths(
      cardPreview: json['cardPreview'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
    );
