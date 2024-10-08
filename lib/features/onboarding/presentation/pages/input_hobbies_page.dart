import 'package:cupid_mentor/core/core_object/localization_content.dart';
import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/widgets/custom_tag.dart';
import 'package:cupid_mentor/core/widgets/text_field.dart';
import 'package:cupid_mentor/core/widgets/vertical_space.dart';
import 'package:cupid_mentor/features/onboarding/presentation/manager/onboarding_notifier.dart';
import 'package:cupid_mentor/features/onboarding/presentation/widgets/page_skeleton_widget.dart';
import 'package:cupid_mentor/features/preload_data/presentation/manager/preload_data_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InputHobbiesPage extends ConsumerStatefulWidget {
  const InputHobbiesPage({super.key});

  @override
  ConsumerState<InputHobbiesPage> createState() => _InputHobbiesPageState();
}

class _InputHobbiesPageState extends ConsumerState<InputHobbiesPage> {
  List<LocalizationContent> searchedList = [];
  List<LocalizationContent> unSearchedList = [];

  @override
  void initState() {
    unSearchedList = ref.read(preloadDataNotifierProvider).hobbies;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final hobbies = ref.watch(onboardingNotifierProvider).userInfo.hobbies;
    final notifier = ref.read(onboardingNotifierProvider.notifier);
    final allHobbies = ref.read(preloadDataNotifierProvider).hobbies;
    void executeSearch(String searchKey) {
      if (searchKey.isNotEmpty) {
        searchedList = allHobbies
            .where(
              (element) => element.value(context).toLowerCase().contains(searchKey.toLowerCase()),
            )
            .toList();
        unSearchedList = allHobbies
            .where(
              (element) => !element.value(context).toLowerCase().contains(searchKey.toLowerCase()),
            )
            .toList();
      } else {
        searchedList = [];
        unSearchedList = allHobbies;
      }
    }

    return PageSkeletonWidget(
      title: context.l10n.inputHobbiesTitle,
      description: context.l10n.inputHobbiesDesc,
      children: [
        MyTextField(
          onChanged: (text) {
            setState(() {
              executeSearch(text);
            });
          },
          hintText: context.l10n.searchHobbies,
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
                    title: e.value(context),
                    isSelected: hobbies.contains(e.id),
                    onTap: () {
                      notifier.updateHobbies(
                        e.id!,
                        hobbies.contains(e.id),
                      );
                    },
                  ),
                )
                .toList(),
          ),
        if (searchedList.isNotEmpty) const VerticalSpace(size: 16),
        if (searchedList.isNotEmpty)
          Container(
            color: ref.currentAppColor.textColor,
            width: double.infinity,
            height: 1,
          ),
        if (searchedList.isNotEmpty) const VerticalSpace(size: 16),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: unSearchedList
              .map(
                (e) => CustomTag(
                  title: e.value(context),
                  isSelected: hobbies.contains(e.id),
                  onTap: () {
                    notifier.updateHobbies(
                      e.id!,
                      hobbies.contains(e.id),
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
