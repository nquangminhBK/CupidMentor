import 'dart:async';
import 'package:cupid_mentor/core/constants/special_occasion.dart';
import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/utils/loading_utils.dart';
import 'package:cupid_mentor/core/utils/snackbar_service.dart';
import 'package:cupid_mentor/core/widgets/animated_button.dart';
import 'package:cupid_mentor/core/widgets/dialog_list_generated_content.dart';
import 'package:cupid_mentor/core/widgets/my_app_bar.dart';
import 'package:cupid_mentor/core/widgets/vertical_space.dart';
import 'package:cupid_mentor/features/tips_gift/presentation/manager/tips_gift_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TipsGiftsScreen extends ConsumerWidget {
  const TipsGiftsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(tipsGiftNotifierProvider, (previous, next) {
      if (next.error?.isNotEmpty ?? false) {
        SnackBarService.instance.showErrorSnackBar(message: next.error!, context: context);
      }
    });
    return Container(
      color: context.theme.scaffoldBackgroundColor,
      child: SafeArea(
        child: Scaffold(
          appBar: MyAppBar.myAppBar(
            title: '${context.l10n.tipGiftTitle}  🎁',
            ref: ref,
            context: context,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: GridView.builder(
              key: UniqueKey(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.9,
              ),
              itemCount: SpecialOccasion.specialOccasions.length,
              itemBuilder: (context, index) {
                return AnimatedButton(
                  onPress: () async {
                    LoadingUtils.showLoading();
                    var contents =
                        await ref.read(tipsGiftNotifierProvider.notifier).getTipsGiftByOccasion(
                              SpecialOccasion.specialOccasions[index],
                            );
                    if (contents.isEmpty && context.mounted) {
                      await ref.read(tipsGiftNotifierProvider.notifier).generateAiContent(
                            SpecialOccasion.specialOccasions[index],
                            context,
                          );
                    }
                    LoadingUtils.hideLoading();
                    contents =
                        await ref.read(tipsGiftNotifierProvider.notifier).getTipsGiftByOccasion(
                              SpecialOccasion.specialOccasions[index],
                            );
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
                                    .read(tipsGiftNotifierProvider.notifier)
                                    .generateAiContent(
                                      SpecialOccasion.specialOccasions[index],
                                      context,
                                    );
                                LoadingUtils.hideLoading();
                                return result;
                              },
                            );
                          },
                        ),
                      );
                    }
                  },
                  borderRadius: BorderRadius.circular(8),
                  color: ref.currentAppColor.homeMenuColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: SpecialOccasion.specialOccasions[index].image,
                      ),
                      const VerticalSpace(size: 24),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          SpecialOccasion.specialOccasions[index].title.value(context),
                          style: context.textTheme.titleSmall!.copyWith(
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
