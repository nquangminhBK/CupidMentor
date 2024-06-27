import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/widgets/horizontal_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ItemLoveLanguage extends ConsumerWidget {
  const ItemLoveLanguage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: ref.currentAppColor.buttonBackgroundColor,
      ),
      height: 50,
      child: Row(
        children: [
          const HorizontalSpace(
            size: 12,
          ),
          Text(
            "title",
            style: context.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w600),
          ),
          const Spacer(),
          Icon(
            Icons.reorder_rounded,
            color: ref.currentAppColor.textColor,
          ),
          const HorizontalSpace(
            size: 12,
          ),
        ],
      ),
    );
  }
}
