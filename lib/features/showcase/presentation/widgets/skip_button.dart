import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/widgets/animated_button.dart';
import 'package:cupid_mentor/core/widgets/horizontal_space.dart';
import 'package:flutter/material.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key, required this.visible});

  final bool visible;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        AnimatedButton(
          onPress: () {},
          child: SizedBox(
            width: 60,
            height: 40,
            child: visible
                ? Center(
                    child: Text(
                      "Skip",
                      style: context.textTheme.titleMedium,
                    ),
                  )
                : const SizedBox(),
          ),
        ),
        const HorizontalSpace(size: 16),
      ],
    );
  }
}
