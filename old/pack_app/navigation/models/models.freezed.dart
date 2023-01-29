// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppRouteParameters _$AppRouteParametersFromJson(Map<String, dynamic> json) {
  return _AppRouteParameters.fromJson(json);
}

/// @nodoc
mixin _$AppRouteParameters {
  String get appCode => throw _privateConstructorUsedError;
  String get gameCode => throw _privateConstructorUsedError;
  String get libraryCode => throw _privateConstructorUsedError;
  String get excelAddinCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppRouteParametersCopyWith<AppRouteParameters> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppRouteParametersCopyWith<$Res> {
  factory $AppRouteParametersCopyWith(
          AppRouteParameters value, $Res Function(AppRouteParameters) then) =
      _$AppRouteParametersCopyWithImpl<$Res, AppRouteParameters>;
  @useResult
  $Res call(
      {String appCode,
      String gameCode,
      String libraryCode,
      String excelAddinCode});
}

/// @nodoc
class _$AppRouteParametersCopyWithImpl<$Res, $Val extends AppRouteParameters>
    implements $AppRouteParametersCopyWith<$Res> {
  _$AppRouteParametersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appCode = null,
    Object? gameCode = null,
    Object? libraryCode = null,
    Object? excelAddinCode = null,
  }) {
    return _then(_value.copyWith(
      appCode: null == appCode
          ? _value.appCode
          : appCode // ignore: cast_nullable_to_non_nullable
              as String,
      gameCode: null == gameCode
          ? _value.gameCode
          : gameCode // ignore: cast_nullable_to_non_nullable
              as String,
      libraryCode: null == libraryCode
          ? _value.libraryCode
          : libraryCode // ignore: cast_nullable_to_non_nullable
              as String,
      excelAddinCode: null == excelAddinCode
          ? _value.excelAddinCode
          : excelAddinCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AppRouteParametersCopyWith<$Res>
    implements $AppRouteParametersCopyWith<$Res> {
  factory _$$_AppRouteParametersCopyWith(_$_AppRouteParameters value,
          $Res Function(_$_AppRouteParameters) then) =
      __$$_AppRouteParametersCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String appCode,
      String gameCode,
      String libraryCode,
      String excelAddinCode});
}

/// @nodoc
class __$$_AppRouteParametersCopyWithImpl<$Res>
    extends _$AppRouteParametersCopyWithImpl<$Res, _$_AppRouteParameters>
    implements _$$_AppRouteParametersCopyWith<$Res> {
  __$$_AppRouteParametersCopyWithImpl(
      _$_AppRouteParameters _value, $Res Function(_$_AppRouteParameters) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appCode = null,
    Object? gameCode = null,
    Object? libraryCode = null,
    Object? excelAddinCode = null,
  }) {
    return _then(_$_AppRouteParameters(
      appCode: null == appCode
          ? _value.appCode
          : appCode // ignore: cast_nullable_to_non_nullable
              as String,
      gameCode: null == gameCode
          ? _value.gameCode
          : gameCode // ignore: cast_nullable_to_non_nullable
              as String,
      libraryCode: null == libraryCode
          ? _value.libraryCode
          : libraryCode // ignore: cast_nullable_to_non_nullable
              as String,
      excelAddinCode: null == excelAddinCode
          ? _value.excelAddinCode
          : excelAddinCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_AppRouteParameters extends _AppRouteParameters {
  const _$_AppRouteParameters(
      {this.appCode = '',
      this.gameCode = '',
      this.libraryCode = '',
      this.excelAddinCode = ''})
      : super._();

  factory _$_AppRouteParameters.fromJson(Map<String, dynamic> json) =>
      _$$_AppRouteParametersFromJson(json);

  @override
  @JsonKey()
  final String appCode;
  @override
  @JsonKey()
  final String gameCode;
  @override
  @JsonKey()
  final String libraryCode;
  @override
  @JsonKey()
  final String excelAddinCode;

  @override
  String toString() {
    return 'AppRouteParameters(appCode: $appCode, gameCode: $gameCode, libraryCode: $libraryCode, excelAddinCode: $excelAddinCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppRouteParameters &&
            (identical(other.appCode, appCode) || other.appCode == appCode) &&
            (identical(other.gameCode, gameCode) ||
                other.gameCode == gameCode) &&
            (identical(other.libraryCode, libraryCode) ||
                other.libraryCode == libraryCode) &&
            (identical(other.excelAddinCode, excelAddinCode) ||
                other.excelAddinCode == excelAddinCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, appCode, gameCode, libraryCode, excelAddinCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppRouteParametersCopyWith<_$_AppRouteParameters> get copyWith =>
      __$$_AppRouteParametersCopyWithImpl<_$_AppRouteParameters>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppRouteParametersToJson(
      this,
    );
  }
}

abstract class _AppRouteParameters extends AppRouteParameters {
  const factory _AppRouteParameters(
      {final String appCode,
      final String gameCode,
      final String libraryCode,
      final String excelAddinCode}) = _$_AppRouteParameters;
  const _AppRouteParameters._() : super._();

  factory _AppRouteParameters.fromJson(Map<String, dynamic> json) =
      _$_AppRouteParameters.fromJson;

  @override
  String get appCode;
  @override
  String get gameCode;
  @override
  String get libraryCode;
  @override
  String get excelAddinCode;
  @override
  @JsonKey(ignore: true)
  _$$_AppRouteParametersCopyWith<_$_AppRouteParameters> get copyWith =>
      throw _privateConstructorUsedError;
}
