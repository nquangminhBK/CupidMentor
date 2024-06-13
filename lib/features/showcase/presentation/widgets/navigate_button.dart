import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/widgets/animated_button.dart';
import 'package:cupid_mentor/core/widgets/horizontal_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigateButton extends ConsumerWidget {
  const NavigateButton({
    super.key,
    this.showBackButton,
    this.showLastButton,
  });

  final bool? showBackButton;
  final bool? showLastButton;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (showLastButton ?? false) {
      return AnimatedButton(
          onPress: () {},
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
          ));
    }
    return Row(
      children: [
        const HorizontalSpace(size: 24),
        if (showBackButton ?? false)
          AnimatedButton(
              onPress: () {},
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: ref.currentAppColor.buttonBackgroundColor),
                width: 56,
                height: 56,
                child: Icon(
                  Icons.arrow_back_rounded,
                  color: ref.currentAppColor.textColor,
                ),
              )),
        const Spacer(),
        AnimatedButton(
            onPress: () {},
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: ref.currentAppColor.buttonBackgroundColor),
              width: 56,
              height: 56,
              child: Icon(
                Icons.arrow_forward_rounded,
                color: ref.currentAppColor.textColor,
              ),
            )),
        const HorizontalSpace(size: 24),
      ],
    );
  }
}
