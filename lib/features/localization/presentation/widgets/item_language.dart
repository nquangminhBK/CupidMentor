import 'package:cupid_mentor/core/assets/assets.gen.dart';
import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/themes_colors/app_colors.dart';
import 'package:cupid_mentor/core/widgets/animated_button.dart';
import 'package:cupid_mentor/core/widgets/horizontal_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ItemLanguage extends ConsumerWidget {
  const ItemLanguage({
    super.key,
    required this.isSelected,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  final bool isSelected;
  final String title;
  final Widget icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: AnimatedButton(
        onPress: onTap,
        borderRadius: BorderRadius.circular(8),
        child: AnimatedContainer(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: isSelected
                ? ref.currentAppColor.mainGradient
                : ref.currentAppColor.buttonBackgroundColorInGradient,
          ),
          padding: const EdgeInsets.all(8),
          duration: const Duration(milliseconds: 300),
          child: Row(
            children: [
              const HorizontalSpace(
                size: 24,
              ),
              Text(
                title,
                style: context.textTheme.titleLarge!.copyWith(
                  color: isSelected ? AppColors.dark.textColor : ref.currentAppColor.textColor,
                  fontSize: 20,
                ),
              ),
              const Spacer(),
              Container(
                width: 50,
                height: 50,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.transparent,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: icon,
                ),
              ),
              const HorizontalSpace(
                size: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
