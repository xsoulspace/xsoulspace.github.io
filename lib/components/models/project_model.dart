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

/// Represents the preferred size for a project in the bento layout.
extension type const ProjectSize(String value) {
  factory ProjectSize.fromJson(final dynamic value) =>
      ProjectSize(jsonDecodeString(value));

  String toJson() => value;

  bool get isMicro => value == 'micro';
  bool get isStandard => value == 'standard';
  bool get isFeatured => value == 'featured';

  static const micro = ProjectSize('micro');
  static const standard = ProjectSize('standard');
  static const featured = ProjectSize('featured');
  static const empty = ProjectSize('');
}

/// Represents the type of preview content available for a project.
extension type const PreviewType(String value) {
  factory PreviewType.fromJson(final dynamic value) =>
      PreviewType(jsonDecodeString(value));

  String toJson() => value;

  bool get isImage => value == 'image';
  bool get isGif => value == 'gif';
  bool get isVideo => value == 'video';
  bool get isInteractive => value == 'interactive';

  static const image = PreviewType('image');
  static const gif = PreviewType('gif');
  static const video = PreviewType('video');
  static const interactive = PreviewType('interactive');
  static const empty = PreviewType('');
}

/// Represents preview content for a project with different media types.
extension type const PreviewContent(Map<String, dynamic> value) {
  factory PreviewContent.fromJson(final dynamic jsonData) {
    final map = jsonDecodeMap(jsonData);
    return PreviewContent(map);
  }

  Map<String, dynamic> toJson() => value;

  String get thumbnailUrl => jsonDecodeString(value['thumbnailUrl']);
  String get gifUrl => jsonDecodeString(value['gifUrl']);
  String get videoUrl => jsonDecodeString(value['videoUrl']);
  PreviewType get type => PreviewType.fromJson(value['type']);

  bool get hasThumbnail => thumbnailUrl.isNotEmpty;
  bool get hasGif => gifUrl.isNotEmpty;
  bool get hasVideo => videoUrl.isNotEmpty;

  static const empty = PreviewContent({});
}

/// Represents metrics and statistics for a project.
extension type const ProjectMetrics(Map<String, dynamic> value) {
  factory ProjectMetrics.fromJson(final dynamic jsonData) {
    final map = jsonDecodeMap(jsonData);
    return ProjectMetrics(map);
  }

  Map<String, dynamic> toJson() => value;

  int get downloads => jsonDecodeInt(value['downloads']);
  int get stars => jsonDecodeInt(value['stars']);
  int get forks => jsonDecodeInt(value['forks']);
  int get issues => jsonDecodeInt(value['issues']);
  DateTime? get lastActivity =>
      dateTimeFromIso8601String(jsonDecodeString(value['lastActivity']));

  bool get hasMetrics => downloads > 0 || stars > 0 || forks > 0;

  static const empty = ProjectMetrics({});
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
  String get demoUrl => jsonDecodeString(value['demoUrl']);
  String get livePreviewUrl => jsonDecodeString(value['livePreviewUrl']);

  bool get hasDemo => demoUrl.isNotEmpty;
  bool get hasLivePreview => livePreviewUrl.isNotEmpty;

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

  // New dynamic bento fields
  ProjectSize get preferredSize => ProjectSize.fromJson(value['preferredSize']);
  PreviewContent get previewContent =>
      PreviewContent.fromJson(value['previewContent']);
  List<String> get screenshots =>
      jsonDecodeListAs<String>(value['screenshots']);
  bool get hasInteractiveDemo => jsonDecodeBool(value['hasInteractiveDemo']);
  ProjectMetrics get metrics => ProjectMetrics.fromJson(value['metrics']);

  // Computed properties for bento layout
  bool get isLibrary => type.toLowerCase() == 'package';
  bool get isApp => type.toLowerCase() == 'app';
  bool get isGame => type.toLowerCase() == 'game';
  bool get hasPreviewContent =>
      previewContent.hasThumbnail ||
      previewContent.hasGif ||
      previewContent.hasVideo;

  static const empty = ProjectModel({});
}
