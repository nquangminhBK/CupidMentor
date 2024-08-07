import 'package:cupid_mentor/core/assets/assets.gen.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelfEnhancementPage extends ConsumerWidget {
  const SelfEnhancementPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: ref.currentTheme == ThemeMode.dark
          ? Assets.png.selfEnhancementImage.image()
          : Assets.png.selfEnhancementImageLight.image(),
    );
  }
}
