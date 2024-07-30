import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/widgets/vertical_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BaseIntroduceWidget extends ConsumerWidget {
  const BaseIntroduceWidget({
    super.key,
    required this.widget,
    required this.title,
    required this.description,
    this.showTopText = true,
  });

  final Widget widget;
  final String title;
  final String description;
  final bool showTopText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showTopText) ...[
            Text(
              '${context.l10n.featureIntroduction}:',
              style: context.textTheme.headlineSmall!.copyWith(
                fontSize: 20,
                height: 1.5,
              ),
              textAlign: TextAlign.left,
            ),
            const VerticalSpace(size: 24),
          ],
          widget,
          const VerticalSpace(size: 12),
          Text(
            title,
            style: context.textTheme.headlineSmall!.copyWith(
              fontSize: 20,
              height: 1.5,
            ),
          ),
          const VerticalSpace(size: 12),
          Text(
            description,
            style: context.textTheme.bodyLarge!.copyWith(height: 1.5),
          ),
          const VerticalSpace(size: 8),
        ],
      ),
    );
  }
}
