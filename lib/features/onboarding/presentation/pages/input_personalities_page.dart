import 'package:cupid_mentor/core/constants/personalities.dart';
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
  List<String> searchedList = [];
  List<String> unSearchedList = Personalities.personalities;

  void _executeSearch(String searchKey) {
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
    final personalities = ref.watch(onboardingNotifierProvider).userInfo.personalities;
    final notifier = ref.read(onboardingNotifierProvider.notifier);
    return PageSkeletonWidget(
      title: 'Describe yourself in a few words that we can know the real you 🙄',
      description:
          'Choose some words that best describe your personality. This enables us to enhance your unique and memorable dating experience.',
      children: [
        MyTextField(
          onChanged: (text) {
            setState(() {
              _executeSearch(text);
            });
          },
          hintText: 'Search your personalities',
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
                    isSelected: personalities.contains(e),
                    onTap: () {
                      notifier.updatePersonalities(
                        e,
                        personalities.contains(e),
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
                  isSelected: personalities.contains(e),
                  onTap: () {
                    notifier.updatePersonalities(
                      e,
                      personalities.contains(e),
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
