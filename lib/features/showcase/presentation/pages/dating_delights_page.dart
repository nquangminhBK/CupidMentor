import 'package:cupid_mentor/core/assets/assets.gen.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/features/showcase/presentation/widgets/page_general_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DatingDelightPage extends ConsumerWidget {
  const DatingDelightPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PageGeneralWidget(
      image: ref.currentTheme == ThemeMode.dark
          ? Assets.png.profileProwessImage.image()
          : Assets.png.profileProwessImageLight.image(),
      textBg: Assets.svg.datingDelightBgText.svg(fit: BoxFit.fitWidth, width: double.infinity),
      title: 'Dating Delights',
      description:
          'Explore ideal gifts, date spots, and messaging tips for memorable interactions. Let our expert suggestions enhance your joyful dating experience.',
    );
  }
}
