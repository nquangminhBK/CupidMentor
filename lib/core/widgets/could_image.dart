import 'package:cupid_mentor/core/constants/cloud_image_url.dart';
import 'package:cupid_mentor/core/widgets/image_network.dart';
import 'package:flutter/material.dart';

class CouldImage extends StatelessWidget {
  const CouldImage({required this.imageName, this.width, this.height, this.fit, super.key});

  final String imageName;
  final double? width;
  final double? height;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return ImageNetwork(
      imageUrl: CloudImageUrl.cloudImageUrl(imageName),
      key: ValueKey(imageName),
      width: width,
      height: height,
      fit: fit ?? BoxFit.cover,
    );
  }
}
