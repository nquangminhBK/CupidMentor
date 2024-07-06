import 'package:cached_network_image/cached_network_image.dart';
import 'package:cupid_mentor/core/assets/assets.gen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ImageNetwork extends StatelessWidget {
  const ImageNetwork({required this.imageUrl, this.width, this.height, this.fit, super.key});

  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: kIsWeb
          ? Image.network(
              imageUrl,
              fit: fit,
              errorBuilder: (context, url, error) => Container(
                color: Colors.white,
                child: Align(
                    alignment: Alignment.center,
                    child: Assets.png.appIcon.image(color: Colors.grey)),
              ),
            )
          : CachedNetworkImage(
              imageUrl: imageUrl,
              fit: fit,
              progressIndicatorBuilder: (context, url, downloadProgress) => const DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xff667915), Colors.black],
                  ),
                ),
              ),
              errorWidget: (context, url, error) => Container(
                color: Colors.white,
                child: Align(
                  alignment: Alignment.center,
                  child: Assets.png.appIcon.image(color: Colors.grey),
                ),
              ),
            ),
    );
  }
}
