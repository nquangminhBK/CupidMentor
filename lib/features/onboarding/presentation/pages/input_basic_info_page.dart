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

class InputBasicInfoPage extends ConsumerStatefulWidget {
  const InputBasicInfoPage({super.key});

  @override
  ConsumerState<InputBasicInfoPage> createState() => _InputBasicInfoPageState();
}

class _InputBasicInfoPageState extends ConsumerState<InputBasicInfoPage> {
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
    final userInfo = ref.watch(onboardingNotifierProvider).userInfo;
    if (kIsWeb) {
      nameController.value = nameController.value.copyWith(
        text: userInfo.name,
        selection: TextSelection.collapsed(
          offset: userInfo.name.length,
        ),
      );
      jobController.value = jobController.value.copyWith(
        text: userInfo.job,
        selection: TextSelection.collapsed(
          offset: userInfo.job.length,
        ),
      );
      /*TODO: the reason why we need this is because of this bug
              https://github.com/flutter/flutter/issues/137659
              need to check and update in the future
      */
    } else {
      nameController.text = userInfo.name;
      jobController.text = userInfo.job;
    }

    return PageSkeletonWidget(
      title: context.l10n.inputBasicInfoTitle,
      description: context.l10n.inputBasicInfoDesc,
      children: [
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
            onboardingNotifier.updateBasicInfo(name: text);
          },
          hintText: context.l10n.nameFieldHint,
        ),
        const VerticalSpace(size: 24),
        Text(
          context.l10n.genderFieldTitle,
          style: context.textTheme.titleLarge,
        ),
        const VerticalSpace(size: 6),
        SelectGenderWidget(
          onSelectGender: (Gender? gender) => onboardingNotifier.updateBasicInfo(gender: gender),
          selectedGender: userInfo.gender,
          hint: context.l10n.genderFieldHint,
        ),
        const VerticalSpace(size: 24),
        Text(
          context.l10n.birthdayFieldTitle,
          style: context.textTheme.titleLarge,
        ),
        const VerticalSpace(size: 6),
        SelectDateWidget(
          hint: context.l10n.birthdayFieldHint,
          onDateSelected: (selectedDate) {
            onboardingNotifier.updateBasicInfo(birthDay: selectedDate);
          },
          selectedDate:
              userInfo.birthday.isSameDate(DateTimeConst.empty()) ? null : userInfo.birthday,
        ),
        const VerticalSpace(size: 24),
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
            onboardingNotifier.updateBasicInfo(job: text);
          },
          hintText: context.l10n.jobFieldHint,
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
