import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/widgets/horizontal_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ItemLoveLanguage extends ConsumerWidget {
  const ItemLoveLanguage({
    super.key,
    required this.title,
    required this.index,
    required this.onTap,
  });

  final String title;
  final int index;
  final Function() onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Container(
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
              title,
              style: context.textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            ReorderableDragStartListener(
              index: index,
              child: const Padding(
                padding: EdgeInsets.only(right: 12, top: 10, bottom: 10),
                child: Icon(
                  Icons.reorder_rounded,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
