import 'package:cupid_mentor/core/constants/personalities.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/widgets/custom_tag.dart';
import 'package:cupid_mentor/core/widgets/text_field.dart';
import 'package:cupid_mentor/core/widgets/vertical_space.dart';
import 'package:cupid_mentor/features/onboarding/presentation/manager/onboarding_notifier.dart';
import 'package:cupid_mentor/features/onboarding/presentation/widgets/page_skeleton_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InputPersonalitiesPage extends ConsumerStatefulWidget {
  const InputPersonalitiesPage({super.key});

  @override
  ConsumerState<InputPersonalitiesPage> createState() => _InputPersonalitiesPageState();
}

class _InputPersonalitiesPageState extends ConsumerState<InputPersonalitiesPage> {
  String searchKey = "";
  List<String> searchedList = [];
  List<String> unSearchedList = Personalities.personalities;

  @override
  void initState() {
    super.initState();
  }

  void _executeSearch() {
    if (searchKey.isNotEmpty) {
      searchedList = Personalities.personalities
          .where((element) => element.toLowerCase().contains(searchKey.toLowerCase()))
          .toList();
      unSearchedList = Personalities.personalities
          .where((element) => !element.toLowerCase().contains(searchKey.toLowerCase()))
          .toList();
    } else {
      searchedList = [];
      unSearchedList = Personalities.personalities;
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(onboardingNotifierProvider);
    return PageSkeletonWidget(
      title: "Describe yourself in a few words that we can know the real you 🙄",
      description:
          "Choose some words that best describe your personality. This enables us to enhance your unique and memorable dating experience.",
      children: [
        MyTextField(
          onChanged: (text) {
            searchKey = text;
            setState(() {
              _executeSearch();
            });
          },
          hintText: "Search your personalities",
          suffixIcon: Icon(
            Icons.search_rounded,
            color: ref.currentAppColor.textColor,
          ),
        ),
        const VerticalSpace(size: 16),
        if (searchedList.isNotEmpty) Wrap(
          spacing: 12,
          runSpacing: 12,
          children: searchedList
              .map((e) => CustomTag(
                  title: e,
                  isSelected: state.userInfo.personalities.contains(e),
                  onTap: () {
                    ref.read(onboardingNotifierProvider.notifier).updatePersonalities(
                          e,
                          state.userInfo.personalities.contains(e),
                        );
                  }))
              .toList(),
        ),
        if (searchedList.isNotEmpty) const VerticalSpace(size: 16),
        if (searchedList.isNotEmpty) Container(
          color: Colors.white,
          width: double.infinity,
          height: 2,
        ),
        if (searchedList.isNotEmpty) const VerticalSpace(size: 16),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: unSearchedList
              .map((e) => CustomTag(
                  title: e,
                  isSelected: state.userInfo.personalities.contains(e),
                  onTap: () {
                    ref.read(onboardingNotifierProvider.notifier).updatePersonalities(
                          e,
                          state.userInfo.personalities.contains(e),
                        );
                  }))
              .toList(),
        ),
      ],
    );
  }
}
