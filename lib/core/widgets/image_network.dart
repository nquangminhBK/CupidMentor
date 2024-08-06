import 'package:cached_network_image/cached_network_image.dart';
import 'package:cupid_mentor/core/assets/assets.gen.dart';
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
    return SizedBox(
      width: width,
      height: height,
      child: AnimatedCrossFade(
        layoutBuilder: (Widget topChild, Key topChildKey, Widget bottomChild, Key bottomChildKey) {
          return Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                key: bottomChildKey,
                child: bottomChild,
              ),
              Align(
                alignment: Alignment.center,
                key: topChildKey,
                child: topChild,
              ),
            ],
          );
        },
        alignment: Alignment.center,
        duration: const Duration(milliseconds: 200),
        firstChild: Assets.png.appIcon.image(color: Colors.grey),
        secondChild: imageUrl.isEmpty
            ? Assets.png.appIcon.image(color: Colors.grey)
            : kIsWeb
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
                    errorWidget: (_, __, error) {
                      return Container(
                        color: Colors.transparent,
                        child: Align(
                          alignment: Alignment.center,
                          child: Assets.png.appIcon.image(color: Colors.grey),
                        ),
                      );
                    },
                  ),
        crossFadeState: imageUrl.isEmpty ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      ),
    );
  }
}
