import 'dart:ui';

import 'package:cupid_mentor/core/constants/love_language.dart';
import 'package:cupid_mentor/core/core_entity/localization_content.dart';
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
    final loveLanguages = ref.watch(onboardingNotifierProvider).userInfo.loveLanguages;
    final notifier = ref.read(onboardingNotifierProvider.notifier);
    Widget proxyDecorator(Widget child, int index, Animation<double> animation) {
      return AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget? child) {
          final animValue = Curves.easeInOut.transform(animation.value);
          final scale = lerpDouble(1, 1.02, animValue)!;
          return Transform.scale(
            scale: scale,
            child: ItemLoveLanguage(
              title: (LoveLanguage.loveLanguages[loveLanguages[index]]?.$1)?.value(context) ?? '',
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
        if (loveLanguages.length < LoveLanguage.loveLanguages.length)
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
          children: LoveLanguage.loveLanguages.keys
              .where((element) => !loveLanguages.contains(element))
              .map(
                (e) => CustomTag(
                  title: (LoveLanguage.loveLanguages[e]?.$1)?.value(context) ?? '',
                  isSelected: false,
                  onTap: () {
                    notifier.updateLoveLanguages(
                      e,
                      false,
                    );
                  },
                ),
              )
              .toList(),
        ),
        if (loveLanguages.length < LoveLanguage.loveLanguages.length) const VerticalSpace(size: 24),
        Row(
          children: [
            Column(
              children: List<int>.generate(loveLanguages.length, (i) => i)
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
                  for (int i = 0; i < loveLanguages.length; i++)
                    ItemLoveLanguage(
                      title:
                          (LoveLanguage.loveLanguages[loveLanguages[i]]?.$1)?.value(context) ?? '',
                      index: i,
                      key: ValueKey(loveLanguages[i]),
                      onTap: () {
                        notifier.updateLoveLanguages(
                          loveLanguages[i],
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
