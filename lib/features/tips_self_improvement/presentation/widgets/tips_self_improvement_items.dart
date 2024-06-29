import 'package:cupid_mentor/core/constants/self_improvement.dart';
import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/widgets/horizontal_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TipsSelfImprovementItem extends ConsumerWidget {
  const TipsSelfImprovementItem({super.key, required this.item});

  final SelfImprovement item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        margin: const EdgeInsets.only(left: 24, right: 24, top: 12),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.white.withOpacity(0.09)),
        child: Row(
          children: [
            Expanded(
              child: Text(
                item.title,
                style: context.textTheme.labelLarge!.copyWith(color: ref.currentAppColor.textColor),
              ),
            ),
            const HorizontalSpace(size: 8),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: ref.currentAppColor.textColor,
              size: 16,
            )
          ],
        ));
  }
}
