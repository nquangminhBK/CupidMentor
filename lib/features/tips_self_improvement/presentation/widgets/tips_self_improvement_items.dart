import 'dart:async';

import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/utils/loading_utils.dart';
import 'package:cupid_mentor/core/widgets/animated_button.dart';
import 'package:cupid_mentor/core/widgets/dialog_list_generated_content.dart';
import 'package:cupid_mentor/core/widgets/horizontal_space.dart';
import 'package:cupid_mentor/features/preload_data/domain/entities/content_with_description.dart';
import 'package:cupid_mentor/features/tips_self_improvement/presentation/manager/tips_self_improvement_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TipsSelfImprovementItem extends ConsumerWidget {
  const TipsSelfImprovementItem({super.key, required this.item});

  final ContentWithDescription item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnimatedButton(
      onPress: () async {
        {
          LoadingUtils.showLoading();
          var contents = await ref.read(tipsSelfImprovementNotifierProvider.notifier).getTips(
                item,
              );
          if (contents.isEmpty && context.mounted) {
            await ref.read(tipsSelfImprovementNotifierProvider.notifier).generateAiContent(
                  item,
                  context,
                );
          }
          LoadingUtils.hideLoading();
          contents = await ref.read(tipsSelfImprovementNotifierProvider.notifier).getTips(item);
          if (context.mounted) {
            unawaited(
              showDialog(
                context: context,
                builder: (_) {
                  return DialogListGeneratedContent(
                    contents: contents,
                    onTapCreateNewOne: () async {
                      LoadingUtils.showLoading();
                      final result = await ref
                          .read(tipsSelfImprovementNotifierProvider.notifier)
                          .generateAiContent(
                            item,
                            context,
                          );
                      LoadingUtils.hideLoading();
                      return result;
                    },
                    onTapDelete: (contentId) async {
                      LoadingUtils.showLoading();
                      final result =
                          await ref.read(tipsSelfImprovementNotifierProvider.notifier).deleteTips(
                                item.id,
                                contentId,
                              );
                      LoadingUtils.hideLoading();
                      return result;
                    },
                  );
                },
              ),
            );
          }
        }
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.only(top: 8),
        child: Row(
          children: [
            Expanded(
              child: Text(
                item.title.value(context),
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
