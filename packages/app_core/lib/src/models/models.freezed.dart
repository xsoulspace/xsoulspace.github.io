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
abstract class _$$SuccessfulDataResponseCopyWith<T, $Res> {
  factory _$$SuccessfulDataResponseCopyWith(_$SuccessfulDataResponse<T> value,
          $Res Function(_$SuccessfulDataResponse<T>) then) =
      __$$SuccessfulDataResponseCopyWithImpl<T, $Res>;
  @useResult
  $Res call({@JsonKey(name: 'data') T data});
}

/// @nodoc
class __$$SuccessfulDataResponseCopyWithImpl<T, $Res>
    extends _$ApiResponseCopyWithImpl<T, $Res, _$SuccessfulDataResponse<T>>
    implements _$$SuccessfulDataResponseCopyWith<T, $Res> {
  __$$SuccessfulDataResponseCopyWithImpl(_$SuccessfulDataResponse<T> _value,
      $Res Function(_$SuccessfulDataResponse<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$SuccessfulDataResponse<T>(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, genericArgumentFactories: true)
class _$SuccessfulDataResponse<T>
    with DiagnosticableTreeMixin
    implements SuccessfulDataResponse<T> {
  const _$SuccessfulDataResponse(
      {@JsonKey(name: 'data') required this.data, final String? $type})
      : $type = $type ?? 'SuccessfulDataResponse';

  factory _$SuccessfulDataResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$SuccessfulDataResponseFromJson(json, fromJsonT);

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
            other is _$SuccessfulDataResponse<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessfulDataResponseCopyWith<T, _$SuccessfulDataResponse<T>>
      get copyWith => __$$SuccessfulDataResponseCopyWithImpl<T,
          _$SuccessfulDataResponse<T>>(this, _$identity);

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
    return _$$SuccessfulDataResponseToJson<T>(this, toJsonT);
  }
}

abstract class SuccessfulDataResponse<T> implements ApiResponse<T> {
  const factory SuccessfulDataResponse(
          {@JsonKey(name: 'data') required final T data}) =
      _$SuccessfulDataResponse<T>;

  factory SuccessfulDataResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$SuccessfulDataResponse<T>.fromJson;

  @JsonKey(name: 'data')
  T get data;
  @JsonKey(ignore: true)
  _$$SuccessfulDataResponseCopyWith<T, _$SuccessfulDataResponse<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessfulVoidResponseCopyWith<T, $Res> {
  factory _$$SuccessfulVoidResponseCopyWith(_$SuccessfulVoidResponse<T> value,
          $Res Function(_$SuccessfulVoidResponse<T>) then) =
      __$$SuccessfulVoidResponseCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$SuccessfulVoidResponseCopyWithImpl<T, $Res>
    extends _$ApiResponseCopyWithImpl<T, $Res, _$SuccessfulVoidResponse<T>>
    implements _$$SuccessfulVoidResponseCopyWith<T, $Res> {
  __$$SuccessfulVoidResponseCopyWithImpl(_$SuccessfulVoidResponse<T> _value,
      $Res Function(_$SuccessfulVoidResponse<T>) _then)
      : super(_value, _then);
}

/// @nodoc

@JsonSerializable(explicitToJson: true, genericArgumentFactories: true)
class _$SuccessfulVoidResponse<T>
    with DiagnosticableTreeMixin
    implements SuccessfulVoidResponse<T> {
  const _$SuccessfulVoidResponse({final String? $type})
      : $type = $type ?? 'SuccessfulVoidResponse';

  factory _$SuccessfulVoidResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$SuccessfulVoidResponseFromJson(json, fromJsonT);

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
            other is _$SuccessfulVoidResponse<T>);
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
    return _$$SuccessfulVoidResponseToJson<T>(this, toJsonT);
  }
}

abstract class SuccessfulVoidResponse<T> implements ApiResponse<T> {
  const factory SuccessfulVoidResponse() = _$SuccessfulVoidResponse<T>;

  factory SuccessfulVoidResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$SuccessfulVoidResponse<T>.fromJson;
}

/// @nodoc
abstract class _$$BadResponseCopyWith<T, $Res> {
  factory _$$BadResponseCopyWith(
          _$BadResponse<T> value, $Res Function(_$BadResponse<T>) then) =
      __$$BadResponseCopyWithImpl<T, $Res>;
  @useResult
  $Res call({@JsonKey(name: 'errors') List<ResponseErrorDescription> errors});
}

/// @nodoc
class __$$BadResponseCopyWithImpl<T, $Res>
    extends _$ApiResponseCopyWithImpl<T, $Res, _$BadResponse<T>>
    implements _$$BadResponseCopyWith<T, $Res> {
  __$$BadResponseCopyWithImpl(
      _$BadResponse<T> _value, $Res Function(_$BadResponse<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errors = null,
  }) {
    return _then(_$BadResponse<T>(
      errors: null == errors
          ? _value._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<ResponseErrorDescription>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, genericArgumentFactories: true)
class _$BadResponse<T> with DiagnosticableTreeMixin implements BadResponse<T> {
  const _$BadResponse(
      {@JsonKey(name: 'errors')
          final List<ResponseErrorDescription> errors = const [],
      final String? $type})
      : _errors = errors,
        $type = $type ?? 'BadResponse';

  factory _$BadResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$BadResponseFromJson(json, fromJsonT);

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
            other is _$BadResponse<T> &&
            const DeepCollectionEquality().equals(other._errors, _errors));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_errors));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BadResponseCopyWith<T, _$BadResponse<T>> get copyWith =>
      __$$BadResponseCopyWithImpl<T, _$BadResponse<T>>(this, _$identity);

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
    return _$$BadResponseToJson<T>(this, toJsonT);
  }
}

abstract class BadResponse<T> implements ApiResponse<T> {
  const factory BadResponse(
      {@JsonKey(name: 'errors')
          final List<ResponseErrorDescription> errors}) = _$BadResponse<T>;

  factory BadResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$BadResponse<T>.fromJson;

  @JsonKey(name: 'errors')
  List<ResponseErrorDescription> get errors;
  @JsonKey(ignore: true)
  _$$BadResponseCopyWith<T, _$BadResponse<T>> get copyWith =>
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
abstract class _$$_ResponseErrorDescriptionCopyWith<$Res>
    implements $ResponseErrorDescriptionCopyWith<$Res> {
  factory _$$_ResponseErrorDescriptionCopyWith(
          _$_ResponseErrorDescription value,
          $Res Function(_$_ResponseErrorDescription) then) =
      __$$_ResponseErrorDescriptionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String code, String id, String message, String? detail, String? status});
}

