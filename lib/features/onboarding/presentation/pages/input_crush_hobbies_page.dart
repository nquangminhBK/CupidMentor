import 'package:cupid_mentor/core/constants/hobbies.dart';
import 'package:cupid_mentor/core/core_object/localization_content.dart';
import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
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
  List<LocalizationContent> searchedList = [];
  List<LocalizationContent> unSearchedList = Hobbies.hobbies;

  void _executeSearch(String searchKey) {
    if (searchKey.isNotEmpty) {
      searchedList = Hobbies.hobbies
          .where(
            (element) => element.value(context).toLowerCase().contains(searchKey.toLowerCase()),
          )
          .toList();
      unSearchedList = Hobbies.hobbies
          .where(
            (element) => !element.value(context).toLowerCase().contains(searchKey.toLowerCase()),
          )
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
      title: context.l10n.inputCrushHobbiesTitle,
      description: context.l10n.inputCrushBasicInfoDesc,
      children: [
        MyTextField(
          onChanged: (text) {
            setState(() {
              _executeSearch(text);
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
                    isSelected: crushHobbies.contains(e.id),
                    onTap: () {
                      notifier.updateCrushHobbies(
                        e.id!,
                        crushHobbies.contains(e.id),
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
                  isSelected: crushHobbies.contains(e.id),
                  onTap: () {
                    notifier.updateCrushHobbies(
                      e.id!,
                      crushHobbies.contains(e.id),
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
