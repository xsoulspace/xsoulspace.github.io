/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// ignore_for_file: directives_ordering

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  $AssetsIconsGithubGen get github => const $AssetsIconsGithubGen();

  /// File path: assets/icons/icon_last_answer.png
  AssetGenImage get iconLastAnswer =>
      const AssetGenImage('assets/icons/icon_last_answer.png');

  /// File path: assets/icons/icon_word_by_word_game.png
  AssetGenImage get iconWordByWordGame =>
      const AssetGenImage('assets/icons/icon_word_by_word_game.png');
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
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
}

class AssetGenImage extends AssetImage {
  const AssetGenImage(String assetName) : super(assetName);

  Image image({
    Key? key,
    ImageFrameBuilder? frameBuilder,
    ImageLoadingBuilder? loadingBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? width,
    double? height,
    Color? color,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    FilterQuality filterQuality = FilterQuality.low,
  }) {
    return Image(
      key: key,
      image: this,
      frameBuilder: frameBuilder,
      loadingBuilder: loadingBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      width: width,
      height: height,
      color: color,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      filterQuality: filterQuality,
    );
  }

  String get path => assetName;
}