/// @nodoc
class __$$_ResponseErrorDescriptionCopyWithImpl<$Res>
    extends _$ResponseErrorDescriptionCopyWithImpl<$Res,
        _$_ResponseErrorDescription>
    implements _$$_ResponseErrorDescriptionCopyWith<$Res> {
  __$$_ResponseErrorDescriptionCopyWithImpl(_$_ResponseErrorDescription _value,
      $Res Function(_$_ResponseErrorDescription) _then)
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
    return _then(_$_ResponseErrorDescription(
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
class _$_ResponseErrorDescription extends _ResponseErrorDescription
    with DiagnosticableTreeMixin {
  const _$_ResponseErrorDescription(
      {required this.code,
      required this.id,
      required this.message,
      this.detail,
      this.status})
      : super._();

  factory _$_ResponseErrorDescription.fromJson(Map<String, dynamic> json) =>
      _$$_ResponseErrorDescriptionFromJson(json);

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
            other is _$_ResponseErrorDescription &&
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
  _$$_ResponseErrorDescriptionCopyWith<_$_ResponseErrorDescription>
      get copyWith => __$$_ResponseErrorDescriptionCopyWithImpl<
          _$_ResponseErrorDescription>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ResponseErrorDescriptionToJson(
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
      final String? status}) = _$_ResponseErrorDescription;
  const _ResponseErrorDescription._() : super._();

  factory _ResponseErrorDescription.fromJson(Map<String, dynamic> json) =
      _$_ResponseErrorDescription.fromJson;

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
  _$$_ResponseErrorDescriptionCopyWith<_$_ResponseErrorDescription>
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
  List<String> get mediaLinks => throw _privateConstructorUsedError;

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
      List<String> mediaLinks});

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
    Object? mediaLinks = null,
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
      mediaLinks: null == mediaLinks
          ? _value.mediaLinks
          : mediaLinks // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
abstract class _$$_ProjectModelCopyWith<$Res>
    implements $ProjectModelCopyWith<$Res> {
  factory _$$_ProjectModelCopyWith(
          _$_ProjectModel value, $Res Function(_$_ProjectModel) then) =
      __$$_ProjectModelCopyWithImpl<$Res>;
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
      List<String> mediaLinks});

  @override
  $UsageOptionsModelCopyWith<$Res> get usageOptions;
}

