import 'package:cupid_mentor/core/constants/hobbies.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/widgets/custom_tag.dart';
import 'package:cupid_mentor/core/widgets/text_field.dart';
import 'package:cupid_mentor/core/widgets/vertical_space.dart';
import 'package:cupid_mentor/features/onboarding/presentation/manager/onboarding_notifier.dart';
import 'package:cupid_mentor/features/onboarding/presentation/widgets/page_skeleton_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InputHobbiesPage extends ConsumerStatefulWidget {
  const InputHobbiesPage({super.key});

  @override
  ConsumerState<InputHobbiesPage> createState() => _InputHobbiesPageState();
}

class _InputHobbiesPageState extends ConsumerState<InputHobbiesPage> {
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
    final hobbies = ref.watch(onboardingNotifierProvider).userInfo.hobbies;
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
          suffixIcon: Icon(
            Icons.search_rounded,
            color: ref.currentAppColor.textColor,
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
                    isSelected: hobbies.contains(e),
                    onTap: () {
                      notifier.updateHobbies(
                        e,
                        hobbies.contains(e),
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
                  isSelected: hobbies.contains(e),
                  onTap: () {
                    notifier.updateHobbies(
                      e,
                      hobbies.contains(e),
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
