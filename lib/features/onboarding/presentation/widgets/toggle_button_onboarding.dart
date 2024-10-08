import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/widgets/animated_button.dart';
import 'package:cupid_mentor/core/widgets/horizontal_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ToggleButtonOnboarding extends ConsumerWidget {
  const ToggleButtonOnboarding({
    super.key,
    required this.isSelected,
    required this.onChange,
    required this.title,
  });

  final bool isSelected;
  final Function() onChange;
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnimatedButton(
      onPress: onChange,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: isSelected
              ? ref.currentAppColor.mainGradient
              : ref.currentAppColor.buttonBackgroundColorInGradient,
        ),
        height: 50,
        child: Row(
          children: [
            const HorizontalSpace(size: 16),
            isSelected
                ? Icon(
                    Icons.radio_button_checked_rounded,
                    color: isSelected ? Colors.white : ref.currentAppColor.textColor,
                  )
                : Icon(
                    Icons.radio_button_unchecked_rounded,
                    color: isSelected ? Colors.white : ref.currentAppColor.textColor,
                  ),
            const HorizontalSpace(size: 8),
            Text(
              title,
              style: context.textTheme.bodyLarge!
                  .copyWith(color: isSelected ? Colors.white : ref.currentAppColor.textColor),
            ),
          ],
        ),
      ),
    );
  }
}
