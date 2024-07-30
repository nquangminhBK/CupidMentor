import 'package:cupid_mentor/core/assets/assets.gen.dart';
import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/navigation/routes.dart';
import 'package:cupid_mentor/features/home/presentation/widgets/base_introduce_widget.dart';
import 'package:cupid_mentor/features/home/presentation/widgets/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cupid_mentor/core/navigation/navigation_service.dart';

class TipDateSpotIntroduceWidget extends ConsumerWidget {
  const TipDateSpotIntroduceWidget({super.key, this.showTopText = true});
  final bool showTopText;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BaseIntroduceWidget(
      widget: MenuItem(
        isLeftToRight: true,
        title: context.l10n.tipDateSpotTitle,
        description: context.l10n.tipDateSpotDesc,
        buttonText: context.l10n.tipDateSpotButton,
        onTap: () => NavigationService.instance.push(AppRoutes.tipDateSpot),
        image: ref.currentTheme == ThemeMode.dark
            ? Assets.png.spotMenuImage.image(width: 140, height: 140)
            : Assets.png.spotMenuImageLight.image(width: 140, height: 140),
      ),
      title: context.l10n.tipDateSpotDialogInstructionTitle,
      description: context.l10n.tipDateSpotDialogInstructionDescription,
      showTopText: showTopText,
    );
  }
}
