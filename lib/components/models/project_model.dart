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

/// Project types matching exactly what's in projects.yaml
extension type const ProjectType(String value) {
  factory ProjectType.fromJson(final dynamic value) =>
      ProjectType(jsonDecodeString(value));

  String toJson() => value;

  bool get isConcept => value == 'Concept';
  bool get isGame => value == 'Game';
  bool get isApp => value == 'App';
  bool get isBot => value == 'Bot';
  bool get isPackage => value == 'Package';
  bool get isUtility => value == 'Utility';
  bool get isAccent => value == 'Accent';
  bool get isWebAddin => value == 'Web Add-in';
  bool get isValue => value == 'Value';

  static const concept = ProjectType('Concept');
  static const game = ProjectType('Game');
  static const app = ProjectType('App');
  static const bot = ProjectType('Bot');
  static const package = ProjectType('Package');
  static const utility = ProjectType('Utility');
  static const accent = ProjectType('Accent');
  static const webAddin = ProjectType('Web Add-in');
  static const valueType = ProjectType('Value');
}

/// Controls visual prominence and layout positioning priority
extension type const ProjectPriority(int value) {
  factory ProjectPriority.fromJson(final dynamic value) =>
      ProjectPriority(jsonDecodeInt(value));

  int toJson() => value;

  bool get isBackground => value == 1; // Less prominent positioning
  bool get isStandard => value == 2; // Normal prominence
  bool get isFeatured => value == 3; // Better positioning
  bool get isHero => value == 4; // Prime real estate

  static const background = ProjectPriority(1);
  static const standard = ProjectPriority(2);
  static const featured = ProjectPriority(3);
  static const hero = ProjectPriority(4);
}

/// Defines what content should be emphasized within a project block
extension type const ContentEmphasis(String value) {
  factory ContentEmphasis.fromJson(final dynamic value) =>
      ContentEmphasis(jsonDecodeString(value));

  String toJson() => value;

  bool get emphasizeImage => value == 'image';
  bool get emphasizeText => value == 'text';
  bool get emphasizeMetrics => value == 'metrics';
  bool get emphasizeInteractive => value == 'interactive';

  static const image = ContentEmphasis('image');
  static const text = ContentEmphasis('text');
  static const metrics = ContentEmphasis('metrics');
  static const interactive = ContentEmphasis('interactive');
  static const balanced = ContentEmphasis('balanced');
}

/// Device-specific layout preferences
extension type const ResponsiveLayout(Map<String, dynamic> value) {
  factory ResponsiveLayout.fromJson(final dynamic jsonData) {
    final map = jsonDecodeMap(jsonData);
    return ResponsiveLayout(map);
  }

  Map<String, dynamic> toJson() => value;

  int get mobileColSpan =>
      jsonDecodeInt(value['mobile']?['colSpan']) ?? colSpan;
  int get mobileRowSpan =>
      jsonDecodeInt(value['mobile']?['rowSpan']) ?? rowSpan;

  int get tabletColSpan =>
      jsonDecodeInt(value['tablet']?['colSpan']) ?? colSpan;
  int get tabletRowSpan =>
      jsonDecodeInt(value['tablet']?['rowSpan']) ?? rowSpan;

  int get desktopColSpan =>
      jsonDecodeInt(value['desktop']?['colSpan']) ?? colSpan;
  int get desktopRowSpan =>
      jsonDecodeInt(value['desktop']?['rowSpan']) ?? rowSpan;

  // Fallback to main span values if responsive not defined
  int get colSpan => jsonDecodeInt(value['colSpan']) ?? 1;
  int get rowSpan => jsonDecodeInt(value['rowSpan']) ?? 1;

  static const empty = ResponsiveLayout({});
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

  // Core properties
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

  // Enhanced layout properties
  ProjectType get projectType => ProjectType.fromJson(value['type']);
  ProjectPriority get priority =>
      ProjectPriority.fromJson(value['priority'] ?? 2);
  ContentEmphasis get contentEmphasis =>
      ContentEmphasis.fromJson(value['contentEmphasis'] ?? 'balanced');
  ResponsiveLayout get responsiveLayout =>
      ResponsiveLayout.fromJson(value['responsiveLayout']);

  // Grid layout properties
  int get rowSpan => jsonDecodeInt(value['rowSpan']) ?? 1;
  int get colSpan => jsonDecodeInt(value['colSpan']) ?? 1;

  // Enhanced grid constraints
  int get minColSpan => jsonDecodeInt(value['minColSpan']) ?? 1;
  int get maxColSpan => jsonDecodeInt(value['maxColSpan']) ?? 64;
  int get minRowSpan => jsonDecodeInt(value['minRowSpan']) ?? 1;
  int get maxRowSpan => jsonDecodeInt(value['maxRowSpan']) ?? 8;
  bool get allowSizeVariation =>
      jsonDecodeBool(value['allowSizeVariation']) ?? true;

  // Preview and content properties
  PreviewContent get previewContent =>
      PreviewContent.fromJson(value['previewContent']);
  List<String> get screenshots =>
      jsonDecodeListAs<String>(value['screenshots']);
  bool get hasInteractiveDemo => jsonDecodeBool(value['hasInteractiveDemo']);
  ProjectMetrics get metrics => ProjectMetrics.fromJson(value['metrics']);

  // Updated computed properties using new ProjectType
  bool get isLibrary => projectType.isPackage;
  bool get isApp => projectType.isApp;
  bool get isGame => projectType.isGame;
  bool get isConcept => projectType.isConcept;
  bool get isAccent => projectType.isAccent;
  bool get isUtility => projectType.isUtility;

  bool get hasPreviewContent =>
      previewContent.hasThumbnail ||
      previewContent.hasGif ||
      previewContent.hasVideo;

  static const empty = ProjectModel({});
}
