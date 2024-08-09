import 'package:cupid_mentor/core/assets/assets.gen.dart';
import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/navigation/routes.dart';
import 'package:cupid_mentor/features/home/presentation/widgets/base_introduce_widget.dart';
import 'package:cupid_mentor/features/home/presentation/widgets/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class TipGiftIntroduceWidget extends ConsumerWidget {
  const TipGiftIntroduceWidget({super.key, this.showTopText = true});

  final bool showTopText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BaseIntroduceWidget(
      widget: MenuItem(
        isLeftToRight: false,
        title: context.l10n.tipGiftTitle,
        description: context.l10n.tipGiftDesc,
        buttonText: context.l10n.tipGiftButton,
        onTap: () => context.push('/${AppRoutes.home}/${AppRoutes.tipGift}'),
        image: ref.currentTheme == ThemeMode.dark
            ? Assets.png.giftMenuImage.image(width: 140, height: 140)
            : Assets.png.giftMenuImageLight.image(width: 140, height: 140),
      ),
      title: context.l10n.tipGiftDialogInstructionTitle,
      description: context.l10n.tipGiftDialogInstructionDescription,
      showTopText: showTopText,
    );
  }
}
