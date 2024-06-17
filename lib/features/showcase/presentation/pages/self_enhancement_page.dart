import 'package:cupid_mentor/core/assets/assets.gen.dart';
import 'package:cupid_mentor/features/showcase/presentation/widgets/page_general_widget.dart';
import 'package:flutter/material.dart';

class SelfEnhancementPage extends StatelessWidget {
  const SelfEnhancementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageGeneralWidget(
      image: Assets.png.selfEnhancementImage.image(),
      textBg: Assets.svg.selfEnhancementBgText.svg(fit: BoxFit.fitWidth, width: double.infinity),
      title: "Self-Enhancement Insights",
      description:
          "Elevate your dating journey with personalized tips. From self-care to communication, empower yourself for success in dating.",
    );
  }
}
