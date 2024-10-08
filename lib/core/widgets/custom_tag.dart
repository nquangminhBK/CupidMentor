import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/widgets/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomTag extends ConsumerWidget {
  const CustomTag({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final bool isSelected;
  final Function() onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) => AnimatedButton(
        onPress: onTap,
        isExpanded: false,
        child: AnimatedContainer(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: isSelected
                ? ref.currentAppColor.mainGradient
                : ref.currentAppColor.buttonBackgroundColorInGradient,
          ),
          duration: const Duration(milliseconds: 200),
          child: Text(
            title,
            style: context.textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.w600,
              color: isSelected ? Colors.white : ref.currentAppColor.textColor,
            ),
          ),
        ),
      );
}
