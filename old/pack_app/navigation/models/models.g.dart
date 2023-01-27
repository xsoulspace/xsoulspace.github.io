// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppRouteParameters _$$_AppRouteParametersFromJson(
        Map<String, dynamic> json) =>
    _$_AppRouteParameters(
      appCode: json['appCode'] as String? ?? '',
      gameCode: json['gameCode'] as String? ?? '',
      libraryCode: json['libraryCode'] as String? ?? '',
      excelAddinCode: json['excelAddinCode'] as String? ?? '',
    );

Map<String, dynamic> _$$_AppRouteParametersToJson(
        _$_AppRouteParameters instance) =>
    <String, dynamic>{
      'appCode': instance.appCode,
      'gameCode': instance.gameCode,
      'libraryCode': instance.libraryCode,
      'excelAddinCode': instance.excelAddinCode,
    };
