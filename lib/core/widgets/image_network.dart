import 'package:cached_network_image/cached_network_image.dart';
import 'package:cupid_mentor/core/assets/assets.gen.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ImageNetwork extends ConsumerWidget {
  const ImageNetwork({required this.imageUrl, this.width, this.height, this.fit, super.key});

  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (imageUrl.isEmpty) return const SizedBox();
    return SizedBox(
      width: width,
      height: height,
      child: kIsWeb
          ? Image.network(
              imageUrl,
              fit: fit,
              errorBuilder: (_, __, ___) => Container(
                color: Colors.transparent,
                child: Align(
                  alignment: Alignment.center,
                  child: Assets.png.appIcon.image(color: Colors.grey),
                ),
              ),
              loadingBuilder: (_, Widget child, ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  color: Colors.transparent,
                  child: Align(
                    alignment: Alignment.center,
                    child: Assets.png.appIcon.image(color: Colors.grey),
                  ),
                );
              },
            )
          : CachedNetworkImage(
              imageUrl: imageUrl,
              fit: fit,
              progressIndicatorBuilder: (_, __, ___) => Container(
                color: Colors.transparent,
                child: Align(
                  alignment: Alignment.center,
                  child: Assets.png.appIcon.image(color: Colors.grey),
                ),
              ),
              errorWidget: (_, __, ___) => Container(
                color: Colors.transparent,
                child: Align(
                  alignment: Alignment.center,
                  child: Assets.png.appIcon.image(color: Colors.grey),
                ),
              ),
            ),
    );
  }
}
