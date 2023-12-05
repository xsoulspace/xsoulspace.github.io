// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ApiResponse<T> _$ApiResponseFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  switch (json['runtime_type']) {
    case 'SuccessfulDataResponse':
      return SuccessfulDataResponse<T>.fromJson(json, fromJsonT);
    case 'SuccessfulVoidResponse':
      return SuccessfulVoidResponse<T>.fromJson(json, fromJsonT);
    case 'BadResponse':
      return BadResponse<T>.fromJson(json, fromJsonT);

    default:
      throw CheckedFromJsonException(json, 'runtime_type', 'ApiResponse',
          'Invalid union type "${json['runtime_type']}"!');
  }
}

/// @nodoc
mixin _$ApiResponse<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(@JsonKey(name: 'data') T data)
        successfulDataResponse,
    required TResult Function() successfulVoidResponse,
    required TResult Function(
            @JsonKey(name: 'errors') List<ResponseErrorDescription> errors)
        badResponse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(@JsonKey(name: 'data') T data)? successfulDataResponse,
    TResult? Function()? successfulVoidResponse,
    TResult? Function(
            @JsonKey(name: 'errors') List<ResponseErrorDescription> errors)?
        badResponse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@JsonKey(name: 'data') T data)? successfulDataResponse,
    TResult Function()? successfulVoidResponse,
    TResult Function(
            @JsonKey(name: 'errors') List<ResponseErrorDescription> errors)?
        badResponse,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuccessfulDataResponse<T> value)
        successfulDataResponse,
    required TResult Function(SuccessfulVoidResponse<T> value)
        successfulVoidResponse,
    required TResult Function(BadResponse<T> value) badResponse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SuccessfulDataResponse<T> value)? successfulDataResponse,
    TResult? Function(SuccessfulVoidResponse<T> value)? successfulVoidResponse,
    TResult? Function(BadResponse<T> value)? badResponse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessfulDataResponse<T> value)? successfulDataResponse,
    TResult Function(SuccessfulVoidResponse<T> value)? successfulVoidResponse,
    TResult Function(BadResponse<T> value)? badResponse,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiResponseCopyWith<T, $Res> {
  factory $ApiResponseCopyWith(
          ApiResponse<T> value, $Res Function(ApiResponse<T>) then) =
      _$ApiResponseCopyWithImpl<T, $Res, ApiResponse<T>>;
}

