// GENERATED CODE - DO NOT MODIFY BY HAND

part of pack_app;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppRouteParameters _$AppRouteParametersFromJson(
        final Map<String, dynamic> json) =>
    AppRouteParameters(
      appCode: json['appCode'] as String?,
      excelAddinCode: json['excelAddinCode'] as String?,
      gameCode: json['gameCode'] as String?,
      libraryCode: json['libraryCode'] as String?,
    );

Map<String, dynamic> _$ParsedRouteParamsToJson(
        final AppRouteParameters instance) =>
    <String, dynamic>{
      'appCode': instance.appCode,
      'gameCode': instance.gameCode,
      'libraryCode': instance.libraryCode,
      'excelAddinCode': instance.excelAddinCode,
    };
