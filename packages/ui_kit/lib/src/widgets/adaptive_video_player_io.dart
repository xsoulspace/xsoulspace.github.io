import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void initWebView() {}

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
    return ConstrainedBox(
      constraints: constraints,
      child: const Center(
        child: Placeholder(),
      ),
    );
  }
}
