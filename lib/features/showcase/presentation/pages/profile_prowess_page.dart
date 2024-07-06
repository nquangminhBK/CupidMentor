import 'package:cupid_mentor/core/assets/assets.gen.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/features/showcase/presentation/widgets/page_general_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileProwessPage extends ConsumerWidget {
  const ProfileProwessPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PageGeneralWidget(
      image: ref.currentTheme == ThemeMode.dark
          ? Assets.png.profileProwessImage.image()
          : Assets.png.profileProwessImageLight.image(),
      textBg: Assets.svg.profileProwessBgText.svg(fit: BoxFit.fitWidth, width: double.infinity),
      title: 'Profile Prowess',
      description:
          'Create a captivating bio to attract matches. Let us guide you in showcasing your personality for better matches.',
    );
  }
}
