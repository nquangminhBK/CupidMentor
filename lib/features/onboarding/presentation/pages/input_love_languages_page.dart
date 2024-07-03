import 'dart:ui';

import 'package:cupid_mentor/core/constants/love_language.dart';
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

    Widget proxyDecorator(Widget child, int index, Animation<double> animation) {
      return AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget? child) {
          final double animValue = Curves.easeInOut.transform(animation.value);
          final double scale = lerpDouble(1, 1.02, animValue)!;
          return Transform.scale(
            scale: scale,
            child: ItemLoveLanguage(
              title: loveLanguages[index],
              index: index,
              onTap: () {},
            ),
          );
        },
        child: child,
      );
    }

    return PageSkeletonWidget(
        title: "Tell us about your love languages 🫶🏻",
        description:
            "Uncover your unique love languages and prioritize them. Let's rank your heart's desires for having more fulfilling connections in the future!",
        children: [
          if (loveLanguages.length < LoveLanguage.loveLanguages.length)
            RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text:
                      'First, tap the items below to select, you can arrange the order after selecting, ',
                      style:
                      context.textTheme.bodyLarge!.copyWith(color: ref.currentAppColor.textColor),
                    ),
                    TextSpan(
                      text: 'click here',
                      style: context.textTheme.bodyLarge!.copyWith(
                        color: ref.currentAppColor.secondaryColor,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          showDialog(context: context, builder: (_) => const DialogLoveLanguageConcept());
                        },
                    ),
                    TextSpan(
                      text: ' to read more about the concept love language.',
                      style:
                      context.textTheme.bodyLarge!.copyWith(color: ref.currentAppColor.textColor),
                    ),
                  ],
                )),
          const VerticalSpace(size: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: LoveLanguage.loveLanguages.keys
                .where((element) => !loveLanguages.contains(element))
                .map((e) => CustomTag(
                title: e,
                isSelected: false,
                onTap: () {
                  ref.read(onboardingNotifierProvider.notifier).updateLoveLanguages(
                    e,
                    false,
                  );
                }))
                .toList(),
          ),
          if (loveLanguages.length < LoveLanguage.loveLanguages.length)
            const VerticalSpace(size: 24),
          Row(
            children: [
              Column(
                children: List<int>.generate(loveLanguages.length, (i) => i)
                    .map((e) => RankWidget(title: "No ${e + 1}"))
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
                      ref
                          .read(onboardingNotifierProvider.notifier)
                          .reorderLoveLanguages(oldIndex, newIndex);
                    },
                    children: [
                      for (int i = 0; i < loveLanguages.length; i++)
                        ItemLoveLanguage(
                          title: loveLanguages[i],
                          index: i,
                          key: ValueKey(loveLanguages[i]),
                          onTap: () {
                            ref.read(onboardingNotifierProvider.notifier).updateLoveLanguages(
                                  loveLanguages[i],
                                  true,
                                );
                          },
                        )
                    ]),
              )
            ],
          ),
        ]);
  }
}
