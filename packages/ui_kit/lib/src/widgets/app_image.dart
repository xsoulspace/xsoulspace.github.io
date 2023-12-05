import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AppNetworkImage extends StatelessWidget {
  const AppNetworkImage({
    required this.imageUrl,
    this.constraints,
    this.alignment = Alignment.center,
    super.key,
  });
  final BoxConstraints? constraints;
  final String imageUrl;
  final Alignment alignment;
  @override
  Widget build(final BuildContext context) {
    return ConstrainedBox(
      constraints: constraints ?? const BoxConstraints(),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        alignment: alignment,
      ),
    );
  }
}
