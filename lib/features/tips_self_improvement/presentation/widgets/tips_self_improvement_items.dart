import 'package:cupid_mentor/core/constants/self_improvement.dart';
import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/widgets/horizontal_space.dart';
import 'package:cupid_mentor/features/tips_self_improvement/presentation/manager/tips_self_improve_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TipsSelfImprovementItem extends ConsumerWidget {
  const TipsSelfImprovementItem({super.key, required this.item});

  final SelfImprovement item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () async {
        final content =
            await ref.read(tipsSelfImproveNotifierProvider.notifier).getData(item.title);
        print("minh check $content");
        showDialog(
            context: context,
            builder: (_) {
              return Container(
                color: Colors.blue,
                child: Markdown(data: content),
              );
            });
      },
      child: Container(
        margin: const EdgeInsets.only(left: 24, right: 24, top: 12),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white.withOpacity(0.09),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                item.title,
                style: context.textTheme.labelLarge,
              ),
            ),
            const HorizontalSpace(size: 8),
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
