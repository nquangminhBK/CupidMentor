import 'package:cupid_mentor/core/constants/datetime.dart';
import 'package:cupid_mentor/core/constants/gender.dart';
import 'package:cupid_mentor/core/constants/relationship_type.dart';
import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/datetime_extension.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/navigation/navigation_service.dart';
import 'package:cupid_mentor/core/utils/snackbar_service.dart';
import 'package:cupid_mentor/core/widgets/animated_button.dart';
import 'package:cupid_mentor/core/widgets/text_field.dart';
import 'package:cupid_mentor/core/widgets/vertical_space.dart';
import 'package:cupid_mentor/features/onboarding/presentation/widgets/select_date_widget.dart';
import 'package:cupid_mentor/features/onboarding/presentation/widgets/select_gender_dropdown.dart';
import 'package:cupid_mentor/features/profile/presentation/manager/profile_notifier.dart';
import 'package:cupid_mentor/features/profile/presentation/widgets/select_relationship_type.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpdatePartnerBasicInfoDialog extends ConsumerStatefulWidget {
  const UpdatePartnerBasicInfoDialog({
    super.key,
  });

  @override
  ConsumerState<UpdatePartnerBasicInfoDialog> createState() => _UpdatePartnerBasicInfoDialogState();
}

class _UpdatePartnerBasicInfoDialogState extends ConsumerState<UpdatePartnerBasicInfoDialog> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController jobController = TextEditingController();
  final FocusNode nameFocusNode = FocusNode();
  final FocusNode jobFocusNode = FocusNode();
  var nameError = '';
  var jobError = '';

  void clearError() {
    setState(() {
      nameError = '';
      jobError = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(profileNotifierProvider.notifier);
    final partnerInfo = ref.watch(profileNotifierProvider).tempUserInfo?.partnerInfo;
    final userInfo = ref.watch(profileNotifierProvider).tempUserInfo;
    if (partnerInfo == null) return const SizedBox();
    if (kIsWeb) {
      nameController.value = nameController.value.copyWith(
        text: partnerInfo.name,
        selection: TextSelection.collapsed(
          offset: partnerInfo.name.length,
        ),
      );
      jobController.value = jobController.value.copyWith(
        text: partnerInfo.job,
        selection: TextSelection.collapsed(
          offset: partnerInfo.job.length,
        ),
      );
      /*TODO: the reason why we need this is because of this bug
              https://github.com/flutter/flutter/issues/137659
              need to check and update in the future
      */
    } else {
      nameController.text = partnerInfo.name;
      jobController.text = partnerInfo.job;
    }
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ref.currentAppColor.screenBackgroundColor,
        ),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(24),
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Update your basic info',
              style: context.textTheme.headlineSmall,
            ),
            const VerticalSpace(size: 6),
            Text(
              'Relation',
              style: context.textTheme.titleLarge,
            ),
            const VerticalSpace(size: 6),
            SelectRelationshipType(
              onTypeSelected: (type) {
                notifier.updateRelationship(type);
              },
              selectedType: RelationshipType.tryParse(userInfo?.relationship ?? ''),
              hint: 'Select type',
            ),
            const VerticalSpace(size: 6),
            Text(
              context.l10n.nameFieldTitle,
              style: context.textTheme.titleLarge,
            ),
            const VerticalSpace(size: 6),
            MyTextField(
              controller: nameController,
              focusNode: nameFocusNode,
              key: const ValueKey('name'),
              onChanged: (text) {
                notifier.updatePartnerBasicInfo(name: text);
                clearError();
              },
              hintText: context.l10n.nameFieldHint,
            ),
            if (nameError.isNotEmpty)
              Text(
                nameError,
                style: context.textTheme.titleSmall!.copyWith(color: Colors.red),
              ),
            const VerticalSpace(size: 10),
            Text(
              context.l10n.genderFieldTitle,
              style: context.textTheme.titleLarge,
            ),
            const VerticalSpace(size: 6),
            SelectGenderDropdown(
              onSelectGender: (Gender? gender) => notifier.updatePartnerBasicInfo(gender: gender),
              selectedGender: partnerInfo.gender,
              hint: context.l10n.genderFieldHint,
            ),
            const VerticalSpace(size: 10),
            Text(
              context.l10n.birthdayFieldTitle,
              style: context.textTheme.titleLarge,
            ),
            const VerticalSpace(size: 6),
            SelectDateWidget(
              hint: context.l10n.birthdayFieldHint,
              onDateSelected: (selectedDate) {
                notifier.updatePartnerBasicInfo(birthDay: selectedDate);
                clearError();
              },
              selectedDate:
                  partnerInfo.birthday.isSameDate(DateTimeConst.empty()) ? null : partnerInfo.birthday,
            ),
            const VerticalSpace(size: 10),
            Text(
              context.l10n.jobFieldTitle,
              style: context.textTheme.titleLarge,
            ),
            const VerticalSpace(size: 6),
            MyTextField(
              controller: jobController,
              focusNode: jobFocusNode,
              key: const ValueKey('jobs'),
              onChanged: (text) {
                notifier.updatePartnerBasicInfo(job: text);
              },
              hintText: context.l10n.jobFieldHint,
            ),
            if (jobError.isNotEmpty)
              Text(
                jobError,
                style: context.textTheme.titleSmall!.copyWith(color: Colors.red),
              ),
            const VerticalSpace(size: 24),
            AnimatedButton(
              onPress: () {
                if (nameController.text.isEmpty) {
                  setState(() {
                    nameError = 'name cannot be empty';
                  });
                }
                if (jobController.text.isEmpty) {
                  setState(() {
                    jobError = 'name cannot be empty';
                  });
                }
                if (jobController.text.isNotEmpty && nameController.text.isNotEmpty) {
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
    );
  }
}
