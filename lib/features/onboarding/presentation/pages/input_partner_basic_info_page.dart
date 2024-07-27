import 'package:cupid_mentor/core/constants/datetime.dart';
import 'package:cupid_mentor/core/constants/gender.dart';
import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/datetime_extension.dart';
import 'package:cupid_mentor/core/widgets/horizontal_space.dart';
import 'package:cupid_mentor/core/widgets/text_field.dart';
import 'package:cupid_mentor/core/widgets/vertical_space.dart';
import 'package:cupid_mentor/features/onboarding/presentation/manager/onboarding_notifier.dart';
import 'package:cupid_mentor/features/onboarding/presentation/widgets/page_skeleton_widget.dart';
import 'package:cupid_mentor/features/onboarding/presentation/widgets/select_date_widget.dart';
import 'package:cupid_mentor/features/onboarding/presentation/widgets/select_gender_dropdown.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InputPartnerBasicInfoPage extends ConsumerStatefulWidget {
  const InputPartnerBasicInfoPage({super.key});

  @override
  ConsumerState<InputPartnerBasicInfoPage> createState() => _InputPartnerBasicInfoPageState();
}

class _InputPartnerBasicInfoPageState extends ConsumerState<InputPartnerBasicInfoPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController jobController = TextEditingController();
  final FocusNode nameFocusNode = FocusNode();
  final FocusNode jobFocusNode = FocusNode();

  @override
  void dispose() {
    nameController.dispose();
    jobController.dispose();
    nameFocusNode.dispose();
    jobFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final onboardingNotifier = ref.read(onboardingNotifierProvider.notifier);
    final partnerInfo = ref.watch(onboardingNotifierProvider).userInfo.partnerInfo;
    final gender = partnerInfo?.gender;
    if (partnerInfo != null) {
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
    }

    return PageSkeletonWidget(
      title: context.l10n.inputPartnerBasicInfoTitle,
      description: context.l10n.inputPartnerBasicInfoDesc,
      children: [
        Text(
          gender == null || gender == Gender.other
              ? context.l10n.partnerNameFieldTitle
              : (gender == Gender.male
                  ? context.l10n.malePartnerNameFieldTitle
                  : context.l10n.femalePartnerNameFieldTitle),
          style: context.textTheme.titleLarge,
        ),
        const VerticalSpace(size: 6),
        MyTextField(
          controller: nameController,
          focusNode: nameFocusNode,
          key: const ValueKey('PartnerName'),
          onChanged: (text) {
            onboardingNotifier.updatePartnerBasicInfo(name: text);
          },
          hintText: context.l10n.partnerNameFieldHint,
        ),
        const VerticalSpace(size: 24),
        Text(
          gender == null || gender == Gender.other
              ? context.l10n.partnerGenderFieldTitle
              : (gender == Gender.male
                  ? context.l10n.malePartnerGenderFieldTitle
                  : context.l10n.femalePartnerGenderFieldTitle),
          style: context.textTheme.titleLarge,
        ),
        const VerticalSpace(size: 6),
        SelectGenderWidget(
          onSelectGender: (Gender? gender) =>
              onboardingNotifier.updatePartnerBasicInfo(gender: gender),
          selectedGender: gender,
          hint: context.l10n.partnerGenderFieldHint,
        ),
        const VerticalSpace(size: 24),
        Text(
          gender == null || gender == Gender.other
              ? context.l10n.partnerBirthdayFieldTitle
              : (gender == Gender.male
                  ? context.l10n.malePartnerBirthdayFieldTitle
                  : context.l10n.femalePartnerBirthdayFieldTitle),
          style: context.textTheme.titleLarge,
        ),
        const VerticalSpace(size: 6),
        SelectDateWidget(
          hint: context.l10n.partnerBirthdayFieldHint,
          onDateSelected: (selectedDate) {
            onboardingNotifier.updatePartnerBasicInfo(birthDay: selectedDate);
          },
          selectedDate: (partnerInfo?.birthday.isSameDate(DateTimeConst.empty()) ?? true)
              ? null
              : partnerInfo!.birthday,
        ),
        const VerticalSpace(size: 24),
        Text(
          gender == null || gender == Gender.other
              ? context.l10n.partnerJobFieldTitle
              : (gender == Gender.male
                  ? context.l10n.malePartnerJobFieldTitle
                  : context.l10n.femalePartnerJobFieldTitle),
          style: context.textTheme.titleLarge,
        ),
        const VerticalSpace(size: 6),
        MyTextField(
          controller: jobController,
          focusNode: jobFocusNode,
          key: const ValueKey('PartnerJobs'),
          onChanged: (text) {
            onboardingNotifier.updatePartnerBasicInfo(job: text);
          },
          hintText: context.l10n.partnerJobFieldHint,
        ),
        const VerticalSpace(size: 24),
        Row(
          children: [
            const Icon(
              Icons.privacy_tip_outlined,
            ),
            const HorizontalSpace(size: 6),
            Expanded(
              child: Text(
                context.l10n.informationSafe,
                style: context.textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
