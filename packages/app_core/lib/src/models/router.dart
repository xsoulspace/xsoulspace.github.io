// ignore_for_file: invalid_annotation_target

part of 'models.dart';

@immutable
@Freezed(
  fromJson: true,
  toJson: true,
  equal: true,
  addImplicitFinal: true,
  copyWith: true,
)
class RouteArgumentsModel with _$RouteArgumentsModel {
  @JsonSerializable(
    explicitToJson: true,
  )
  const factory RouteArgumentsModel({
    @Default('') final String projectId,
  }) = _RouteArgumentsModel;

  const RouteArgumentsModel._();

  factory RouteArgumentsModel.fromJson(final dynamic json) =>
      _$RouteArgumentsModelFromJson(json as Map<String, dynamic>);
  factory RouteArgumentsModel.fromFirestore(
    final DocumentSnapshot<Map<String, dynamic>> snapshot,
    // ignore: avoid_unused_constructor_parameters
    final SnapshotOptions? options,
  ) {
    final json = snapshot.data();
    return RouteArgumentsModel.fromJson(json);
  }

  static Map<String, Object?> toFirestore(
    final RouteArgumentsModel value,
    final SetOptions? options,
  ) {
    return value.toJson();
  }
}
