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

AppSettingsModel _$AppSettingsModelFromJson(Map<String, dynamic> json) {
  return _AppSettingsModel.fromJson(json);
}

/// @nodoc
mixin _$AppSettingsModel {
  @JsonKey(fromJson: localeFromString, toJson: localeToString)
  Locale get locale => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppSettingsModelCopyWith<AppSettingsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppSettingsModelCopyWith<$Res> {
  factory $AppSettingsModelCopyWith(
          AppSettingsModel value, $Res Function(AppSettingsModel) then) =
      _$AppSettingsModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(fromJson: localeFromString, toJson: localeToString)
          Locale locale});
}

/// @nodoc
class _$AppSettingsModelCopyWithImpl<$Res>
    implements $AppSettingsModelCopyWith<$Res> {
  _$AppSettingsModelCopyWithImpl(this._value, this._then);

  final AppSettingsModel _value;
  // ignore: unused_field
  final $Res Function(AppSettingsModel) _then;

  @override
  $Res call({
    Object? locale = freezed,
  }) {
    return _then(_value.copyWith(
      locale: locale == freezed
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale,
    ));
  }
}

/// @nodoc
abstract class _$$_AppSettingsModelCopyWith<$Res>
    implements $AppSettingsModelCopyWith<$Res> {
  factory _$$_AppSettingsModelCopyWith(
          _$_AppSettingsModel value, $Res Function(_$_AppSettingsModel) then) =
      __$$_AppSettingsModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(fromJson: localeFromString, toJson: localeToString)
          Locale locale});
}