/// @nodoc
class _$ApiResponseCopyWithImpl<T, $Res, $Val extends ApiResponse<T>>
    implements $ApiResponseCopyWith<T, $Res> {
  _$ApiResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SuccessfulDataResponseImplCopyWith<T, $Res> {
  factory _$$SuccessfulDataResponseImplCopyWith(
          _$SuccessfulDataResponseImpl<T> value,
          $Res Function(_$SuccessfulDataResponseImpl<T>) then) =
      __$$SuccessfulDataResponseImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({@JsonKey(name: 'data') T data});
}

/// @nodoc
class __$$SuccessfulDataResponseImplCopyWithImpl<T, $Res>
    extends _$ApiResponseCopyWithImpl<T, $Res, _$SuccessfulDataResponseImpl<T>>
    implements _$$SuccessfulDataResponseImplCopyWith<T, $Res> {
  __$$SuccessfulDataResponseImplCopyWithImpl(
      _$SuccessfulDataResponseImpl<T> _value,
      $Res Function(_$SuccessfulDataResponseImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$SuccessfulDataResponseImpl<T>(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, genericArgumentFactories: true)
class _$SuccessfulDataResponseImpl<T>
    with DiagnosticableTreeMixin
    implements SuccessfulDataResponse<T> {
  const _$SuccessfulDataResponseImpl(
      {@JsonKey(name: 'data') required this.data, final String? $type})
      : $type = $type ?? 'SuccessfulDataResponse';

  factory _$SuccessfulDataResponseImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$SuccessfulDataResponseImplFromJson(json, fromJsonT);

  @override
  @JsonKey(name: 'data')
  final T data;

  @JsonKey(name: 'runtime_type')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ApiResponse<$T>.successfulDataResponse(data: $data)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
          DiagnosticsProperty('type', 'ApiResponse<$T>.successfulDataResponse'))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessfulDataResponseImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessfulDataResponseImplCopyWith<T, _$SuccessfulDataResponseImpl<T>>
      get copyWith => __$$SuccessfulDataResponseImplCopyWithImpl<T,
          _$SuccessfulDataResponseImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(@JsonKey(name: 'data') T data)
        successfulDataResponse,
    required TResult Function() successfulVoidResponse,
    required TResult Function(
            @JsonKey(name: 'errors') List<ResponseErrorDescription> errors)
        badResponse,
  }) {
    return successfulDataResponse(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(@JsonKey(name: 'data') T data)? successfulDataResponse,
    TResult? Function()? successfulVoidResponse,
    TResult? Function(
            @JsonKey(name: 'errors') List<ResponseErrorDescription> errors)?
        badResponse,
  }) {
    return successfulDataResponse?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@JsonKey(name: 'data') T data)? successfulDataResponse,
    TResult Function()? successfulVoidResponse,
    TResult Function(
            @JsonKey(name: 'errors') List<ResponseErrorDescription> errors)?
        badResponse,
    required TResult orElse(),
  }) {
    if (successfulDataResponse != null) {
      return successfulDataResponse(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuccessfulDataResponse<T> value)
        successfulDataResponse,
    required TResult Function(SuccessfulVoidResponse<T> value)
        successfulVoidResponse,
    required TResult Function(BadResponse<T> value) badResponse,
  }) {
    return successfulDataResponse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SuccessfulDataResponse<T> value)? successfulDataResponse,
    TResult? Function(SuccessfulVoidResponse<T> value)? successfulVoidResponse,
    TResult? Function(BadResponse<T> value)? badResponse,
  }) {
    return successfulDataResponse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessfulDataResponse<T> value)? successfulDataResponse,
    TResult Function(SuccessfulVoidResponse<T> value)? successfulVoidResponse,
    TResult Function(BadResponse<T> value)? badResponse,
    required TResult orElse(),
  }) {
    if (successfulDataResponse != null) {
      return successfulDataResponse(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$SuccessfulDataResponseImplToJson<T>(this, toJsonT);
  }
}

abstract class SuccessfulDataResponse<T> implements ApiResponse<T> {
  const factory SuccessfulDataResponse(
          {@JsonKey(name: 'data') required final T data}) =
      _$SuccessfulDataResponseImpl<T>;

  factory SuccessfulDataResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$SuccessfulDataResponseImpl<T>.fromJson;

  @JsonKey(name: 'data')
  T get data;
  @JsonKey(ignore: true)
  _$$SuccessfulDataResponseImplCopyWith<T, _$SuccessfulDataResponseImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessfulVoidResponseImplCopyWith<T, $Res> {
  factory _$$SuccessfulVoidResponseImplCopyWith(
          _$SuccessfulVoidResponseImpl<T> value,
          $Res Function(_$SuccessfulVoidResponseImpl<T>) then) =
      __$$SuccessfulVoidResponseImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$SuccessfulVoidResponseImplCopyWithImpl<T, $Res>
    extends _$ApiResponseCopyWithImpl<T, $Res, _$SuccessfulVoidResponseImpl<T>>
    implements _$$SuccessfulVoidResponseImplCopyWith<T, $Res> {
  __$$SuccessfulVoidResponseImplCopyWithImpl(
      _$SuccessfulVoidResponseImpl<T> _value,
      $Res Function(_$SuccessfulVoidResponseImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

@JsonSerializable(explicitToJson: true, genericArgumentFactories: true)
class _$SuccessfulVoidResponseImpl<T>
    with DiagnosticableTreeMixin
    implements SuccessfulVoidResponse<T> {
  const _$SuccessfulVoidResponseImpl({final String? $type})
      : $type = $type ?? 'SuccessfulVoidResponse';

  factory _$SuccessfulVoidResponseImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$SuccessfulVoidResponseImplFromJson(json, fromJsonT);

  @JsonKey(name: 'runtime_type')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ApiResponse<$T>.successfulVoidResponse()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty('type', 'ApiResponse<$T>.successfulVoidResponse'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessfulVoidResponseImpl<T>);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(@JsonKey(name: 'data') T data)
        successfulDataResponse,
    required TResult Function() successfulVoidResponse,
    required TResult Function(
            @JsonKey(name: 'errors') List<ResponseErrorDescription> errors)
        badResponse,
  }) {
    return successfulVoidResponse();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(@JsonKey(name: 'data') T data)? successfulDataResponse,
    TResult? Function()? successfulVoidResponse,
    TResult? Function(
            @JsonKey(name: 'errors') List<ResponseErrorDescription> errors)?
        badResponse,
  }) {
    return successfulVoidResponse?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@JsonKey(name: 'data') T data)? successfulDataResponse,
    TResult Function()? successfulVoidResponse,
    TResult Function(
            @JsonKey(name: 'errors') List<ResponseErrorDescription> errors)?
        badResponse,
    required TResult orElse(),
  }) {
    if (successfulVoidResponse != null) {
      return successfulVoidResponse();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuccessfulDataResponse<T> value)
        successfulDataResponse,
    required TResult Function(SuccessfulVoidResponse<T> value)
        successfulVoidResponse,
    required TResult Function(BadResponse<T> value) badResponse,
  }) {
    return successfulVoidResponse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SuccessfulDataResponse<T> value)? successfulDataResponse,
    TResult? Function(SuccessfulVoidResponse<T> value)? successfulVoidResponse,
    TResult? Function(BadResponse<T> value)? badResponse,
  }) {
    return successfulVoidResponse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessfulDataResponse<T> value)? successfulDataResponse,
    TResult Function(SuccessfulVoidResponse<T> value)? successfulVoidResponse,
    TResult Function(BadResponse<T> value)? badResponse,
    required TResult orElse(),
  }) {
    if (successfulVoidResponse != null) {
      return successfulVoidResponse(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$SuccessfulVoidResponseImplToJson<T>(this, toJsonT);
  }
}

abstract class SuccessfulVoidResponse<T> implements ApiResponse<T> {
  const factory SuccessfulVoidResponse() = _$SuccessfulVoidResponseImpl<T>;

  factory SuccessfulVoidResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$SuccessfulVoidResponseImpl<T>.fromJson;
}

/// @nodoc
abstract class _$$BadResponseImplCopyWith<T, $Res> {
  factory _$$BadResponseImplCopyWith(_$BadResponseImpl<T> value,
          $Res Function(_$BadResponseImpl<T>) then) =
      __$$BadResponseImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({@JsonKey(name: 'errors') List<ResponseErrorDescription> errors});
}

/// @nodoc
class __$$BadResponseImplCopyWithImpl<T, $Res>
    extends _$ApiResponseCopyWithImpl<T, $Res, _$BadResponseImpl<T>>
    implements _$$BadResponseImplCopyWith<T, $Res> {
  __$$BadResponseImplCopyWithImpl(
      _$BadResponseImpl<T> _value, $Res Function(_$BadResponseImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errors = null,
  }) {
    return _then(_$BadResponseImpl<T>(
      errors: null == errors
          ? _value._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<ResponseErrorDescription>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, genericArgumentFactories: true)
class _$BadResponseImpl<T>
    with DiagnosticableTreeMixin
    implements BadResponse<T> {
  const _$BadResponseImpl(
      {@JsonKey(name: 'errors')
      final List<ResponseErrorDescription> errors = const [],
      final String? $type})
      : _errors = errors,
        $type = $type ?? 'BadResponse';

  factory _$BadResponseImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$BadResponseImplFromJson(json, fromJsonT);

  final List<ResponseErrorDescription> _errors;
  @override
  @JsonKey(name: 'errors')
  List<ResponseErrorDescription> get errors {
    if (_errors is EqualUnmodifiableListView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_errors);
  }

  @JsonKey(name: 'runtime_type')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ApiResponse<$T>.badResponse(errors: $errors)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ApiResponse<$T>.badResponse'))
      ..add(DiagnosticsProperty('errors', errors));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BadResponseImpl<T> &&
            const DeepCollectionEquality().equals(other._errors, _errors));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_errors));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BadResponseImplCopyWith<T, _$BadResponseImpl<T>> get copyWith =>
      __$$BadResponseImplCopyWithImpl<T, _$BadResponseImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(@JsonKey(name: 'data') T data)
        successfulDataResponse,
    required TResult Function() successfulVoidResponse,
    required TResult Function(
            @JsonKey(name: 'errors') List<ResponseErrorDescription> errors)
        badResponse,
  }) {
    return badResponse(errors);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(@JsonKey(name: 'data') T data)? successfulDataResponse,
    TResult? Function()? successfulVoidResponse,
    TResult? Function(
            @JsonKey(name: 'errors') List<ResponseErrorDescription> errors)?
        badResponse,
  }) {
    return badResponse?.call(errors);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@JsonKey(name: 'data') T data)? successfulDataResponse,
    TResult Function()? successfulVoidResponse,
    TResult Function(
            @JsonKey(name: 'errors') List<ResponseErrorDescription> errors)?
        badResponse,
    required TResult orElse(),
  }) {
    if (badResponse != null) {
      return badResponse(errors);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuccessfulDataResponse<T> value)
        successfulDataResponse,
    required TResult Function(SuccessfulVoidResponse<T> value)
        successfulVoidResponse,
    required TResult Function(BadResponse<T> value) badResponse,
  }) {
    return badResponse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SuccessfulDataResponse<T> value)? successfulDataResponse,
    TResult? Function(SuccessfulVoidResponse<T> value)? successfulVoidResponse,
    TResult? Function(BadResponse<T> value)? badResponse,
  }) {
    return badResponse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessfulDataResponse<T> value)? successfulDataResponse,
    TResult Function(SuccessfulVoidResponse<T> value)? successfulVoidResponse,
    TResult Function(BadResponse<T> value)? badResponse,
    required TResult orElse(),
  }) {
    if (badResponse != null) {
      return badResponse(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$BadResponseImplToJson<T>(this, toJsonT);
  }
}

abstract class BadResponse<T> implements ApiResponse<T> {
  const factory BadResponse(
      {@JsonKey(name: 'errors')
      final List<ResponseErrorDescription> errors}) = _$BadResponseImpl<T>;

  factory BadResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$BadResponseImpl<T>.fromJson;

  @JsonKey(name: 'errors')
  List<ResponseErrorDescription> get errors;
  @JsonKey(ignore: true)
  _$$BadResponseImplCopyWith<T, _$BadResponseImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

ResponseErrorDescription _$ResponseErrorDescriptionFromJson(
    Map<String, dynamic> json) {
  return _ResponseErrorDescription.fromJson(json);
}

/// @nodoc
mixin _$ResponseErrorDescription {
  String get code => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String? get detail => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResponseErrorDescriptionCopyWith<ResponseErrorDescription> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseErrorDescriptionCopyWith<$Res> {
  factory $ResponseErrorDescriptionCopyWith(ResponseErrorDescription value,
          $Res Function(ResponseErrorDescription) then) =
      _$ResponseErrorDescriptionCopyWithImpl<$Res, ResponseErrorDescription>;
  @useResult
  $Res call(
      {String code, String id, String message, String? detail, String? status});
}

/// @nodoc
class _$ResponseErrorDescriptionCopyWithImpl<$Res,
        $Val extends ResponseErrorDescription>
    implements $ResponseErrorDescriptionCopyWith<$Res> {
  _$ResponseErrorDescriptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? id = null,
    Object? message = null,
    Object? detail = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      detail: freezed == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResponseErrorDescriptionImplCopyWith<$Res>
    implements $ResponseErrorDescriptionCopyWith<$Res> {
  factory _$$ResponseErrorDescriptionImplCopyWith(
          _$ResponseErrorDescriptionImpl value,
          $Res Function(_$ResponseErrorDescriptionImpl) then) =
      __$$ResponseErrorDescriptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String code, String id, String message, String? detail, String? status});
}

/// @nodoc
class __$$ResponseErrorDescriptionImplCopyWithImpl<$Res>
    extends _$ResponseErrorDescriptionCopyWithImpl<$Res,
        _$ResponseErrorDescriptionImpl>
    implements _$$ResponseErrorDescriptionImplCopyWith<$Res> {
  __$$ResponseErrorDescriptionImplCopyWithImpl(
      _$ResponseErrorDescriptionImpl _value,
      $Res Function(_$ResponseErrorDescriptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? id = null,
    Object? message = null,
    Object? detail = freezed,
    Object? status = freezed,
  }) {
    return _then(_$ResponseErrorDescriptionImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      detail: freezed == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ResponseErrorDescriptionImpl extends _ResponseErrorDescription
    with DiagnosticableTreeMixin {
  const _$ResponseErrorDescriptionImpl(
      {required this.code,
      required this.id,
      required this.message,
      this.detail,
      this.status})
      : super._();

  factory _$ResponseErrorDescriptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResponseErrorDescriptionImplFromJson(json);

  @override
  final String code;
  @override
  final String id;
  @override
  final String message;
  @override
  final String? detail;
  @override
  final String? status;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ResponseErrorDescription(code: $code, id: $id, message: $message, detail: $detail, status: $status)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ResponseErrorDescription'))
      ..add(DiagnosticsProperty('code', code))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('detail', detail))
      ..add(DiagnosticsProperty('status', status));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseErrorDescriptionImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.detail, detail) || other.detail == detail) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, code, id, message, detail, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseErrorDescriptionImplCopyWith<_$ResponseErrorDescriptionImpl>
      get copyWith => __$$ResponseErrorDescriptionImplCopyWithImpl<
          _$ResponseErrorDescriptionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponseErrorDescriptionImplToJson(
      this,
    );
  }
}

abstract class _ResponseErrorDescription extends ResponseErrorDescription {
  const factory _ResponseErrorDescription(
      {required final String code,
      required final String id,
      required final String message,
      final String? detail,
      final String? status}) = _$ResponseErrorDescriptionImpl;
  const _ResponseErrorDescription._() : super._();

  factory _ResponseErrorDescription.fromJson(Map<String, dynamic> json) =
      _$ResponseErrorDescriptionImpl.fromJson;

  @override
  String get code;
  @override
  String get id;
  @override
  String get message;
  @override
  String? get detail;
  @override
  String? get status;
  @override
  @JsonKey(ignore: true)
  _$$ResponseErrorDescriptionImplCopyWith<_$ResponseErrorDescriptionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ProjectModel _$ProjectModelFromJson(Map<String, dynamic> json) {
  return _ProjectModel.fromJson(json);
}

/// @nodoc
mixin _$ProjectModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get subtitle => throw _privateConstructorUsedError;
  String get shortDescription => throw _privateConstructorUsedError;
  ProjectStatus get status => throw _privateConstructorUsedError;
  ProjectType get type => throw _privateConstructorUsedError;
  @JsonKey(fromJson: fromMaybeTimestamp, toJson: toMaybeTimestamp)
  DateTime? get releasedAt => throw _privateConstructorUsedError;
  UsageOptionsModel get usageOptions => throw _privateConstructorUsedError;
  @JsonKey(fromJson: fromMaybeTimestamp, toJson: toMaybeTimestamp)
  DateTime? get completedAt => throw _privateConstructorUsedError;
  List<String> get tags =>
      throw _privateConstructorUsedError; // provide url for every path
  List<String> get imagesLinks => throw _privateConstructorUsedError;
  List<String> get videosLinks => throw _privateConstructorUsedError;
  String get markdownPrivacyPolicy => throw _privateConstructorUsedError;
  String get markdownTermsAndConditions => throw _privateConstructorUsedError;
  String get markdownChangelog => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectModelCopyWith<ProjectModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectModelCopyWith<$Res> {
  factory $ProjectModelCopyWith(
          ProjectModel value, $Res Function(ProjectModel) then) =
      _$ProjectModelCopyWithImpl<$Res, ProjectModel>;
  @useResult
  $Res call(
      {String id,
      String title,
      String subtitle,
      String shortDescription,
      ProjectStatus status,
      ProjectType type,
      @JsonKey(fromJson: fromMaybeTimestamp, toJson: toMaybeTimestamp)
      DateTime? releasedAt,
      UsageOptionsModel usageOptions,
      @JsonKey(fromJson: fromMaybeTimestamp, toJson: toMaybeTimestamp)
      DateTime? completedAt,
      List<String> tags,
      List<String> imagesLinks,
      List<String> videosLinks,
      String markdownPrivacyPolicy,
      String markdownTermsAndConditions,
      String markdownChangelog});

  $UsageOptionsModelCopyWith<$Res> get usageOptions;
}

/// @nodoc
class _$ProjectModelCopyWithImpl<$Res, $Val extends ProjectModel>
    implements $ProjectModelCopyWith<$Res> {
  _$ProjectModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? subtitle = null,
    Object? shortDescription = null,
    Object? status = null,
    Object? type = null,
    Object? releasedAt = freezed,
    Object? usageOptions = null,
    Object? completedAt = freezed,
    Object? tags = null,
    Object? imagesLinks = null,
    Object? videosLinks = null,
    Object? markdownPrivacyPolicy = null,
    Object? markdownTermsAndConditions = null,
    Object? markdownChangelog = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: null == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String,
      shortDescription: null == shortDescription
          ? _value.shortDescription
          : shortDescription // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProjectStatus,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ProjectType,
      releasedAt: freezed == releasedAt
          ? _value.releasedAt
          : releasedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      usageOptions: null == usageOptions
          ? _value.usageOptions
          : usageOptions // ignore: cast_nullable_to_non_nullable
              as UsageOptionsModel,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      imagesLinks: null == imagesLinks
          ? _value.imagesLinks
          : imagesLinks // ignore: cast_nullable_to_non_nullable
              as List<String>,
      videosLinks: null == videosLinks
          ? _value.videosLinks
          : videosLinks // ignore: cast_nullable_to_non_nullable
              as List<String>,
      markdownPrivacyPolicy: null == markdownPrivacyPolicy
          ? _value.markdownPrivacyPolicy
          : markdownPrivacyPolicy // ignore: cast_nullable_to_non_nullable
              as String,
      markdownTermsAndConditions: null == markdownTermsAndConditions
          ? _value.markdownTermsAndConditions
          : markdownTermsAndConditions // ignore: cast_nullable_to_non_nullable
              as String,
      markdownChangelog: null == markdownChangelog
          ? _value.markdownChangelog
          : markdownChangelog // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UsageOptionsModelCopyWith<$Res> get usageOptions {
    return $UsageOptionsModelCopyWith<$Res>(_value.usageOptions, (value) {
      return _then(_value.copyWith(usageOptions: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProjectModelImplCopyWith<$Res>
    implements $ProjectModelCopyWith<$Res> {
  factory _$$ProjectModelImplCopyWith(
          _$ProjectModelImpl value, $Res Function(_$ProjectModelImpl) then) =
      __$$ProjectModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String subtitle,
      String shortDescription,
      ProjectStatus status,
      ProjectType type,
      @JsonKey(fromJson: fromMaybeTimestamp, toJson: toMaybeTimestamp)
      DateTime? releasedAt,
      UsageOptionsModel usageOptions,
      @JsonKey(fromJson: fromMaybeTimestamp, toJson: toMaybeTimestamp)
      DateTime? completedAt,
      List<String> tags,
      List<String> imagesLinks,
      List<String> videosLinks,
      String markdownPrivacyPolicy,
      String markdownTermsAndConditions,
      String markdownChangelog});

  @override
  $UsageOptionsModelCopyWith<$Res> get usageOptions;
}

/// @nodoc
class __$$ProjectModelImplCopyWithImpl<$Res>
    extends _$ProjectModelCopyWithImpl<$Res, _$ProjectModelImpl>
    implements _$$ProjectModelImplCopyWith<$Res> {
  __$$ProjectModelImplCopyWithImpl(
      _$ProjectModelImpl _value, $Res Function(_$ProjectModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? subtitle = null,
    Object? shortDescription = null,
    Object? status = null,
    Object? type = null,
    Object? releasedAt = freezed,
    Object? usageOptions = null,
    Object? completedAt = freezed,
    Object? tags = null,
    Object? imagesLinks = null,
    Object? videosLinks = null,
    Object? markdownPrivacyPolicy = null,
    Object? markdownTermsAndConditions = null,
    Object? markdownChangelog = null,
  }) {
    return _then(_$ProjectModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: null == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String,
      shortDescription: null == shortDescription
          ? _value.shortDescription
          : shortDescription // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProjectStatus,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ProjectType,
      releasedAt: freezed == releasedAt
          ? _value.releasedAt
          : releasedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      usageOptions: null == usageOptions
          ? _value.usageOptions
          : usageOptions // ignore: cast_nullable_to_non_nullable
              as UsageOptionsModel,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      imagesLinks: null == imagesLinks
          ? _value._imagesLinks
          : imagesLinks // ignore: cast_nullable_to_non_nullable
              as List<String>,
      videosLinks: null == videosLinks
          ? _value._videosLinks
          : videosLinks // ignore: cast_nullable_to_non_nullable
              as List<String>,
      markdownPrivacyPolicy: null == markdownPrivacyPolicy
          ? _value.markdownPrivacyPolicy
          : markdownPrivacyPolicy // ignore: cast_nullable_to_non_nullable
              as String,
      markdownTermsAndConditions: null == markdownTermsAndConditions
          ? _value.markdownTermsAndConditions
          : markdownTermsAndConditions // ignore: cast_nullable_to_non_nullable
              as String,
      markdownChangelog: null == markdownChangelog
          ? _value.markdownChangelog
          : markdownChangelog // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ProjectModelImpl extends _ProjectModel with DiagnosticableTreeMixin {
  const _$ProjectModelImpl(
      {required this.id,
      required this.title,
      required this.subtitle,
      required this.shortDescription,
      required this.status,
      required this.type,
      @JsonKey(fromJson: fromMaybeTimestamp, toJson: toMaybeTimestamp)
      this.releasedAt,
      this.usageOptions = UsageOptionsModel.empty,
      @JsonKey(fromJson: fromMaybeTimestamp, toJson: toMaybeTimestamp)
      this.completedAt,
      final List<String> tags = const [],
      final List<String> imagesLinks = const [],
      final List<String> videosLinks = const [],
      this.markdownPrivacyPolicy = '',
      this.markdownTermsAndConditions = '',
      this.markdownChangelog = ''})
      : _tags = tags,
        _imagesLinks = imagesLinks,
        _videosLinks = videosLinks,
        super._();

  factory _$ProjectModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectModelImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String subtitle;
  @override
  final String shortDescription;
  @override
  final ProjectStatus status;
  @override
  final ProjectType type;
  @override
  @JsonKey(fromJson: fromMaybeTimestamp, toJson: toMaybeTimestamp)
  final DateTime? releasedAt;
  @override
  @JsonKey()
  final UsageOptionsModel usageOptions;
  @override
  @JsonKey(fromJson: fromMaybeTimestamp, toJson: toMaybeTimestamp)
  final DateTime? completedAt;
  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

// provide url for every path
  final List<String> _imagesLinks;
// provide url for every path
  @override
  @JsonKey()
  List<String> get imagesLinks {
    if (_imagesLinks is EqualUnmodifiableListView) return _imagesLinks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imagesLinks);
  }

  final List<String> _videosLinks;
  @override
  @JsonKey()
  List<String> get videosLinks {
    if (_videosLinks is EqualUnmodifiableListView) return _videosLinks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_videosLinks);
  }

  @override
  @JsonKey()
  final String markdownPrivacyPolicy;
  @override
  @JsonKey()
  final String markdownTermsAndConditions;
  @override
  @JsonKey()
  final String markdownChangelog;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProjectModel(id: $id, title: $title, subtitle: $subtitle, shortDescription: $shortDescription, status: $status, type: $type, releasedAt: $releasedAt, usageOptions: $usageOptions, completedAt: $completedAt, tags: $tags, imagesLinks: $imagesLinks, videosLinks: $videosLinks, markdownPrivacyPolicy: $markdownPrivacyPolicy, markdownTermsAndConditions: $markdownTermsAndConditions, markdownChangelog: $markdownChangelog)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProjectModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('subtitle', subtitle))
      ..add(DiagnosticsProperty('shortDescription', shortDescription))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('releasedAt', releasedAt))
      ..add(DiagnosticsProperty('usageOptions', usageOptions))
      ..add(DiagnosticsProperty('completedAt', completedAt))
      ..add(DiagnosticsProperty('tags', tags))
      ..add(DiagnosticsProperty('imagesLinks', imagesLinks))
      ..add(DiagnosticsProperty('videosLinks', videosLinks))
      ..add(DiagnosticsProperty('markdownPrivacyPolicy', markdownPrivacyPolicy))
      ..add(DiagnosticsProperty(
          'markdownTermsAndConditions', markdownTermsAndConditions))
      ..add(DiagnosticsProperty('markdownChangelog', markdownChangelog));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.shortDescription, shortDescription) ||
                other.shortDescription == shortDescription) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.releasedAt, releasedAt) ||
                other.releasedAt == releasedAt) &&
            (identical(other.usageOptions, usageOptions) ||
                other.usageOptions == usageOptions) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality()
                .equals(other._imagesLinks, _imagesLinks) &&
            const DeepCollectionEquality()
                .equals(other._videosLinks, _videosLinks) &&
            (identical(other.markdownPrivacyPolicy, markdownPrivacyPolicy) ||
                other.markdownPrivacyPolicy == markdownPrivacyPolicy) &&
            (identical(other.markdownTermsAndConditions,
                    markdownTermsAndConditions) ||
                other.markdownTermsAndConditions ==
                    markdownTermsAndConditions) &&
            (identical(other.markdownChangelog, markdownChangelog) ||
                other.markdownChangelog == markdownChangelog));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      subtitle,
      shortDescription,
      status,
      type,
      releasedAt,
      usageOptions,
      completedAt,
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(_imagesLinks),
      const DeepCollectionEquality().hash(_videosLinks),
      markdownPrivacyPolicy,
      markdownTermsAndConditions,
      markdownChangelog);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectModelImplCopyWith<_$ProjectModelImpl> get copyWith =>
      __$$ProjectModelImplCopyWithImpl<_$ProjectModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectModelImplToJson(
      this,
    );
  }
}

