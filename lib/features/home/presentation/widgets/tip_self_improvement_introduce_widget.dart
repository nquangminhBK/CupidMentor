import 'package:cupid_mentor/core/assets/assets.gen.dart';
import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/navigation/navigation_service.dart';
import 'package:cupid_mentor/core/navigation/routes.dart';
import 'package:cupid_mentor/features/home/presentation/widgets/base_introduce_widget.dart';
import 'package:cupid_mentor/features/home/presentation/widgets/menu_item.dart';
import 'package:cupid_mentor/features/tips_self_improvement/presentation/pages/tips_self_improvement_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TipSelfImprovementIntroduceWidget extends ConsumerWidget {
  const TipSelfImprovementIntroduceWidget({super.key, this.showTopText = true});

  final bool showTopText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BaseIntroduceWidget(
      widget: MenuItem(
        isLeftToRight: true,
        title: context.l10n.tipSelfImprovementTitle,
        description: context.l10n.tipSelfImprovementDesc,
        buttonText: context.l10n.tipSelfImprovementButton,
        onTap: () => NavigationService.instance.push(AppRoutes.tipSelfImprovement),
        image: ref.currentTheme == ThemeMode.dark
            ? Assets.png.tipMenuImage.image(width: 140, height: 140)
            : Assets.png.tipMenuImageLight.image(width: 140, height: 140),
        targetPage: const TipsSelfImprovementScreen(),
      ),
      title: context.l10n.tipSelfImprovementDialogInstructionTitle,
      description: context.l10n.tipSelfImprovementDialogInstructionDescription,
      showTopText: showTopText,
    );
  }
}
