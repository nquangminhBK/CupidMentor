import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    required this.totalStep,
    required this.currentStep,
    this.width,
    super.key,
    this.color,
  });

  final int totalStep;
  final int currentStep;
  final double? width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final sizeOfAItem = (width ?? context.screenSize.width) / totalStep;
    return Stack(
      children: [
        Container(
          height: 6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              6,
            ),
            color: Colors.grey,
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 800),
          height: 6,
          curve: Curves.easeInOut,
          width: (currentStep + 1) * sizeOfAItem,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              6,
            ),
            color: color ?? context.theme.primaryColor,
          ),
        ),
      ],
    );
  }
}
