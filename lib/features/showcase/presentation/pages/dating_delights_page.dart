import 'package:cupid_mentor/core/assets/assets.gen.dart';
import 'package:cupid_mentor/features/showcase/presentation/pages/page_general_widget.dart';
import 'package:flutter/material.dart';

class DatingDelightPage extends StatelessWidget {
  const DatingDelightPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageGeneralWidget(
      image: Assets.pngImages.profileProwessImage.image(),
      textBg:
          Assets.svgImages.datingDelightBgText.svg(fit: BoxFit.fitWidth, width: double.infinity),
      title: "Dating Delights",
      description:
          "Explore ideal gifts, date spots, and messaging tips for memorable interactions. Let our expert suggestions enhance your joyful dating experience.",
    );
  }
}
