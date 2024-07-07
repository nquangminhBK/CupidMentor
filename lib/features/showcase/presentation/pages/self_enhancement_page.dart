import 'package:cupid_mentor/core/assets/assets.gen.dart';
import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/features/showcase/presentation/widgets/page_general_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelfEnhancementPage extends ConsumerWidget {
  const SelfEnhancementPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PageGeneralWidget(
      image: ref.currentTheme == ThemeMode.dark
          ? Assets.png.selfEnhancementImage.image()
          : Assets.png.selfEnhancementImageLight.image(),
      textBg: Assets.svg.selfEnhancementBgText.svg(fit: BoxFit.fitWidth, width: double.infinity),
      title: 'Self-Enhancement Insights',
      description: context.l10n.selfEnhancementDescription,
    );
  }
}
