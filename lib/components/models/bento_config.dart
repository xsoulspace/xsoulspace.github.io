import 'package:from_json_to_json/from_json_to_json.dart';

import 'project_model.dart';

/// Represents responsive breakpoints for the bento grid layout.
extension type const ResponsiveBreakpoints(Map<String, dynamic> value) {
  factory ResponsiveBreakpoints.fromJson(final dynamic jsonData) {
    final map = jsonDecodeMap(jsonData);
    return ResponsiveBreakpoints(map);
  }

  Map<String, dynamic> toJson() => value;

  int get mobile => jsonDecodeInt(value['mobile']);
  int get tablet => jsonDecodeInt(value['tablet']);
  int get desktop => jsonDecodeInt(value['desktop']);
  int get large => jsonDecodeInt(value['large']);

  static const defaultBreakpoints = ResponsiveBreakpoints({
    'mobile': 768,
    'tablet': 1024,
    'desktop': 1280,
    'large': 1536,
  });

  static const empty = ResponsiveBreakpoints({});
}

/// Represents animation timing configurations for bento interactions.
extension type const AnimationTimings(Map<String, dynamic> value) {
  factory AnimationTimings.fromJson(final dynamic jsonData) {
    final map = jsonDecodeMap(jsonData);
    return AnimationTimings(map);
  }

  Map<String, dynamic> toJson() => value;

  int get microHoverMs => jsonDecodeInt(value['microHoverMs']);
  int get standardHoverMs => jsonDecodeInt(value['standardHoverMs']);
  int get expansionMs => jsonDecodeInt(value['expansionMs']);
  int get entranceStaggerMs => jsonDecodeInt(value['entranceStaggerMs']);
  int get dimmingMs => jsonDecodeInt(value['dimmingMs']);

  Duration get microHover => Duration(milliseconds: microHoverMs);
  Duration get standardHover => Duration(milliseconds: standardHoverMs);
  Duration get expansion => Duration(milliseconds: expansionMs);
  Duration get entranceStagger => Duration(milliseconds: entranceStaggerMs);
  Duration get dimming => Duration(milliseconds: dimmingMs);

  static const defaultTimings = AnimationTimings({
    'microHoverMs': 200,
    'standardHoverMs': 300,
    'expansionMs': 400,
    'entranceStaggerMs': 100,
    'dimmingMs': 250,
  });

  static const empty = AnimationTimings({});
}

/// Represents layout constraints for the bento grid system.
extension type const LayoutConstraints(Map<String, dynamic> value) {
  factory LayoutConstraints.fromJson(final dynamic jsonData) {
    final map = jsonDecodeMap(jsonData);
    return LayoutConstraints(map);
  }

  Map<String, dynamic> toJson() => value;

  int get minCardHeight => jsonDecodeInt(value['minCardHeight']);
  int get maxCardHeight => jsonDecodeInt(value['maxCardHeight']);
  int get gridGap => jsonDecodeInt(value['gridGap']);
  int get expandedMaxWidth => jsonDecodeInt(value['expandedMaxWidth']);
  int get expandedMaxHeight => jsonDecodeInt(value['expandedMaxHeight']);

  static const defaultConstraints = LayoutConstraints({
    'minCardHeight': 220,
    'maxCardHeight': 400,
    'gridGap': 32,
    'expandedMaxWidth': 800,
    'expandedMaxHeight': 600,
  });

  static const empty = LayoutConstraints({});
}

/// Represents grid configuration for different screen sizes.
extension type const GridConfiguration(Map<String, dynamic> value) {
  factory GridConfiguration.fromJson(final dynamic jsonData) {
    final map = jsonDecodeMap(jsonData);
    return GridConfiguration(map);
  }

  Map<String, dynamic> toJson() => value;

  int get columns => jsonDecodeInt(value['columns']);
  String get layout => jsonDecodeString(value['layout']);
  bool get allowMicroClusters => jsonDecodeBool(value['allowMicroClusters']);
  bool get allowExpansion => jsonDecodeBool(value['allowExpansion']);

  bool get isMobile => layout == 'mobile';
  bool get isTablet => layout == 'tablet';
  bool get isDesktop => layout == 'desktop';
  bool get isLarge => layout == 'large';

  static const mobile = GridConfiguration({
    'columns': 1,
    'layout': 'mobile',
    'allowMicroClusters': false,
    'allowExpansion': false,
  });

  static const tablet = GridConfiguration({
    'columns': 2,
    'layout': 'tablet',
    'allowMicroClusters': true,
    'allowExpansion': true,
  });

  static const desktop = GridConfiguration({
    'columns': 3,
    'layout': 'desktop',
    'allowMicroClusters': true,
    'allowExpansion': true,
  });

  static const large = GridConfiguration({
    'columns': 4,
    'layout': 'large',
    'allowMicroClusters': true,
    'allowExpansion': true,
  });

  static const empty = GridConfiguration({});
}

