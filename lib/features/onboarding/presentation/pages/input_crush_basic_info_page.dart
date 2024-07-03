import 'package:cupid_mentor/core/constants/datetime.dart';
import 'package:cupid_mentor/core/constants/gender.dart';
import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/datetime_extension.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
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
      title: 'Got it, and now is some questions about your crush 💘',
      description:
          "You can skip any information you're unsure of and update it later. Your journey, your pace!",
      children: [
        Text(
          gender == Gender.none
              ? 'Her/his name is'
              : (gender == Gender.male ? 'His name is' : 'Her name is'),
          style: context.textTheme.titleLarge!.copyWith(color: ref.currentAppColor.textColor),
        ),
        const VerticalSpace(size: 6),
        MyTextField(
          controller: nameController,
          focusNode: nameFocusNode,
          key: const ValueKey('crushName'),
          onChanged: (text) {
            onboardingNotifier.updateCrushBasicInfo(name: text);
          },
          hintText: 'Enter name',
        ),
        const VerticalSpace(size: 24),
        Text(
          gender == Gender.none
              ? 'Her/his gender is'
              : (gender == Gender.male ? 'His gender is' : 'Her gender is'),
          style: context.textTheme.titleLarge!.copyWith(color: ref.currentAppColor.textColor),
        ),
        const VerticalSpace(size: 6),
        SelectGenderDropdown(
          onSelectGender: (Gender? gender) =>
              onboardingNotifier.updateCrushBasicInfo(gender: gender),
          selectedGender: gender,
        ),
        const VerticalSpace(size: 24),
        Text(
          gender == Gender.none
              ? 'Her/his birthday is'
              : (gender == Gender.male ? 'His birthday is' : 'Her birthday is'),
          style: context.textTheme.titleLarge!.copyWith(color: ref.currentAppColor.textColor),
        ),
        const VerticalSpace(size: 6),
        SelectDateWidget(
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
              ? 'Her/his job is'
              : (gender == Gender.male ? 'His job is' : 'Her job is'),
          style: context.textTheme.titleLarge!.copyWith(color: ref.currentAppColor.textColor),
        ),
        const VerticalSpace(size: 6),
        MyTextField(
          controller: jobController,
          focusNode: jobFocusNode,
          key: const ValueKey('crushJobs'),
          onChanged: (text) {
            onboardingNotifier.updateCrushBasicInfo(job: text);
          },
          hintText: 'Input jobs',
        ),
        const VerticalSpace(size: 24),
        Row(
          children: [
            Icon(
              Icons.privacy_tip_outlined,
              color: ref.currentAppColor.textColor,
            ),
            const HorizontalSpace(size: 6),
            Text(
              'Your information will be safe with us.',
              style: context.textTheme.bodyLarge!.copyWith(color: ref.currentAppColor.textColor),
            ),
          ],
        ),
      ],
    );
  }
}
