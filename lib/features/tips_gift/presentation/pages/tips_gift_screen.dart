import 'package:cupid_mentor/core/constants/special_occasion.dart';
import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/widgets/animated_button.dart';
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
          appBar: AppBar(
            titleSpacing: 0,
            title: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "The Ideal Gifts  🎁",
                style: context.textTheme.titleLarge!.copyWith(fontSize: 20),
              ),
            ),
            backgroundColor: context.theme.scaffoldBackgroundColor,
            elevation: 0,
            actions: [
              AnimatedButton(
                  onPress: () {},
                  child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Icon(Icons.info_outline_rounded)))
            ],
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
                    onPress: () {},
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white.withOpacity(0.05),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: 100,
                            height: 100,
                            child: SpecialOccasion.specialOccasions[index].image),
                        const VerticalSpace(size: 24),
                        Text(
                          SpecialOccasion.specialOccasions[index].title,
                          style: context.textTheme.titleSmall!.copyWith(fontSize: 18),
                        )
                      ],
                    ),
                  );
                }),
          ),
        )));
  }
}
