/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsBadgesGen {
  const $AssetsBadgesGen();

  /// File path: assets/badges/apple_store.svg
  SvgGenImage get appleStore =>
      const SvgGenImage('assets/badges/apple_store.svg');

  /// File path: assets/badges/google_play.png
  AssetGenImage get googlePlay =>
      const AssetGenImage('assets/badges/google_play.png');

  /// File path: assets/badges/snapstore.svg
  SvgGenImage get snapstore => const SvgGenImage('assets/badges/snapstore.svg');

  /// List of all assets
  List<dynamic> get values => [appleStore, googlePlay, snapstore];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/discord_logo_black.svg
  SvgGenImage get discordLogoBlack =>
      const SvgGenImage('assets/icons/discord_logo_black.svg');

  /// File path: assets/icons/discord_logo_white.svg
  SvgGenImage get discordLogoWhite =>
      const SvgGenImage('assets/icons/discord_logo_white.svg');

  $AssetsIconsGithubGen get github => const $AssetsIconsGithubGen();

  /// File path: assets/icons/icon_last_answer.png
  AssetGenImage get iconLastAnswer =>
      const AssetGenImage('assets/icons/icon_last_answer.png');

  /// File path: assets/icons/icon_word_by_word_game.png
  AssetGenImage get iconWordByWordGame =>
      const AssetGenImage('assets/icons/icon_word_by_word_game.png');

  /// File path: assets/icons/twitter_logo_black.svg
  SvgGenImage get twitterLogoBlack =>
      const SvgGenImage('assets/icons/twitter_logo_black.svg');

  /// File path: assets/icons/twitter_logo_white.svg
  SvgGenImage get twitterLogoWhite =>
      const SvgGenImage('assets/icons/twitter_logo_white.svg');

  /// List of all assets
  List<dynamic> get values => [
        discordLogoBlack,
        discordLogoWhite,
        iconLastAnswer,
        iconWordByWordGame,
        twitterLogoBlack,
        twitterLogoWhite
      ];
}

class $AssetsJsonGen {
  const $AssetsJsonGen();

  /// File path: assets/json/projects.json
  String get projects => 'assets/json/projects.json';

  /// List of all assets
  List<String> get values => [projects];
}

class $AssetsSectionsGen {
  const $AssetsSectionsGen();
}

class $AssetsIconsGithubGen {
  const $AssetsIconsGithubGen();

  /// File path: assets/icons/github/GitHub-Mark-120px-plus.png
  AssetGenImage get gitHubMark120pxPlus =>
      const AssetGenImage('assets/icons/github/GitHub-Mark-120px-plus.png');

  /// File path: assets/icons/github/GitHub-Mark-32px.png
  AssetGenImage get gitHubMark32px =>
      const AssetGenImage('assets/icons/github/GitHub-Mark-32px.png');

  /// File path: assets/icons/github/GitHub-Mark-64px.png
  AssetGenImage get gitHubMark64px =>
      const AssetGenImage('assets/icons/github/GitHub-Mark-64px.png');

  /// File path: assets/icons/github/GitHub-Mark-Light-120px-plus.png
  AssetGenImage get gitHubMarkLight120pxPlus => const AssetGenImage(
      'assets/icons/github/GitHub-Mark-Light-120px-plus.png');

  /// File path: assets/icons/github/GitHub-Mark-Light-32px.png
  AssetGenImage get gitHubMarkLight32px =>
      const AssetGenImage('assets/icons/github/GitHub-Mark-Light-32px.png');

  /// File path: assets/icons/github/GitHub-Mark-Light-64px.png
  AssetGenImage get gitHubMarkLight64px =>
      const AssetGenImage('assets/icons/github/GitHub-Mark-Light-64px.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        gitHubMark120pxPlus,
        gitHubMark32px,
        gitHubMark64px,
        gitHubMarkLight120pxPlus,
        gitHubMarkLight32px,
        gitHubMarkLight64px
      ];
}

class Assets {
  Assets._();

  static const $AssetsBadgesGen badges = $AssetsBadgesGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsJsonGen json = $AssetsJsonGen();
  static const $AssetsSectionsGen sections = $AssetsSectionsGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    Color? color,
    BlendMode colorBlendMode = BlendMode.srcIn,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    Clip clipBehavior = Clip.hardEdge,
    bool cacheColorFilter = false,
    SvgTheme? theme,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      color: color,
      colorBlendMode: colorBlendMode,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
      theme: theme,
    );
  }

  String get path => _assetName;
}
