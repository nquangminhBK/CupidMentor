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

class InputCrushBasicInfoPage extends ConsumerStatefulWidget {
  const InputCrushBasicInfoPage({super.key});

  @override
  ConsumerState<InputCrushBasicInfoPage> createState() => _InputCrushBasicInfoPageState();
}

class _InputCrushBasicInfoPageState extends ConsumerState<InputCrushBasicInfoPage> {
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
    final crushInfo = ref.watch(onboardingNotifierProvider).userInfo.crushInfo;
    final gender = crushInfo?.gender ?? Gender.none;
    if (crushInfo != null) {
      if (kIsWeb) {
        nameController.value = nameController.value.copyWith(
          text: crushInfo.name,
          selection: TextSelection.collapsed(
            offset: crushInfo.name.length,
          ),
        );
        jobController.value = jobController.value.copyWith(
          text: crushInfo.job,
          selection: TextSelection.collapsed(
            offset: crushInfo.job.length,
          ),
        );
        /*TODO: the reason why we need this is because of this bug
              https://github.com/flutter/flutter/issues/137659
              need to check and update in the future
      */
      } else {
        nameController.text = crushInfo.name;
        jobController.text = crushInfo.job;
      }
    }

    return PageSkeletonWidget(
      title: context.l10n.inputCrushBasicInfoTitle,
      description: context.l10n.inputCrushBasicInfoDesc,
      children: [
        Text(
          gender == Gender.none
              ? context.l10n.crushNameFieldTitle
              : (gender == Gender.male
                  ? context.l10n.maleCrushNameFieldTitle
                  : context.l10n.femaleCrushNameFieldTitle),
          style: context.textTheme.titleLarge,
        ),
        const VerticalSpace(size: 6),
        MyTextField(
          controller: nameController,
          focusNode: nameFocusNode,
          key: const ValueKey('crushName'),
          onChanged: (text) {
            onboardingNotifier.updateCrushBasicInfo(name: text);
          },
          hintText: context.l10n.crushNameFieldHint,
        ),
        const VerticalSpace(size: 24),
        Text(
          gender == Gender.none
              ? context.l10n.crushGenderFieldTitle
              : (gender == Gender.male
                  ? context.l10n.maleCrushGenderFieldTitle
                  : context.l10n.femaleCrushGenderFieldTitle),
          style: context.textTheme.titleLarge,
        ),
        const VerticalSpace(size: 6),
        SelectGenderDropdown(
          onSelectGender: (Gender? gender) =>
              onboardingNotifier.updateCrushBasicInfo(gender: gender),
          selectedGender: gender,
          hint: context.l10n.crushGenderFieldHint,
        ),
        const VerticalSpace(size: 24),
        Text(
          gender == Gender.none
              ? context.l10n.crushBirthdayFieldTitle
              : (gender == Gender.male
                  ? context.l10n.maleCrushBirthdayFieldTitle
                  : context.l10n.femaleCrushBirthdayFieldTitle),
          style: context.textTheme.titleLarge,
        ),
        const VerticalSpace(size: 6),
        SelectDateWidget(
          hint: context.l10n.crushBirthdayFieldHint,
          onDateSelected: (selectedDate) {
            onboardingNotifier.updateCrushBasicInfo(birthDay: selectedDate);
          },
          selectedDate: (crushInfo?.birthday.isSameDate(DateTimeConst.empty()) ?? true)
              ? null
              : crushInfo!.birthday,
        ),
        const VerticalSpace(size: 24),
        Text(
          gender == Gender.none
              ? context.l10n.crushJobFieldTitle
              : (gender == Gender.male
                  ? context.l10n.maleCrushJobFieldTitle
                  : context.l10n.femaleCrushJobFieldTitle),
          style: context.textTheme.titleLarge,
        ),
        const VerticalSpace(size: 6),
        MyTextField(
          controller: jobController,
          focusNode: jobFocusNode,
          key: const ValueKey('crushJobs'),
          onChanged: (text) {
            onboardingNotifier.updateCrushBasicInfo(job: text);
          },
          hintText: context.l10n.crushJobFieldHint,
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