/// @nodoc
class __$$_ProjectModelCopyWithImpl<$Res>
    extends _$ProjectModelCopyWithImpl<$Res, _$_ProjectModel>
    implements _$$_ProjectModelCopyWith<$Res> {
  __$$_ProjectModelCopyWithImpl(
      _$_ProjectModel _value, $Res Function(_$_ProjectModel) _then)
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
    Object? mediaLinks = null,
  }) {
    return _then(_$_ProjectModel(
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
      mediaLinks: null == mediaLinks
          ? _value._mediaLinks
          : mediaLinks // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_ProjectModel extends _ProjectModel with DiagnosticableTreeMixin {
  const _$_ProjectModel(
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
      final List<String> mediaLinks = const []})
      : _tags = tags,
        _mediaLinks = mediaLinks,
        super._();

  factory _$_ProjectModel.fromJson(Map<String, dynamic> json) =>
      _$$_ProjectModelFromJson(json);

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
  final List<String> _mediaLinks;
// provide url for every path
  @override
  @JsonKey()
  List<String> get mediaLinks {
    if (_mediaLinks is EqualUnmodifiableListView) return _mediaLinks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mediaLinks);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProjectModel(id: $id, title: $title, subtitle: $subtitle, shortDescription: $shortDescription, status: $status, type: $type, releasedAt: $releasedAt, usageOptions: $usageOptions, completedAt: $completedAt, tags: $tags, mediaLinks: $mediaLinks)';
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
      ..add(DiagnosticsProperty('mediaLinks', mediaLinks));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProjectModel &&
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
                .equals(other._mediaLinks, _mediaLinks));
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
      const DeepCollectionEquality().hash(_mediaLinks));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProjectModelCopyWith<_$_ProjectModel> get copyWith =>
      __$$_ProjectModelCopyWithImpl<_$_ProjectModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProjectModelToJson(
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
      final List<String> mediaLinks}) = _$_ProjectModel;
  const _ProjectModel._() : super._();

  factory _ProjectModel.fromJson(Map<String, dynamic> json) =
      _$_ProjectModel.fromJson;

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
  List<String> get mediaLinks;
  @override
  @JsonKey(ignore: true)
  _$$_ProjectModelCopyWith<_$_ProjectModel> get copyWith =>
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
abstract class _$$_UsageOptionsModelCopyWith<$Res>
    implements $UsageOptionsModelCopyWith<$Res> {
  factory _$$_UsageOptionsModelCopyWith(_$_UsageOptionsModel value,
          $Res Function(_$_UsageOptionsModel) then) =
      __$$_UsageOptionsModelCopyWithImpl<$Res>;
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
class __$$_UsageOptionsModelCopyWithImpl<$Res>
    extends _$UsageOptionsModelCopyWithImpl<$Res, _$_UsageOptionsModel>
    implements _$$_UsageOptionsModelCopyWith<$Res> {
  __$$_UsageOptionsModelCopyWithImpl(
      _$_UsageOptionsModel _value, $Res Function(_$_UsageOptionsModel) _then)
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
    return _then(_$_UsageOptionsModel(
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
class _$_UsageOptionsModel extends _UsageOptionsModel
    with DiagnosticableTreeMixin {
  const _$_UsageOptionsModel(
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

  factory _$_UsageOptionsModel.fromJson(Map<String, dynamic> json) =>
      _$$_UsageOptionsModelFromJson(json);

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
            other is _$_UsageOptionsModel &&
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
  _$$_UsageOptionsModelCopyWith<_$_UsageOptionsModel> get copyWith =>
      __$$_UsageOptionsModelCopyWithImpl<_$_UsageOptionsModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UsageOptionsModelToJson(
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
      final String yandexGamesLink}) = _$_UsageOptionsModel;
  const _UsageOptionsModel._() : super._();

  factory _UsageOptionsModel.fromJson(Map<String, dynamic> json) =
      _$_UsageOptionsModel.fromJson;

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
  _$$_UsageOptionsModelCopyWith<_$_UsageOptionsModel> get copyWith =>
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
      ThemeMode themeMode});
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$$_UserModelCopyWith(
          _$_UserModel value, $Res Function(_$_UserModel) then) =
      __$$_UserModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(fromJson: localeFromString, toJson: localeToString)
          Locale? locale,
      ThemeMode themeMode});
}

/// @nodoc
class __$$_UserModelCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$_UserModel>
    implements _$$_UserModelCopyWith<$Res> {
  __$$_UserModelCopyWithImpl(
      _$_UserModel _value, $Res Function(_$_UserModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? locale = freezed,
    Object? themeMode = null,
  }) {
    return _then(_$_UserModel(
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
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_UserModel extends _UserModel with DiagnosticableTreeMixin {
  const _$_UserModel(
      {this.id = '',
      @JsonKey(fromJson: localeFromString, toJson: localeToString) this.locale,
      this.themeMode = ThemeMode.system})
      : super._();

  factory _$_UserModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserModelFromJson(json);

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
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserModel(id: $id, locale: $locale, themeMode: $themeMode)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('locale', locale))
      ..add(DiagnosticsProperty('themeMode', themeMode));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, locale, themeMode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      __$$_UserModelCopyWithImpl<_$_UserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserModelToJson(
      this,
    );
  }
}

abstract class _UserModel extends UserModel {
  const factory _UserModel(
      {final String id,
      @JsonKey(fromJson: localeFromString, toJson: localeToString)
          final Locale? locale,
      final ThemeMode themeMode}) = _$_UserModel;
  const _UserModel._() : super._();

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$_UserModel.fromJson;

  @override
  String get id;
  @override
  @JsonKey(fromJson: localeFromString, toJson: localeToString)
  Locale? get locale;
  @override
  ThemeMode get themeMode;
  @override
  @JsonKey(ignore: true)
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}
