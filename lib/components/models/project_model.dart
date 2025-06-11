import 'package:from_json_to_json/from_json_to_json.dart';

/// A unique identifier for a project.
extension type const ProjectId(String value) {
  factory ProjectId.fromJson(final dynamic value) =>
      ProjectId(jsonDecodeString(value));

  String toJson() => value;

  bool get isEmpty => value.isEmpty;
  bool get isNotEmpty => value.isNotEmpty;

  static const empty = ProjectId('');
}

/// Represents the set of links associated with a project.
extension type const ProjectLinksModel(Map<String, dynamic> value) {
  factory ProjectLinksModel.fromJson(final dynamic jsonData) {
    final map = jsonDecodeMap(jsonData);
    return ProjectLinksModel(map);
  }

  Map<String, dynamic> toJson() => value;

  String get website => jsonDecodeString(value['website']);
  String get telegram => jsonDecodeString(value['telegram']);
  String get appStore => jsonDecodeString(value['app_store']);
  String get googlePlay => jsonDecodeString(value['google_play']);
  String get pubDev => jsonDecodeString(value['pub.dev']);

  static const empty = ProjectLinksModel({});
}

/// The core data model for a project showcase item.
extension type const ProjectModel(Map<String, dynamic> value) {
  factory ProjectModel.fromJson(final dynamic jsonData) {
    final map = jsonDecodeMap(jsonData);
    return ProjectModel(map);
  }

  Map<String, dynamic> toJson() => value;

  ProjectId get id => ProjectId.fromJson(value['id']);
  String get title => jsonDecodeString(value['title']);
  String get type => jsonDecodeString(value['type']);
  String get repository => jsonDecodeString(value['repository']);
  String get description => jsonDecodeString(value['description']);
  List<String> get tags => jsonDecodeListAs<String>(value['tags']);
  ProjectLinksModel get links => ProjectLinksModel.fromJson(value['links']);
  List<String> get languages => jsonDecodeListAs<String>(value['languages']);
  String get coverImage => jsonDecodeString(value['coverImage']);
  List<String> get contributors =>
      jsonDecodeListAs<String>(value['contributors']);
  bool get hasPrivacy => jsonDecodeBool(value['hasPrivacy']);
  bool get hasTerms => jsonDecodeBool(value['hasTerms']);
  bool get hasLicense => jsonDecodeBool(value['hasLicense']);

  static const empty = ProjectModel({});
}
