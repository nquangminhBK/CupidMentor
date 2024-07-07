import 'package:cupid_mentor/core/assets/assets.gen.dart';
import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/navigation/navigation_service.dart';
import 'package:cupid_mentor/core/navigation/routes.dart';
import 'package:cupid_mentor/core/themes_colors/app_colors.dart';
import 'package:cupid_mentor/core/widgets/animated_button.dart';
import 'package:cupid_mentor/core/widgets/horizontal_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatNowWidget extends ConsumerWidget {
  const ChatNowWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8))),
      width: double.infinity,
      height: 150,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            child: SizedBox(
              width: double.infinity,
              height: 150,
              child: Assets.svg.backgroundChatNow.svg(fit: BoxFit.cover),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: context.screenSize.width * 3 / 5,
              padding: const EdgeInsets.only(left: 12, top: 12),
              child: Text(
                context.l10n.tipsReplyDesc,
                style: context.textTheme.labelLarge!.copyWith(
                  fontSize: 14,
                  color: AppColors.dark.textColor,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: 160,
              height: 44,
              margin: const EdgeInsets.only(bottom: 12, right: 12),
              child: AnimatedButton(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white.withOpacity(0.20),
                onPress: () => NavigationService.instance.push(AppRoutes.tipReplying),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      context.l10n.tipsReplyButtonTitle,
                      textAlign: TextAlign.center,
                      style: context.textTheme.titleMedium!.copyWith(
                        color: AppColors.dark.textColor,
                      ),
                    ),
                    const HorizontalSpace(size: 8),
                    Icon(
                      Icons.chat_outlined,
                      size: 15,
                      color: AppColors.dark.textColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
