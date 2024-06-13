import 'package:cupid_mentor/core/assets/assets.gen.dart';
import 'package:cupid_mentor/features/showcase/presentation/pages/page_general_widget.dart';
import 'package:flutter/material.dart';

class ProfileProwessPage extends StatelessWidget {
  const ProfileProwessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageGeneralWidget(
      image: Assets.pngImages.profileProwessImage.image(),
      textBg:
          Assets.svgImages.profileProwessBgText.svg(fit: BoxFit.fitWidth, width: double.infinity),
      title: "Profile Prowess",
      description:
          "Create a captivating bio to attract matches. Let us guide you in showcasing your personality for better matches.",
    );
  }
}
