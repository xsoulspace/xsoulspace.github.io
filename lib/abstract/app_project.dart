// ignore_for_file: hash_and_equals

part of abstract;

@immutable
@JsonSerializable(explicitToJson: true, createToJson: false)
class Project with EquatableMixin {
  const Project({
    required final this.id,
    required final this.name,
    required final this.description,
    required final this.projectStatus,
    required final this.projectType,
    required final this.links,
    final this.assets,
  });

  @JsonKey(fromJson: idFromJson)
  final String id;

  static String idFromJson(final String? id) => id ?? uuid.v4();
  final String name;
  final String description;
  final ProjectStatuses projectStatus;
  final ProjectTypes projectType;
  final Links links;
  final ProjectAssetsPaths? assets;

  @override
  @JsonKey(ignore: true)
  List<Object?> get props => [id];

  @override
  @JsonKey(ignore: true)
  bool? get stringify => true;

  @override
  @JsonKey(ignore: true)
  int get hashCode => super.hashCode;

  static Project fromJson(final Map<String, dynamic> json) =>
      _$ProjectFromJson(json);
}

@immutable
@JsonSerializable(explicitToJson: true, createToJson: false)
class Links {
  const Links({
    required final this.githubLink,
    required final this.snapstoreLink,
    required final this.googlePlayLink,
    required final this.appleStoreLink,
    required final this.liveSiteLink,
  });

  final String githubLink;
  final String snapstoreLink;
  final String googlePlayLink;
  final String appleStoreLink;
  final String liveSiteLink;

  static Links fromJson(final Map<String, dynamic> json) =>
      _$LinksFromJson(json);
}

@immutable
@JsonSerializable(explicitToJson: true, createToJson: false)
class ProjectAssetsPaths {
  const ProjectAssetsPaths({
    required final this.cardPreview,
    required final this.images,
  });
  final String cardPreview;
  final List<String> images;
  static ProjectAssetsPaths fromJson(final Map<String, dynamic> json) =>
      _$ProjectAssetsPathsFromJson(json);
}