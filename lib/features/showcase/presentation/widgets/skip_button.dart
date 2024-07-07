import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/widgets/animated_button.dart';
import 'package:cupid_mentor/core/widgets/horizontal_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SkipButton extends ConsumerWidget {
  const SkipButton({super.key, required this.visible, required this.onPress});

  final bool visible;
  final Function onPress;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        const Spacer(),
        AnimatedButton(
          onPress: onPress,
          child: SizedBox(
            width: 60,
            height: 40,
            child: visible
                ? Center(
                    child: Text(
                      context.l10n.skip,
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
