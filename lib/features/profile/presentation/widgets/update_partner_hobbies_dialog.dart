import 'package:cupid_mentor/core/constants/hobbies.dart';
import 'package:cupid_mentor/core/core_object/localization_content.dart';
import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/navigation/navigation_service.dart';
import 'package:cupid_mentor/core/utils/snackbar_service.dart';
import 'package:cupid_mentor/core/widgets/animated_button.dart';
import 'package:cupid_mentor/core/widgets/custom_tag.dart';
import 'package:cupid_mentor/core/widgets/text_field.dart';
import 'package:cupid_mentor/core/widgets/vertical_space.dart';
import 'package:cupid_mentor/features/profile/presentation/manager/profile_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpdatePartnerHobbiesDialog extends ConsumerStatefulWidget {
  const UpdatePartnerHobbiesDialog({super.key});

  @override
  ConsumerState<UpdatePartnerHobbiesDialog> createState() => _UpdatePartnerHobbiesDialogState();
}

class _UpdatePartnerHobbiesDialogState extends ConsumerState<UpdatePartnerHobbiesDialog> {
  List<LocalizationContent> searchedList = [];
  List<LocalizationContent> unSearchedList = Hobbies.hobbies;
  var errorMsg = '';

  void _clearError() {
    setState(() {
      errorMsg = '';
    });
  }

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
  Widget build(
    BuildContext context,
  ) {
    final hobbies = ref.watch(profileNotifierProvider).tempUserInfo?.partnerInfo?.hobbies ?? [];
    final notifier = ref.read(profileNotifierProvider.notifier);
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ref.currentAppColor.screenBackgroundColor,
        ),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(24),
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.l10n.updatePartnerHobbies,
                style: context.textTheme.headlineSmall,
              ),
              const VerticalSpace(size: 12),
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
                          isSelected: hobbies.contains(e.id),
                          onTap: () {
                            _clearError();
                            notifier.updatePartnerHobbies(
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
                          _clearError();
                          notifier.updatePartnerHobbies(
                            e.id!,
                            hobbies.contains(e.id),
                          );
                        },
                      ),
                    )
                    .toList(),
              ),
              const VerticalSpace(size: 20),
              if (errorMsg.isNotEmpty)
                Text(
                  errorMsg,
                  style: context.textTheme.titleSmall!.copyWith(color: Colors.red),
                ),
              AnimatedButton(
                onPress: () {
                  if (hobbies.isEmpty) {
                    setState(() {
                      errorMsg = 'please select a hobbies';
                    });
                  }
                  if (hobbies.isNotEmpty) {
                    ref.read(profileNotifierProvider.notifier).updateUserInfo();
                    SnackBarService.instance
                        .showSuccessSnackBar(message: 'Update success', context: context);
                    NavigationService.instance.pop();
                  }
                },
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: ref.currentAppColor.primaryColor,
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  width: double.infinity,
                  height: 48,
                  child: Center(
                    child: Text(
                      'Update',
                      style: context.textTheme.titleMedium!.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
