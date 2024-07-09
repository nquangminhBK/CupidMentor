import 'package:cupid_mentor/core/constants/special_occasion.dart';
import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/utils/generate_ai_context.dart';
import 'package:cupid_mentor/core/widgets/animated_button.dart';
import 'package:cupid_mentor/core/widgets/my_app_bar.dart';
import 'package:cupid_mentor/core/widgets/vertical_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TipsGiftsScreen extends ConsumerWidget {
  const TipsGiftsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: context.theme.scaffoldBackgroundColor,
      child: SafeArea(
        child: Scaffold(
          appBar: MyAppBar.myAppBar(
              title: '${context.l10n.tipGiftTitle}  🎁', ref: ref, context: context),
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
                  onPress: () {

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
                      Text(
                        SpecialOccasion.specialOccasions[index].title.value(context),
                        style: context.textTheme.titleSmall!.copyWith(
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
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