/// Animation states for bento expansion transitions
enum ExpansionAnimationState { expanding, expanded, collapsing }

/// Position information for smooth bento transitions
class BentoPosition {
  const BentoPosition({
    required this.x,
    required this.y,
    required this.width,
    required this.height,
  });

  final double x;
  final double y;
  final double width;
  final double height;

  /// Create position from DOM element bounds
  factory BentoPosition.fromBounds(Map<String, dynamic> bounds) {
    return BentoPosition(
      x: (bounds['x'] as num?)?.toDouble() ?? 0,
      y: (bounds['y'] as num?)?.toDouble() ?? 0,
      width: (bounds['width'] as num?)?.toDouble() ?? 0,
      height: (bounds['height'] as num?)?.toDouble() ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    'x': x,
    'y': y,
    'width': width,
    'height': height,
  };
}

/// Enhanced expansion configuration for smooth transitions
extension type const ExpansionConfig(Map<String, dynamic> value) {
  factory ExpansionConfig.fromJson(final dynamic jsonData) {
    final map = jsonDecodeMap(jsonData);
    return ExpansionConfig(map);
  }

  Map<String, dynamic> toJson() => value;

  bool get enableOverlayMode => jsonDecodeBool(value['enableOverlayMode']);
  bool get enableInPlaceExpansion =>
      jsonDecodeBool(value['enableInPlaceExpansion']);
  bool get enablePositionTracking =>
      jsonDecodeBool(value['enablePositionTracking']);
  int get expansionDurationMs => jsonDecodeInt(value['expansionDurationMs']);
  int get collapseDurationMs => jsonDecodeInt(value['collapseDurationMs']);
  double get overlayBackdropOpacity =>
      jsonDecodeDouble(value['overlayBackdropOpacity']);
  String get expansionEasing => jsonDecodeString(value['expansionEasing']);

  Duration get expansionDuration => Duration(milliseconds: expansionDurationMs);
  Duration get collapseDuration => Duration(milliseconds: collapseDurationMs);

  static const defaultConfig = ExpansionConfig({
    'enableOverlayMode': true,
    'enableInPlaceExpansion': true,
    'enablePositionTracking': true,
    'expansionDurationMs': 500,
    'collapseDurationMs': 400,
    'overlayBackdropOpacity': 0.8,
    'expansionEasing': 'cubic-bezier(0.25, 0.46, 0.45, 0.94)',
  });

  static const empty = ExpansionConfig({});
}

/// Main configuration model for the dynamic bento layout system.
extension type const BentoConfig(Map<String, dynamic> value) {
  factory BentoConfig.fromJson(final dynamic jsonData) {
    final map = jsonDecodeMap(jsonData);
    return BentoConfig(map);
  }

  Map<String, dynamic> toJson() => value;

  Map<String, String> get defaultSizes =>
      jsonDecodeMapAs<String, String>(value['defaultSizes']);
  ResponsiveBreakpoints get breakpoints =>
      ResponsiveBreakpoints.fromJson(value['breakpoints']);
  AnimationTimings get timings => AnimationTimings.fromJson(value['timings']);
  LayoutConstraints get constraints =>
      LayoutConstraints.fromJson(value['constraints']);
  bool get enableAnimations => jsonDecodeBool(value['enableAnimations']);
  bool get enableHoverEffects => jsonDecodeBool(value['enableHoverEffects']);
  bool get enableExpansion => jsonDecodeBool(value['enableExpansion']);

  /// Get the default project size for a given project type
  ProjectSize getDefaultSizeForType(String projectType) {
    final sizeString = defaultSizes[projectType.toLowerCase()] ?? 'standard';
    return ProjectSize(sizeString);
  }

  /// Get grid configuration based on screen width
  GridConfiguration getGridConfigForWidth(double width) {
    if (width < breakpoints.mobile) {
      return GridConfiguration.mobile;
    } else if (width < breakpoints.tablet) {
      return GridConfiguration.tablet;
    } else if (width < breakpoints.desktop) {
      return GridConfiguration.desktop;
    } else {
      return GridConfiguration.large;
    }
  }

  static const defaultConfig = BentoConfig({
    'defaultSizes': {
      'package': 'micro',
      'app': 'standard',
      'game': 'featured',
      'utility': 'micro',
      'bot': 'standard',
      'web add-in': 'standard',
    },
    'breakpoints': {
      'mobile': 768,
      'tablet': 1024,
      'desktop': 1280,
      'large': 1536,
    },
    'timings': {
      'microHoverMs': 200,
      'standardHoverMs': 300,
      'expansionMs': 400,
      'entranceStaggerMs': 100,
      'dimmingMs': 250,
    },
    'constraints': {
      'minCardHeight': 220,
      'maxCardHeight': 400,
      'gridGap': 32,
      'expandedMaxWidth': 800,
      'expandedMaxHeight': 600,
    },
    'enableAnimations': true,
    'enableHoverEffects': true,
    'enableExpansion': true,
  });

  static const empty = BentoConfig({});
}
