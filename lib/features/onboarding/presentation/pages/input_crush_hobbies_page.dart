import 'package:cupid_mentor/core/constants/hobbies.dart';
import 'package:cupid_mentor/core/widgets/custom_tag.dart';
import 'package:cupid_mentor/core/widgets/text_field.dart';
import 'package:cupid_mentor/core/widgets/vertical_space.dart';
import 'package:cupid_mentor/features/onboarding/presentation/manager/onboarding_notifier.dart';
import 'package:cupid_mentor/features/onboarding/presentation/widgets/page_skeleton_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InputCrushHobbiesPage extends ConsumerStatefulWidget {
  const InputCrushHobbiesPage({super.key});

  @override
  ConsumerState<InputCrushHobbiesPage> createState() => _InputCrushHobbiesPageState();
}

class _InputCrushHobbiesPageState extends ConsumerState<InputCrushHobbiesPage> {
  List<String> searchedList = [];
  List<String> unSearchedList = Hobbies.hobbies;

  void _executeSearch(String searchKey) {
    if (searchKey.isNotEmpty) {
      searchedList = Hobbies.hobbies
          .where((element) => element.toLowerCase().contains(searchKey.toLowerCase()))
          .toList();
      unSearchedList = Hobbies.hobbies
          .where((element) => !element.toLowerCase().contains(searchKey.toLowerCase()))
          .toList();
    } else {
      searchedList = [];
      unSearchedList = Hobbies.hobbies;
    }
  }

  @override
  Widget build(BuildContext context) {
    final crushHobbies =
        ref.watch(onboardingNotifierProvider).userInfo.crushInfo?.hobbies ?? <String>[];
    final notifier = ref.read(onboardingNotifierProvider.notifier);
    return PageSkeletonWidget(
      title: 'We’re excited to discover your unique interests & passions 🤩',
      description:
          'Feel free to share your hobbies so we can tailor our suggestions perfectly for you.',
      children: [
        MyTextField(
          onChanged: (text) {
            setState(() {
              _executeSearch(text);
            });
          },
          hintText: 'Search your hobbies',
          suffixIcon: const Icon(
            Icons.search_rounded,
          ),
        ),
        const VerticalSpace(size: 16),
        if (searchedList.isNotEmpty)
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: searchedList
                .map(
                  (e) => CustomTag(
                    title: e,
                    isSelected: crushHobbies.contains(e),
                    onTap: () {
                      notifier.updateCrushHobbies(
                        e,
                        crushHobbies.contains(e),
                      );
                    },
                  ),
                )
                .toList(),
          ),
        if (searchedList.isNotEmpty) const VerticalSpace(size: 16),
        if (searchedList.isNotEmpty)
          Container(
            color: Colors.white,
            width: double.infinity,
            height: 2,
          ),
        if (searchedList.isNotEmpty) const VerticalSpace(size: 16),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: unSearchedList
              .map(
                (e) => CustomTag(
                  title: e,
                  isSelected: crushHobbies.contains(e),
                  onTap: () {
                    notifier.updateCrushHobbies(
                      e,
                      crushHobbies.contains(e),
                    );
                  },
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
//TODO can you bubble selection here
