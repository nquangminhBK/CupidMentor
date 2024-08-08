import 'package:cupid_mentor/core/core_object/localization_content.dart';
import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
 
import 'package:cupid_mentor/core/utils/snackbar_service.dart';
import 'package:cupid_mentor/core/widgets/animated_button.dart';
import 'package:cupid_mentor/core/widgets/base_dialog.dart';
import 'package:cupid_mentor/core/widgets/custom_tag.dart';
import 'package:cupid_mentor/core/widgets/text_field.dart';
import 'package:cupid_mentor/core/widgets/vertical_space.dart';
import 'package:cupid_mentor/features/profile/presentation/manager/profile_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpdateHobbiesDialog extends ConsumerStatefulWidget {
  const UpdateHobbiesDialog({super.key});

  @override
  ConsumerState<UpdateHobbiesDialog> createState() => _UpdateHobbiesDialogState();
}

class _UpdateHobbiesDialogState extends ConsumerState<UpdateHobbiesDialog> {
  List<LocalizationContent> searchedList = [];
  List<LocalizationContent> unSearchedList = [];
  var errorMsg = '';

  @override
  void initState() {
    unSearchedList = ref.preloadData.hobbies;
    super.initState();
  }

  void _clearError() {
    setState(() {
      errorMsg = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    final hobbies = ref.watch(profileNotifierProvider).tempUserInfo?.hobbies ?? [];
    final notifier = ref.read(profileNotifierProvider.notifier);

    void executeSearch(String searchKey) {
      if (searchKey.isNotEmpty) {
        searchedList = ref.preloadData.hobbies
            .where(
              (element) => element.value(context).toLowerCase().contains(searchKey.toLowerCase()),
            )
            .toList();
        unSearchedList = ref.preloadData.hobbies
            .where(
              (element) => !element.value(context).toLowerCase().contains(searchKey.toLowerCase()),
            )
            .toList();
      } else {
        searchedList = [];
        unSearchedList = ref.preloadData.hobbies;
      }
    }

    return BaseDialog(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.l10n.updateHobbies,
              style: context.textTheme.headlineSmall,
            ),
            const VerticalSpace(size: 12),
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
                          _clearError();
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
                        _clearError();
                        notifier.updateHobbies(
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
                    errorMsg = context.l10n.onboardingMissingHobbiesError;
                  });
                }
                if (hobbies.isNotEmpty) {
                  ref.read(profileNotifierProvider.notifier).updateUserInfo();
                  SnackBarService.instance
                      .showSuccessSnackBar(message: context.l10n.updateSuccess, context: context);
                  Navigator.of(context).pop();
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
                    context.l10n.update,
                    style: context.textTheme.titleMedium!.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
