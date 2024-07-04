import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/widgets/animated_button.dart';
import 'package:cupid_mentor/core/widgets/horizontal_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigateButton extends ConsumerWidget {
  const NavigateButton({
    required this.onPressBack,
    required this.onPressNext,
    required this.onPressLastButton,
    required this.lastButtonTitle,
    super.key,
    this.showBackButton,
    this.showLastButton,
  });

  final bool? showBackButton;
  final bool? showLastButton;
  final String lastButtonTitle;
  final Function onPressBack;
  final Function onPressNext;
  final Function onPressLastButton;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (showLastButton ?? false) {
      return AnimatedButton(
        onPress: onPressLastButton,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: ref.currentAppColor.primaryColor,
          ),
          margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
          width: double.infinity,
          height: 48,
          child: Center(
            child: Text(
              "All right, let's get started!",
              style: context.textTheme.titleMedium,
            ),
          ),
        ),
      );
    }
    return Row(
      children: [
        const HorizontalSpace(size: 24),
        if (showBackButton ?? false)
          AnimatedButton(
            onPress: onPressBack,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: ref.currentAppColor.buttonBackgroundColor,
              ),
              width: 56,
              height: 56,
              child: const Icon(
                Icons.arrow_back_rounded,
              ),
            ),
          ),
        const Spacer(),
        AnimatedButton(
          onPress: onPressNext,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: ref.currentAppColor.buttonBackgroundColor,
            ),
            width: 56,
            height: 56,
            child: const Icon(
              Icons.arrow_forward_rounded,
            ),
          ),
        ),
        const HorizontalSpace(size: 24),
      ],
    );
  }
}
