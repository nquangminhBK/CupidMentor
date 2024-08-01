import 'dart:ui';

import 'package:collection/collection.dart';
import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/widgets/custom_tag.dart';
import 'package:cupid_mentor/core/widgets/horizontal_space.dart';
import 'package:cupid_mentor/core/widgets/vertical_space.dart';
import 'package:cupid_mentor/features/onboarding/presentation/manager/onboarding_notifier.dart';
import 'package:cupid_mentor/features/onboarding/presentation/widgets/dialog_love_language_concepts.dart';
import 'package:cupid_mentor/features/onboarding/presentation/widgets/item_love_languages.dart';
import 'package:cupid_mentor/features/onboarding/presentation/widgets/page_skeleton_widget.dart';
import 'package:cupid_mentor/features/onboarding/presentation/widgets/rank_widget.dart';
import 'package:cupid_mentor/features/preload_data/presentation/manager/preload_data_notifier.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InputLoveLanguagesPage extends ConsumerStatefulWidget {
  const InputLoveLanguagesPage({super.key});

  @override
  ConsumerState<InputLoveLanguagesPage> createState() => _InputLoveLanguagesPageState();
}

class _InputLoveLanguagesPageState extends ConsumerState<InputLoveLanguagesPage> {
  @override
  Widget build(BuildContext context) {
    final allLoveLanguages = ref.watch(preloadDataNotifierProvider).loveLanguages;
    final userLoveLanguages = ref.watch(onboardingNotifierProvider).userInfo.loveLanguages;
    final notifier = ref.read(onboardingNotifierProvider.notifier);
    Widget proxyDecorator(Widget child, int index, Animation<double> animation) {
      final itemLoveLanguage =
          allLoveLanguages.firstWhereOrNull((e) => e.id == userLoveLanguages[index])?.title;
      return AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget? child) {
          final animValue = Curves.easeInOut.transform(animation.value);
          final scale = lerpDouble(1, 1.02, animValue)!;
          return Transform.scale(
            scale: scale,
            child: ItemLoveLanguage(
              title: itemLoveLanguage?.value(context) ?? '',
              index: index,
              onTap: () {},
            ),
          );
        },
        child: child,
      );
    }

    return PageSkeletonWidget(
      title: context.l10n.inputLoveLanguageTitle,
      description: context.l10n.inputLoveLanguageDesc,
      children: [
        if (userLoveLanguages.length < allLoveLanguages.length)
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: context.l10n.loveLanguageExplain1,
                  style: context.textTheme.bodyLarge,
                ),
                TextSpan(
                  text: context.l10n.loveLanguageExplain2,
                  style: context.textTheme.bodyLarge!.copyWith(
                    color: ref.currentAppColor.secondaryColor,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      showDialog(
                        context: context,
                        builder: (_) => const DialogLoveLanguageConcept(),
                      );
                    },
                ),
                TextSpan(
                  text: context.l10n.loveLanguageExplain3,
                  style: context.textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        const VerticalSpace(size: 16),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: allLoveLanguages
              .where((element) => !userLoveLanguages.contains(element.id))
              .map(
                (e) => CustomTag(
                  title: e.title.value(context),
                  isSelected: false,
                  onTap: () {
                    notifier.updateLoveLanguages(
                      e.id,
                      false,
                    );
                  },
                ),
              )
              .toList(),
        ),
        if (userLoveLanguages.length < allLoveLanguages.length) const VerticalSpace(size: 24),
        Row(
          children: [
            Column(
              children: List<int>.generate(userLoveLanguages.length, (i) => i)
                  .map((e) => RankWidget(title: 'No ${e + 1}'))
                  .toList(),
            ),
            const HorizontalSpace(size: 12),
            Expanded(
              child: ReorderableListView(
                buildDefaultDragHandles: false,
                proxyDecorator: proxyDecorator,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                onReorder: (int oldIndex, int newIndex) {
                  notifier.reorderLoveLanguages(oldIndex, newIndex);
                },
                children: [
                  for (int i = 0; i < userLoveLanguages.length; i++)
                    ItemLoveLanguage(
                      title: allLoveLanguages
                              .firstWhereOrNull((e) => e.id == userLoveLanguages[i])
                              ?.title
                              .value(context) ??
                          '',
                      index: i,
                      key: ValueKey(userLoveLanguages[i]),
                      onTap: () {
                        notifier.updateLoveLanguages(
                          userLoveLanguages[i],
                          true,
                        );
                      },
                    ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