abstract class _ProjectModel extends ProjectModel {
  const factory _ProjectModel(
      {required final String id,
      required final String title,
      required final String subtitle,
      required final String shortDescription,
      required final ProjectStatus status,
      required final ProjectType type,
      @JsonKey(fromJson: fromMaybeTimestamp, toJson: toMaybeTimestamp)
      final DateTime? releasedAt,
      final UsageOptionsModel usageOptions,
      @JsonKey(fromJson: fromMaybeTimestamp, toJson: toMaybeTimestamp)
      final DateTime? completedAt,
      final List<String> tags,
      final List<String> imagesLinks,
      final List<String> videosLinks,
      final String markdownPrivacyPolicy,
      final String markdownTermsAndConditions,
      final String markdownChangelog}) = _$ProjectModelImpl;
  const _ProjectModel._() : super._();

  factory _ProjectModel.fromJson(Map<String, dynamic> json) =
      _$ProjectModelImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get subtitle;
  @override
  String get shortDescription;
  @override
  ProjectStatus get status;
  @override
  ProjectType get type;
  @override
  @JsonKey(fromJson: fromMaybeTimestamp, toJson: toMaybeTimestamp)
  DateTime? get releasedAt;
  @override
  UsageOptionsModel get usageOptions;
  @override
  @JsonKey(fromJson: fromMaybeTimestamp, toJson: toMaybeTimestamp)
  DateTime? get completedAt;
  @override
  List<String> get tags;
  @override // provide url for every path
  List<String> get imagesLinks;
  @override
  List<String> get videosLinks;
  @override
  String get markdownPrivacyPolicy;
  @override
  String get markdownTermsAndConditions;
  @override
  String get markdownChangelog;
  @override
  @JsonKey(ignore: true)
  _$$ProjectModelImplCopyWith<_$ProjectModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UsageOptionsModel _$UsageOptionsModelFromJson(Map<String, dynamic> json) {
  return _UsageOptionsModel.fromJson(json);
}

/// @nodoc
mixin _$UsageOptionsModel {
  String get githubLink => throw _privateConstructorUsedError;
  String get snapStoreLink => throw _privateConstructorUsedError;
  String get googlePlayLink => throw _privateConstructorUsedError;
  String get appleStoreLink => throw _privateConstructorUsedError;
  String get windowsStoreLink => throw _privateConstructorUsedError;
  String get ruStoreLink => throw _privateConstructorUsedError;
  String get huaweiAppGalleryLink => throw _privateConstructorUsedError;
  String get ownSiteLink => throw _privateConstructorUsedError;
  String get itchIoLink => throw _privateConstructorUsedError;
  String get yandexGamesLink => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UsageOptionsModelCopyWith<UsageOptionsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsageOptionsModelCopyWith<$Res> {
  factory $UsageOptionsModelCopyWith(
          UsageOptionsModel value, $Res Function(UsageOptionsModel) then) =
      _$UsageOptionsModelCopyWithImpl<$Res, UsageOptionsModel>;
  @useResult
  $Res call(
      {String githubLink,
      String snapStoreLink,
      String googlePlayLink,
      String appleStoreLink,
      String windowsStoreLink,
      String ruStoreLink,
      String huaweiAppGalleryLink,
      String ownSiteLink,
      String itchIoLink,
      String yandexGamesLink});
}

/// @nodoc
class _$UsageOptionsModelCopyWithImpl<$Res, $Val extends UsageOptionsModel>
    implements $UsageOptionsModelCopyWith<$Res> {
  _$UsageOptionsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? githubLink = null,
    Object? snapStoreLink = null,
    Object? googlePlayLink = null,
    Object? appleStoreLink = null,
    Object? windowsStoreLink = null,
    Object? ruStoreLink = null,
    Object? huaweiAppGalleryLink = null,
    Object? ownSiteLink = null,
    Object? itchIoLink = null,
    Object? yandexGamesLink = null,
  }) {
    return _then(_value.copyWith(
      githubLink: null == githubLink
          ? _value.githubLink
          : githubLink // ignore: cast_nullable_to_non_nullable
              as String,
      snapStoreLink: null == snapStoreLink
          ? _value.snapStoreLink
          : snapStoreLink // ignore: cast_nullable_to_non_nullable
              as String,
      googlePlayLink: null == googlePlayLink
          ? _value.googlePlayLink
          : googlePlayLink // ignore: cast_nullable_to_non_nullable
              as String,
      appleStoreLink: null == appleStoreLink
          ? _value.appleStoreLink
          : appleStoreLink // ignore: cast_nullable_to_non_nullable
              as String,
      windowsStoreLink: null == windowsStoreLink
          ? _value.windowsStoreLink
          : windowsStoreLink // ignore: cast_nullable_to_non_nullable
              as String,
      ruStoreLink: null == ruStoreLink
          ? _value.ruStoreLink
          : ruStoreLink // ignore: cast_nullable_to_non_nullable
              as String,
      huaweiAppGalleryLink: null == huaweiAppGalleryLink
          ? _value.huaweiAppGalleryLink
          : huaweiAppGalleryLink // ignore: cast_nullable_to_non_nullable
              as String,
      ownSiteLink: null == ownSiteLink
          ? _value.ownSiteLink
          : ownSiteLink // ignore: cast_nullable_to_non_nullable
              as String,
      itchIoLink: null == itchIoLink
          ? _value.itchIoLink
          : itchIoLink // ignore: cast_nullable_to_non_nullable
              as String,
      yandexGamesLink: null == yandexGamesLink
          ? _value.yandexGamesLink
          : yandexGamesLink // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UsageOptionsModelImplCopyWith<$Res>
    implements $UsageOptionsModelCopyWith<$Res> {
  factory _$$UsageOptionsModelImplCopyWith(_$UsageOptionsModelImpl value,
          $Res Function(_$UsageOptionsModelImpl) then) =
      __$$UsageOptionsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String githubLink,
      String snapStoreLink,
      String googlePlayLink,
      String appleStoreLink,
      String windowsStoreLink,
      String ruStoreLink,
      String huaweiAppGalleryLink,
      String ownSiteLink,
      String itchIoLink,
      String yandexGamesLink});
}

/// @nodoc
class __$$UsageOptionsModelImplCopyWithImpl<$Res>
    extends _$UsageOptionsModelCopyWithImpl<$Res, _$UsageOptionsModelImpl>
    implements _$$UsageOptionsModelImplCopyWith<$Res> {
  __$$UsageOptionsModelImplCopyWithImpl(_$UsageOptionsModelImpl _value,
      $Res Function(_$UsageOptionsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? githubLink = null,
    Object? snapStoreLink = null,
    Object? googlePlayLink = null,
    Object? appleStoreLink = null,
    Object? windowsStoreLink = null,
    Object? ruStoreLink = null,
    Object? huaweiAppGalleryLink = null,
    Object? ownSiteLink = null,
    Object? itchIoLink = null,
    Object? yandexGamesLink = null,
  }) {
    return _then(_$UsageOptionsModelImpl(
      githubLink: null == githubLink
          ? _value.githubLink
          : githubLink // ignore: cast_nullable_to_non_nullable
              as String,
      snapStoreLink: null == snapStoreLink
          ? _value.snapStoreLink
          : snapStoreLink // ignore: cast_nullable_to_non_nullable
              as String,
      googlePlayLink: null == googlePlayLink
          ? _value.googlePlayLink
          : googlePlayLink // ignore: cast_nullable_to_non_nullable
              as String,
      appleStoreLink: null == appleStoreLink
          ? _value.appleStoreLink
          : appleStoreLink // ignore: cast_nullable_to_non_nullable
              as String,
      windowsStoreLink: null == windowsStoreLink
          ? _value.windowsStoreLink
          : windowsStoreLink // ignore: cast_nullable_to_non_nullable
              as String,
      ruStoreLink: null == ruStoreLink
          ? _value.ruStoreLink
          : ruStoreLink // ignore: cast_nullable_to_non_nullable
              as String,
      huaweiAppGalleryLink: null == huaweiAppGalleryLink
          ? _value.huaweiAppGalleryLink
          : huaweiAppGalleryLink // ignore: cast_nullable_to_non_nullable
              as String,
      ownSiteLink: null == ownSiteLink
          ? _value.ownSiteLink
          : ownSiteLink // ignore: cast_nullable_to_non_nullable
              as String,
      itchIoLink: null == itchIoLink
          ? _value.itchIoLink
          : itchIoLink // ignore: cast_nullable_to_non_nullable
              as String,
      yandexGamesLink: null == yandexGamesLink
          ? _value.yandexGamesLink
          : yandexGamesLink // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$UsageOptionsModelImpl extends _UsageOptionsModel
    with DiagnosticableTreeMixin {
  const _$UsageOptionsModelImpl(
      {this.githubLink = '',
      this.snapStoreLink = '',
      this.googlePlayLink = '',
      this.appleStoreLink = '',
      this.windowsStoreLink = '',
      this.ruStoreLink = '',
      this.huaweiAppGalleryLink = '',
      this.ownSiteLink = '',
      this.itchIoLink = '',
      this.yandexGamesLink = ''})
      : super._();

  factory _$UsageOptionsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UsageOptionsModelImplFromJson(json);

  @override
  @JsonKey()
  final String githubLink;
  @override
  @JsonKey()
  final String snapStoreLink;
  @override
  @JsonKey()
  final String googlePlayLink;
  @override
  @JsonKey()
  final String appleStoreLink;
  @override
  @JsonKey()
  final String windowsStoreLink;
  @override
  @JsonKey()
  final String ruStoreLink;
  @override
  @JsonKey()
  final String huaweiAppGalleryLink;
  @override
  @JsonKey()
  final String ownSiteLink;
  @override
  @JsonKey()
  final String itchIoLink;
  @override
  @JsonKey()
  final String yandexGamesLink;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UsageOptionsModel(githubLink: $githubLink, snapStoreLink: $snapStoreLink, googlePlayLink: $googlePlayLink, appleStoreLink: $appleStoreLink, windowsStoreLink: $windowsStoreLink, ruStoreLink: $ruStoreLink, huaweiAppGalleryLink: $huaweiAppGalleryLink, ownSiteLink: $ownSiteLink, itchIoLink: $itchIoLink, yandexGamesLink: $yandexGamesLink)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UsageOptionsModel'))
      ..add(DiagnosticsProperty('githubLink', githubLink))
      ..add(DiagnosticsProperty('snapStoreLink', snapStoreLink))
      ..add(DiagnosticsProperty('googlePlayLink', googlePlayLink))
      ..add(DiagnosticsProperty('appleStoreLink', appleStoreLink))
      ..add(DiagnosticsProperty('windowsStoreLink', windowsStoreLink))
      ..add(DiagnosticsProperty('ruStoreLink', ruStoreLink))
      ..add(DiagnosticsProperty('huaweiAppGalleryLink', huaweiAppGalleryLink))
      ..add(DiagnosticsProperty('ownSiteLink', ownSiteLink))
      ..add(DiagnosticsProperty('itchIoLink', itchIoLink))
      ..add(DiagnosticsProperty('yandexGamesLink', yandexGamesLink));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UsageOptionsModelImpl &&
            (identical(other.githubLink, githubLink) ||
                other.githubLink == githubLink) &&
            (identical(other.snapStoreLink, snapStoreLink) ||
                other.snapStoreLink == snapStoreLink) &&
            (identical(other.googlePlayLink, googlePlayLink) ||
                other.googlePlayLink == googlePlayLink) &&
            (identical(other.appleStoreLink, appleStoreLink) ||
                other.appleStoreLink == appleStoreLink) &&
            (identical(other.windowsStoreLink, windowsStoreLink) ||
                other.windowsStoreLink == windowsStoreLink) &&
            (identical(other.ruStoreLink, ruStoreLink) ||
                other.ruStoreLink == ruStoreLink) &&
            (identical(other.huaweiAppGalleryLink, huaweiAppGalleryLink) ||
                other.huaweiAppGalleryLink == huaweiAppGalleryLink) &&
            (identical(other.ownSiteLink, ownSiteLink) ||
                other.ownSiteLink == ownSiteLink) &&
            (identical(other.itchIoLink, itchIoLink) ||
                other.itchIoLink == itchIoLink) &&
            (identical(other.yandexGamesLink, yandexGamesLink) ||
                other.yandexGamesLink == yandexGamesLink));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      githubLink,
      snapStoreLink,
      googlePlayLink,
      appleStoreLink,
      windowsStoreLink,
      ruStoreLink,
      huaweiAppGalleryLink,
      ownSiteLink,
      itchIoLink,
      yandexGamesLink);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UsageOptionsModelImplCopyWith<_$UsageOptionsModelImpl> get copyWith =>
      __$$UsageOptionsModelImplCopyWithImpl<_$UsageOptionsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UsageOptionsModelImplToJson(
      this,
    );
  }
}

abstract class _UsageOptionsModel extends UsageOptionsModel {
  const factory _UsageOptionsModel(
      {final String githubLink,
      final String snapStoreLink,
      final String googlePlayLink,
      final String appleStoreLink,
      final String windowsStoreLink,
      final String ruStoreLink,
      final String huaweiAppGalleryLink,
      final String ownSiteLink,
      final String itchIoLink,
      final String yandexGamesLink}) = _$UsageOptionsModelImpl;
  const _UsageOptionsModel._() : super._();

  factory _UsageOptionsModel.fromJson(Map<String, dynamic> json) =
      _$UsageOptionsModelImpl.fromJson;

  @override
  String get githubLink;
  @override
  String get snapStoreLink;
  @override
  String get googlePlayLink;
  @override
  String get appleStoreLink;
  @override
  String get windowsStoreLink;
  @override
  String get ruStoreLink;
  @override
  String get huaweiAppGalleryLink;
  @override
  String get ownSiteLink;
  @override
  String get itchIoLink;
  @override
  String get yandexGamesLink;
  @override
  @JsonKey(ignore: true)
  _$$UsageOptionsModelImplCopyWith<_$UsageOptionsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RouteArgumentsModel _$RouteArgumentsModelFromJson(Map<String, dynamic> json) {
  return _RouteArgumentsModel.fromJson(json);
}

/// @nodoc
mixin _$RouteArgumentsModel {
  String get projectId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RouteArgumentsModelCopyWith<RouteArgumentsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteArgumentsModelCopyWith<$Res> {
  factory $RouteArgumentsModelCopyWith(
          RouteArgumentsModel value, $Res Function(RouteArgumentsModel) then) =
      _$RouteArgumentsModelCopyWithImpl<$Res, RouteArgumentsModel>;
  @useResult
  $Res call({String projectId});
}

/// @nodoc
class _$RouteArgumentsModelCopyWithImpl<$Res, $Val extends RouteArgumentsModel>
    implements $RouteArgumentsModelCopyWith<$Res> {
  _$RouteArgumentsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = null,
  }) {
    return _then(_value.copyWith(
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RouteArgumentsModelImplCopyWith<$Res>
    implements $RouteArgumentsModelCopyWith<$Res> {
  factory _$$RouteArgumentsModelImplCopyWith(_$RouteArgumentsModelImpl value,
          $Res Function(_$RouteArgumentsModelImpl) then) =
      __$$RouteArgumentsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String projectId});
}

/// @nodoc
class __$$RouteArgumentsModelImplCopyWithImpl<$Res>
    extends _$RouteArgumentsModelCopyWithImpl<$Res, _$RouteArgumentsModelImpl>
    implements _$$RouteArgumentsModelImplCopyWith<$Res> {
  __$$RouteArgumentsModelImplCopyWithImpl(_$RouteArgumentsModelImpl _value,
      $Res Function(_$RouteArgumentsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = null,
  }) {
    return _then(_$RouteArgumentsModelImpl(
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$RouteArgumentsModelImpl extends _RouteArgumentsModel
    with DiagnosticableTreeMixin {
  const _$RouteArgumentsModelImpl({this.projectId = ''}) : super._();

  factory _$RouteArgumentsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RouteArgumentsModelImplFromJson(json);

  @override
  @JsonKey()
  final String projectId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RouteArgumentsModel(projectId: $projectId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RouteArgumentsModel'))
      ..add(DiagnosticsProperty('projectId', projectId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteArgumentsModelImpl &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, projectId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RouteArgumentsModelImplCopyWith<_$RouteArgumentsModelImpl> get copyWith =>
      __$$RouteArgumentsModelImplCopyWithImpl<_$RouteArgumentsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RouteArgumentsModelImplToJson(
      this,
    );
  }
}

abstract class _RouteArgumentsModel extends RouteArgumentsModel {
  const factory _RouteArgumentsModel({final String projectId}) =
      _$RouteArgumentsModelImpl;
  const _RouteArgumentsModel._() : super._();

  factory _RouteArgumentsModel.fromJson(Map<String, dynamic> json) =
      _$RouteArgumentsModelImpl.fromJson;

  @override
  String get projectId;
  @override
  @JsonKey(ignore: true)
  _$$RouteArgumentsModelImplCopyWith<_$RouteArgumentsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(fromJson: localeFromString, toJson: localeToString)
  Locale? get locale => throw _privateConstructorUsedError;
  ThemeMode get themeMode => throw _privateConstructorUsedError;
  UserSettingsModel get settings => throw _privateConstructorUsedError;
  bool get hasCompletedOnboarding => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(fromJson: localeFromString, toJson: localeToString)
      Locale? locale,
      ThemeMode themeMode,
      UserSettingsModel settings,
      bool hasCompletedOnboarding});

  $UserSettingsModelCopyWith<$Res> get settings;
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? locale = freezed,
    Object? themeMode = null,
    Object? settings = null,
    Object? hasCompletedOnboarding = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale?,
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
      settings: null == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as UserSettingsModel,
      hasCompletedOnboarding: null == hasCompletedOnboarding
          ? _value.hasCompletedOnboarding
          : hasCompletedOnboarding // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserSettingsModelCopyWith<$Res> get settings {
    return $UserSettingsModelCopyWith<$Res>(_value.settings, (value) {
      return _then(_value.copyWith(settings: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(fromJson: localeFromString, toJson: localeToString)
      Locale? locale,
      ThemeMode themeMode,
      UserSettingsModel settings,
      bool hasCompletedOnboarding});

  @override
  $UserSettingsModelCopyWith<$Res> get settings;
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? locale = freezed,
    Object? themeMode = null,
    Object? settings = null,
    Object? hasCompletedOnboarding = null,
  }) {
    return _then(_$UserModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale?,
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
      settings: null == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as UserSettingsModel,
      hasCompletedOnboarding: null == hasCompletedOnboarding
          ? _value.hasCompletedOnboarding
          : hasCompletedOnboarding // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$UserModelImpl extends _UserModel with DiagnosticableTreeMixin {
  const _$UserModelImpl(
      {this.id = '',
      @JsonKey(fromJson: localeFromString, toJson: localeToString) this.locale,
      this.themeMode = ThemeMode.system,
      this.settings = UserSettingsModel.initial,
      this.hasCompletedOnboarding = false})
      : super._();

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey(fromJson: localeFromString, toJson: localeToString)
  final Locale? locale;
  @override
  @JsonKey()
  final ThemeMode themeMode;
  @override
  @JsonKey()
  final UserSettingsModel settings;
  @override
  @JsonKey()
  final bool hasCompletedOnboarding;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserModel(id: $id, locale: $locale, themeMode: $themeMode, settings: $settings, hasCompletedOnboarding: $hasCompletedOnboarding)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('locale', locale))
      ..add(DiagnosticsProperty('themeMode', themeMode))
      ..add(DiagnosticsProperty('settings', settings))
      ..add(DiagnosticsProperty(
          'hasCompletedOnboarding', hasCompletedOnboarding));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode) &&
            (identical(other.settings, settings) ||
                other.settings == settings) &&
            (identical(other.hasCompletedOnboarding, hasCompletedOnboarding) ||
                other.hasCompletedOnboarding == hasCompletedOnboarding));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, locale, themeMode, settings, hasCompletedOnboarding);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel extends UserModel {
  const factory _UserModel(
      {final String id,
      @JsonKey(fromJson: localeFromString, toJson: localeToString)
      final Locale? locale,
      final ThemeMode themeMode,
      final UserSettingsModel settings,
      final bool hasCompletedOnboarding}) = _$UserModelImpl;
  const _UserModel._() : super._();

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(fromJson: localeFromString, toJson: localeToString)
  Locale? get locale;
  @override
  ThemeMode get themeMode;
  @override
  UserSettingsModel get settings;
  @override
  bool get hasCompletedOnboarding;
  @override
  @JsonKey(ignore: true)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserSettingsModel _$UserSettingsModelFromJson(Map<String, dynamic> json) {
  return _UserSettingsModel.fromJson(json);
}

/// @nodoc
mixin _$UserSettingsModel {
  @JsonKey(fromJson: _themeModeFromJson, toJson: _themeModeToJson)
  ThemeMode get themeMode => throw _privateConstructorUsedError;
  bool get isProjectsListReversed => throw _privateConstructorUsedError;
  int get charactersLimitForNewNotes => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _localeFromJson, toJson: _localeToJson)
  Locale? get locale => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserSettingsModelCopyWith<UserSettingsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSettingsModelCopyWith<$Res> {
  factory $UserSettingsModelCopyWith(
          UserSettingsModel value, $Res Function(UserSettingsModel) then) =
      _$UserSettingsModelCopyWithImpl<$Res, UserSettingsModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: _themeModeFromJson, toJson: _themeModeToJson)
      ThemeMode themeMode,
      bool isProjectsListReversed,
      int charactersLimitForNewNotes,
      @JsonKey(fromJson: _localeFromJson, toJson: _localeToJson)
      Locale? locale});
}

/// @nodoc
class _$UserSettingsModelCopyWithImpl<$Res, $Val extends UserSettingsModel>
    implements $UserSettingsModelCopyWith<$Res> {
  _$UserSettingsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeMode = null,
    Object? isProjectsListReversed = null,
    Object? charactersLimitForNewNotes = null,
    Object? locale = freezed,
  }) {
    return _then(_value.copyWith(
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
      isProjectsListReversed: null == isProjectsListReversed
          ? _value.isProjectsListReversed
          : isProjectsListReversed // ignore: cast_nullable_to_non_nullable
              as bool,
      charactersLimitForNewNotes: null == charactersLimitForNewNotes
          ? _value.charactersLimitForNewNotes
          : charactersLimitForNewNotes // ignore: cast_nullable_to_non_nullable
              as int,
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserSettingsModelImplCopyWith<$Res>
    implements $UserSettingsModelCopyWith<$Res> {
  factory _$$UserSettingsModelImplCopyWith(_$UserSettingsModelImpl value,
          $Res Function(_$UserSettingsModelImpl) then) =
      __$$UserSettingsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: _themeModeFromJson, toJson: _themeModeToJson)
      ThemeMode themeMode,
      bool isProjectsListReversed,
      int charactersLimitForNewNotes,
      @JsonKey(fromJson: _localeFromJson, toJson: _localeToJson)
      Locale? locale});
}

/// @nodoc
class __$$UserSettingsModelImplCopyWithImpl<$Res>
    extends _$UserSettingsModelCopyWithImpl<$Res, _$UserSettingsModelImpl>
    implements _$$UserSettingsModelImplCopyWith<$Res> {
  __$$UserSettingsModelImplCopyWithImpl(_$UserSettingsModelImpl _value,
      $Res Function(_$UserSettingsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeMode = null,
    Object? isProjectsListReversed = null,
    Object? charactersLimitForNewNotes = null,
    Object? locale = freezed,
  }) {
    return _then(_$UserSettingsModelImpl(
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
      isProjectsListReversed: null == isProjectsListReversed
          ? _value.isProjectsListReversed
          : isProjectsListReversed // ignore: cast_nullable_to_non_nullable
              as bool,
      charactersLimitForNewNotes: null == charactersLimitForNewNotes
          ? _value.charactersLimitForNewNotes
          : charactersLimitForNewNotes // ignore: cast_nullable_to_non_nullable
              as int,
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserSettingsModelImpl
    with DiagnosticableTreeMixin
    implements _UserSettingsModel {
  const _$UserSettingsModelImpl(
      {@JsonKey(fromJson: _themeModeFromJson, toJson: _themeModeToJson)
      this.themeMode = ThemeMode.system,
      this.isProjectsListReversed = true,
      this.charactersLimitForNewNotes = 0,
      @JsonKey(fromJson: _localeFromJson, toJson: _localeToJson) this.locale});

  factory _$UserSettingsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserSettingsModelImplFromJson(json);

  @override
  @JsonKey(fromJson: _themeModeFromJson, toJson: _themeModeToJson)
  final ThemeMode themeMode;
  @override
  @JsonKey()
  final bool isProjectsListReversed;
  @override
  @JsonKey()
  final int charactersLimitForNewNotes;
  @override
  @JsonKey(fromJson: _localeFromJson, toJson: _localeToJson)
  final Locale? locale;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserSettingsModel(themeMode: $themeMode, isProjectsListReversed: $isProjectsListReversed, charactersLimitForNewNotes: $charactersLimitForNewNotes, locale: $locale)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserSettingsModel'))
      ..add(DiagnosticsProperty('themeMode', themeMode))
      ..add(
          DiagnosticsProperty('isProjectsListReversed', isProjectsListReversed))
      ..add(DiagnosticsProperty(
          'charactersLimitForNewNotes', charactersLimitForNewNotes))
      ..add(DiagnosticsProperty('locale', locale));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserSettingsModelImpl &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode) &&
            (identical(other.isProjectsListReversed, isProjectsListReversed) ||
                other.isProjectsListReversed == isProjectsListReversed) &&
            (identical(other.charactersLimitForNewNotes,
                    charactersLimitForNewNotes) ||
                other.charactersLimitForNewNotes ==
                    charactersLimitForNewNotes) &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, themeMode,
      isProjectsListReversed, charactersLimitForNewNotes, locale);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserSettingsModelImplCopyWith<_$UserSettingsModelImpl> get copyWith =>
      __$$UserSettingsModelImplCopyWithImpl<_$UserSettingsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserSettingsModelImplToJson(
      this,
    );
  }
}

abstract class _UserSettingsModel implements UserSettingsModel {
  const factory _UserSettingsModel(
      {@JsonKey(fromJson: _themeModeFromJson, toJson: _themeModeToJson)
      final ThemeMode themeMode,
      final bool isProjectsListReversed,
      final int charactersLimitForNewNotes,
      @JsonKey(fromJson: _localeFromJson, toJson: _localeToJson)
      final Locale? locale}) = _$UserSettingsModelImpl;

  factory _UserSettingsModel.fromJson(Map<String, dynamic> json) =
      _$UserSettingsModelImpl.fromJson;

  @override
  @JsonKey(fromJson: _themeModeFromJson, toJson: _themeModeToJson)
  ThemeMode get themeMode;
  @override
  bool get isProjectsListReversed;
  @override
  int get charactersLimitForNewNotes;
  @override
  @JsonKey(fromJson: _localeFromJson, toJson: _localeToJson)
  Locale? get locale;
  @override
  @JsonKey(ignore: true)
  _$$UserSettingsModelImplCopyWith<_$UserSettingsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
