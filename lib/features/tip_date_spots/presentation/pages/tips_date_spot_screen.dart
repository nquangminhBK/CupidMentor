import 'dart:async';

import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/utils/loading_utils.dart';
import 'package:cupid_mentor/core/utils/snackbar_service.dart';
import 'package:cupid_mentor/core/widgets/animated_button.dart';
import 'package:cupid_mentor/core/widgets/could_image.dart';
import 'package:cupid_mentor/core/widgets/dialog_list_generated_content.dart';
import 'package:cupid_mentor/core/widgets/my_app_bar.dart';
import 'package:cupid_mentor/core/widgets/showup_animation.dart';
import 'package:cupid_mentor/core/widgets/vertical_space.dart';
import 'package:cupid_mentor/features/tip_date_spots/presentation/manager/tip_date_spot_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TipsDateSpotsScreen extends ConsumerWidget {
  const TipsDateSpotsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(tipsDateSpotNotifierProvider, (previous, next) {
      if (next.errorOrSuccess != null) {
        next.errorOrSuccess!.fold(
          (error) {
            SnackBarService.instance.showErrorSnackBar(
              message: error.getDisplayMessage(context),
              context: context,
            );
          },
          (success) {},
        );
      }
    });
    return Container(
      color: context.theme.scaffoldBackgroundColor,
      child: SafeArea(
        child: Scaffold(
          appBar: MyAppBar.myAppBar(
            title: '${context.l10n.tipDateSpotTitle}  🎁',
            ref: ref,
            context: context,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.9,
              ),
              itemCount: ref.preloadData.specialOccasions.length,
              itemBuilder: (context, index) {
                return ShowUpAnimation(
                  delay: (index ~/ 2) * 100,
                  child: AnimatedButton(
                    onPress: () async {
                      LoadingUtils.showLoading();
                      var contents = await ref
                          .read(tipsDateSpotNotifierProvider.notifier)
                          .getTipsDateSpotByOccasion(
                            ref.preloadData.specialOccasions[index],
                          );
                      if (contents.isEmpty && context.mounted) {
                        await ref.read(tipsDateSpotNotifierProvider.notifier).generateAiContent(
                              ref.preloadData.specialOccasions[index],
                              context,
                            );
                      }
                      LoadingUtils.hideLoading();
                      contents = await ref
                          .read(tipsDateSpotNotifierProvider.notifier)
                          .getTipsDateSpotByOccasion(
                            ref.preloadData.specialOccasions[index],
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
                                      .read(tipsDateSpotNotifierProvider.notifier)
                                      .generateAiContent(
                                        ref.preloadData.specialOccasions[index],
                                        context,
                                      );
                                  LoadingUtils.hideLoading();
                                  return result;
                                },
                                onTapDelete: (contentId) async {
                                  LoadingUtils.showLoading();
                                  final result = await ref
                                      .read(tipsDateSpotNotifierProvider.notifier)
                                      .deleteTips(
                                        ref.preloadData.specialOccasions[index].id,
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
                    },
                    borderRadius: BorderRadius.circular(8),
                    color: ref.currentAppColor.homeMenuColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: SizedBox(
                            width: 100,
                            height: 100,
                            child: CouldImage(
                              imageName: ref.preloadData.specialOccasions[index].image,
                            ),
                          ),
                        ),
                        const VerticalSpace(size: 24),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            ref.preloadData.specialOccasions[index].title.value(context),
                            style: context.textTheme.titleSmall!.copyWith(
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
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
