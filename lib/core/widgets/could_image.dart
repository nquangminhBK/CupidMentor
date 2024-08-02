import 'package:cupid_mentor/core/assets/assets.gen.dart';
import 'package:cupid_mentor/core/widgets/image_network.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class CouldImage extends StatefulWidget {
  const CouldImage({required this.imageName, this.width, this.height, this.fit, super.key});

  final String imageName;
  final double? width;
  final double? height;
  final BoxFit? fit;

  @override
  State<CouldImage> createState() => _CouldImageState();
}

class _CouldImageState extends State<CouldImage> {
  String imageUrl = '';

  @override
  void initState() {
    FirebaseStorage.instance.ref().child(widget.imageName).getDownloadURL().then((url) {
      if (mounted) {
        setState(() {
          imageUrl = url;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (imageUrl.isEmpty) {
      return Container(
        width: widget.width,
        height: widget.height,
        color: Colors.transparent,
        child: Align(
          alignment: Alignment.center,
          child: Assets.png.appIcon.image(color: Colors.grey),
        ),
      );
    }
    return ImageNetwork(
      imageUrl: imageUrl,
      key: ValueKey(widget.imageName),
      width: widget.width,
      height: widget.height,
      fit: widget.fit,
    );
  }
}
