import 'package:cupid_mentor/core/widgets/horizontal_space.dart';
import 'package:cupid_mentor/features/onboarding/presentation/widgets/item_love_languages.dart';
import 'package:cupid_mentor/features/onboarding/presentation/widgets/page_skeleton_widget.dart';
import 'package:cupid_mentor/features/onboarding/presentation/widgets/rank_widget.dart';
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
    return PageSkeletonWidget(
        title: "Tell us about your love languages 🫶🏻",
        description:
            "Uncover your unique love languages and prioritize them. Let's rank your heart's desires for having more fulfilling connections in the future!",
        children: [
          Row(
            children: [
              Column(
                children: [
                  RankWidget(title: "1st"),
                  RankWidget(title: "2nd"),
                  RankWidget(title: "3rd"),
                  RankWidget(title: "4th"),
                  RankWidget(title: "5th"),
                ],
              ),
              const HorizontalSpace(size: 12),
              Expanded(
                child: ReorderableListView(

                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  onReorder: (int oldIndex, int newIndex) {},
                  children: [
                    ItemLoveLanguage(key: UniqueKey(),),
                    ItemLoveLanguage(key: UniqueKey(),),
                    ItemLoveLanguage(key: UniqueKey(),),
                    ItemLoveLanguage(key: UniqueKey(),),
                    ItemLoveLanguage(key: UniqueKey(),),
                  ],
                ),
              )
            ],
          )
        ]);
  }
}
