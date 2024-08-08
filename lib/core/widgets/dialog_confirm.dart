import 'package:cupid_mentor/core/constants/screen_size.dart';
import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
 
import 'package:cupid_mentor/core/themes_colors/app_colors.dart';
import 'package:cupid_mentor/core/widgets/animated_button.dart';
import 'package:cupid_mentor/core/widgets/horizontal_space.dart';
import 'package:cupid_mentor/core/widgets/vertical_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DialogConfirm extends ConsumerWidget {
  final Function onPositiveButtonExecute;
  final Function? onNegativeButtonExecute;
  final String? title;
  final String message;
  final String titlePositiveButton;
  final String? titleNegativeButton;
  final Widget? icon;

  const DialogConfirm({
    super.key,
    this.onNegativeButtonExecute,
    required this.onPositiveButtonExecute,
    required this.message,
    this.title,
    required this.titlePositiveButton,
    this.titleNegativeButton,
    this.icon,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        constraints: BoxConstraints(maxWidth: ScreenSize.maxWidth),
        margin: const EdgeInsets.only(left: 24, right: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: ref.currentAppColor.screenBackgroundColor,
        ),
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const VerticalSpace(size: 24),
            if (icon != null) icon!,
            if (title != null && icon != null) const VerticalSpace(size: 8),
            if (title != null)
              Text(
                title!,
                style: context.textTheme.headlineSmall!
                    .copyWith(color: ref.currentAppColor.textColor, fontSize: 20),
              ),
            const VerticalSpace(size: 12),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                message,
                maxLines: 4,
                textAlign: TextAlign.center,
                style: context.textTheme.titleLarge!
                    .copyWith(color: ref.currentAppColor.textColor, fontSize: 16),
              ),
            ),
            const VerticalSpace(size: 16),
            Row(
              children: [
                const HorizontalSpace(size: 24),
                Expanded(
                  child: SizedBox(
                    height: 48,
                    child: AnimatedButton(
                      color: ref.currentAppColor.buttonBackgroundColor,
                      onPress: () {
                        if (onNegativeButtonExecute != null) {
                          onNegativeButtonExecute!();
                        } else {
                          Navigator.of(context).pop();
                        }
                      },
                      child: Text(
                        titleNegativeButton ?? context.l10n.cancel,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: ref.currentAppColor.textColor),
                      ),
                    ),
                  ),
                ),
                const HorizontalSpace(size: 24),
                Expanded(
                  child: SizedBox(
                    height: 48,
                    child: AnimatedButton(
                      color: ref.currentAppColor.primaryColor,
                      onPress: () {
                        onPositiveButtonExecute();
                      },
                      child: Text(
                        titlePositiveButton,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: AppColors.dark.textColor),
                      ),
                    ),
                  ),
                ),
                const HorizontalSpace(size: 24),
              ],
            ),
            const VerticalSpace(size: 24),
          ],
        ),
      ),
    );
  }
}
