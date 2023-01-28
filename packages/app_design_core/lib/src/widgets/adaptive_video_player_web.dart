// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:life_hooks/life_hooks.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_web/webview_flutter_web.dart';

part 'adaptive_video_player_state.dart';

void initWebView() {
  WebViewPlatform.instance = WebWebViewPlatform();
}

class AdaptiveVideoPlayer extends HookWidget {
  const AdaptiveVideoPlayer({
    required this.url,
    required this.constraints,
    super.key,
  });
  final String url;
  final BoxConstraints constraints;
  @override
  Widget build(final BuildContext context) {
    final diDto = AdaptiveVideoPlayerStateDiDto(url: url);
    final state = useAdaptiveVideoPlayerState(diDto: diDto);

    return ConstrainedBox(
      constraints: constraints,
      child: Center(
        child: WebViewWidget(
          controller: state.controller,
        ),
      ),
    );
  }
}
