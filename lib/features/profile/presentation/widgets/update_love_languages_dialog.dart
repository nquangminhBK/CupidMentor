import 'dart:ui';

import 'package:cupid_mentor/core/constants/love_language.dart';
import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/navigation/navigation_service.dart';
import 'package:cupid_mentor/core/utils/snackbar_service.dart';
import 'package:cupid_mentor/core/widgets/animated_button.dart';
import 'package:cupid_mentor/core/widgets/custom_tag.dart';
import 'package:cupid_mentor/core/widgets/horizontal_space.dart';
import 'package:cupid_mentor/core/widgets/vertical_space.dart';
import 'package:cupid_mentor/features/onboarding/presentation/widgets/item_love_languages.dart';
import 'package:cupid_mentor/features/onboarding/presentation/widgets/rank_widget.dart';
import 'package:cupid_mentor/features/profile/presentation/manager/profile_notifier.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cupid_mentor/features/onboarding/presentation/widgets/dialog_love_language_concepts.dart';

class UpdateLoveLanguagesDialog extends ConsumerStatefulWidget {
  const UpdateLoveLanguagesDialog({super.key});

  @override
  ConsumerState<UpdateLoveLanguagesDialog> createState() => _UpdateLoveLanguagesDialogState();
}

class _UpdateLoveLanguagesDialogState extends ConsumerState<UpdateLoveLanguagesDialog> {
  var errorMsg = '';

  void _clearError() {
    setState(() {
      errorMsg = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    final loveLanguages = ref.watch(profileNotifierProvider).tempUserInfo?.loveLanguages ?? [];
    final notifier = ref.read(profileNotifierProvider.notifier);
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

    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ref.currentAppColor.screenBackgroundColor,
        ),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(24),
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.l10n.updateLoveLanguages,
                style: context.textTheme.headlineSmall,
              ),
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
                          _clearError();
                          notifier.updateLoveLanguages(
                            e,
                            false,
                          );
                        },
                      ),
                    )
                    .toList(),
              ),
              if (loveLanguages.length < LoveLanguage.loveLanguages.length)
                const VerticalSpace(size: 24),
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
                            title: (LoveLanguage.loveLanguages[loveLanguages[i]]?.$1)
                                    ?.value(context) ??
                                '',
                            index: i,
                            key: ValueKey(loveLanguages[i]),
                            onTap: () {
                              _clearError();
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
              if (errorMsg.isNotEmpty)
                Text(
                  errorMsg,
                  style: context.textTheme.titleSmall!.copyWith(color: Colors.red),
                ),
              AnimatedButton(
                onPress: () {
                  if (loveLanguages.isEmpty) {
                    setState(() {
                      errorMsg = context.l10n.onboardingMissingLoveLanguagesError;
                    });
                  }
                  if (loveLanguages.isNotEmpty) {
                    ref.read(profileNotifierProvider.notifier).updateUserInfo();
                    SnackBarService.instance
                        .showSuccessSnackBar(message: context.l10n.updateSuccess, context: context);
                    NavigationService.instance.pop();
                  }
                },
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: ref.currentAppColor.primaryColor,
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  width: double.infinity,
                  height: 48,
                  child: Center(
                    child: Text(
                      context.l10n.update,
                      style: context.textTheme.titleMedium!.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}