/// @nodoc
class __$$_AppSettingsModelCopyWithImpl<$Res>
    extends _$AppSettingsModelCopyWithImpl<$Res>
    implements _$$_AppSettingsModelCopyWith<$Res> {
  __$$_AppSettingsModelCopyWithImpl(
      _$_AppSettingsModel _value, $Res Function(_$_AppSettingsModel) _then)
      : super(_value, (v) => _then(v as _$_AppSettingsModel));

  @override
  _$_AppSettingsModel get _value => super._value as _$_AppSettingsModel;

  @override
  $Res call({
    Object? locale = freezed,
  }) {
    return _then(_$_AppSettingsModel(
      locale: locale == freezed
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_AppSettingsModel extends _AppSettingsModel {
  const _$_AppSettingsModel(
      {@JsonKey(fromJson: localeFromString, toJson: localeToString)
          this.locale = Locales.en})
      : super._();

  factory _$_AppSettingsModel.fromJson(Map<String, dynamic> json) =>
      _$$_AppSettingsModelFromJson(json);

  @override
  @JsonKey(fromJson: localeFromString, toJson: localeToString)
  final Locale locale;

  @override
  String toString() {
    return 'AppSettingsModel(locale: $locale)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppSettingsModel &&
            const DeepCollectionEquality().equals(other.locale, locale));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(locale));

  @JsonKey(ignore: true)
  @override
  _$$_AppSettingsModelCopyWith<_$_AppSettingsModel> get copyWith =>
      __$$_AppSettingsModelCopyWithImpl<_$_AppSettingsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppSettingsModelToJson(
      this,
    );
  }
}

abstract class _AppSettingsModel extends AppSettingsModel {
  const factory _AppSettingsModel(
      {@JsonKey(fromJson: localeFromString, toJson: localeToString)
          final Locale locale}) = _$_AppSettingsModel;
  const _AppSettingsModel._() : super._();

  factory _AppSettingsModel.fromJson(Map<String, dynamic> json) =
      _$_AppSettingsModel.fromJson;

  @override
  @JsonKey(fromJson: localeFromString, toJson: localeToString)
  Locale get locale;
  @override
  @JsonKey(ignore: true)
  _$$_AppSettingsModelCopyWith<_$_AppSettingsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

CurrentWordModel _$CurrentWordModelFromJson(Map<String, dynamic> json) {
  return _CurrentWordModel.fromJson(json);
}

/// @nodoc
mixin _$CurrentWordModel {
  String get leftPart => throw _privateConstructorUsedError;
  String get middlePart => throw _privateConstructorUsedError;
  String get rightPart => throw _privateConstructorUsedError;
  String get fullWord => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CurrentWordModelCopyWith<CurrentWordModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrentWordModelCopyWith<$Res> {
  factory $CurrentWordModelCopyWith(
          CurrentWordModel value, $Res Function(CurrentWordModel) then) =
      _$CurrentWordModelCopyWithImpl<$Res>;
  $Res call(
      {String leftPart, String middlePart, String rightPart, String fullWord});
}

/// @nodoc
class _$CurrentWordModelCopyWithImpl<$Res>
    implements $CurrentWordModelCopyWith<$Res> {
  _$CurrentWordModelCopyWithImpl(this._value, this._then);

  final CurrentWordModel _value;
  // ignore: unused_field
  final $Res Function(CurrentWordModel) _then;

  @override
  $Res call({
    Object? leftPart = freezed,
    Object? middlePart = freezed,
    Object? rightPart = freezed,
    Object? fullWord = freezed,
  }) {
    return _then(_value.copyWith(
      leftPart: leftPart == freezed
          ? _value.leftPart
          : leftPart // ignore: cast_nullable_to_non_nullable
              as String,
      middlePart: middlePart == freezed
          ? _value.middlePart
          : middlePart // ignore: cast_nullable_to_non_nullable
              as String,
      rightPart: rightPart == freezed
          ? _value.rightPart
          : rightPart // ignore: cast_nullable_to_non_nullable
              as String,
      fullWord: fullWord == freezed
          ? _value.fullWord
          : fullWord // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_CurrentWordModelCopyWith<$Res>
    implements $CurrentWordModelCopyWith<$Res> {
  factory _$$_CurrentWordModelCopyWith(
          _$_CurrentWordModel value, $Res Function(_$_CurrentWordModel) then) =
      __$$_CurrentWordModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String leftPart, String middlePart, String rightPart, String fullWord});
}

/// @nodoc
class __$$_CurrentWordModelCopyWithImpl<$Res>
    extends _$CurrentWordModelCopyWithImpl<$Res>
    implements _$$_CurrentWordModelCopyWith<$Res> {
  __$$_CurrentWordModelCopyWithImpl(
      _$_CurrentWordModel _value, $Res Function(_$_CurrentWordModel) _then)
      : super(_value, (v) => _then(v as _$_CurrentWordModel));

  @override
  _$_CurrentWordModel get _value => super._value as _$_CurrentWordModel;

  @override
  $Res call({
    Object? leftPart = freezed,
    Object? middlePart = freezed,
    Object? rightPart = freezed,
    Object? fullWord = freezed,
  }) {
    return _then(_$_CurrentWordModel(
      leftPart: leftPart == freezed
          ? _value.leftPart
          : leftPart // ignore: cast_nullable_to_non_nullable
              as String,
      middlePart: middlePart == freezed
          ? _value.middlePart
          : middlePart // ignore: cast_nullable_to_non_nullable
              as String,
      rightPart: rightPart == freezed
          ? _value.rightPart
          : rightPart // ignore: cast_nullable_to_non_nullable
              as String,
      fullWord: fullWord == freezed
          ? _value.fullWord
          : fullWord // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_CurrentWordModel extends _CurrentWordModel {
  const _$_CurrentWordModel(
      {this.leftPart = '',
      this.middlePart = '',
      this.rightPart = '',
      this.fullWord = ''})
      : super._();

  factory _$_CurrentWordModel.fromJson(Map<String, dynamic> json) =>
      _$$_CurrentWordModelFromJson(json);

  @override
  @JsonKey()
  final String leftPart;
  @override
  @JsonKey()
  final String middlePart;
  @override
  @JsonKey()
  final String rightPart;
  @override
  @JsonKey()
  final String fullWord;

  @override
  String toString() {
    return 'CurrentWordModel(leftPart: $leftPart, middlePart: $middlePart, rightPart: $rightPart, fullWord: $fullWord)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CurrentWordModel &&
            const DeepCollectionEquality().equals(other.leftPart, leftPart) &&
            const DeepCollectionEquality()
                .equals(other.middlePart, middlePart) &&
            const DeepCollectionEquality().equals(other.rightPart, rightPart) &&
            const DeepCollectionEquality().equals(other.fullWord, fullWord));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(leftPart),
      const DeepCollectionEquality().hash(middlePart),
      const DeepCollectionEquality().hash(rightPart),
      const DeepCollectionEquality().hash(fullWord));

  @JsonKey(ignore: true)
  @override
  _$$_CurrentWordModelCopyWith<_$_CurrentWordModel> get copyWith =>
      __$$_CurrentWordModelCopyWithImpl<_$_CurrentWordModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CurrentWordModelToJson(
      this,
    );
  }
}

abstract class _CurrentWordModel extends CurrentWordModel {
  const factory _CurrentWordModel(
      {final String leftPart,
      final String middlePart,
      final String rightPart,
      final String fullWord}) = _$_CurrentWordModel;
  const _CurrentWordModel._() : super._();

  factory _CurrentWordModel.fromJson(Map<String, dynamic> json) =
      _$_CurrentWordModel.fromJson;

  @override
  String get leftPart;
  @override
  String get middlePart;
  @override
  String get rightPart;
  @override
  String get fullWord;
  @override
  @JsonKey(ignore: true)
  _$$_CurrentWordModelCopyWith<_$_CurrentWordModel> get copyWith =>
      throw _privateConstructorUsedError;
}
