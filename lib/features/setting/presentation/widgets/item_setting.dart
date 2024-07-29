import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/widgets/animated_button.dart';
import 'package:cupid_mentor/core/widgets/horizontal_space.dart';
import 'package:flutter/material.dart';

class ItemSetting extends StatelessWidget {
  const ItemSetting({
    super.key,
    required this.leftIcon,
    this.rightWidget,
    required this.title,
    required this.onTap,
  });

  final IconData leftIcon;
  final Widget? rightWidget;
  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      height: 48,
      child: AnimatedButton(
        onPress: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(leftIcon),
            const HorizontalSpace(size: 12),
            Text(
              title,
              style: context.textTheme.titleMedium,
            ),
            const Spacer(),
            rightWidget ??
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                ),
          ],
        ),
      ),
    );
  }
}
