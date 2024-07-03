import 'package:cupid_mentor/core/constants/datetime.dart';
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
  Widget build(BuildContext context) {
    final state = ref.watch(onboardingNotifierProvider);
    if(kIsWeb) {
      nameController.value = nameController.value.copyWith(
        text: state.userInfo.name,
        selection: TextSelection.collapsed(
          offset: state.userInfo.name.length,
        ),
      );
      jobController.value = jobController.value.copyWith(
        text: state.userInfo.job,
        selection: TextSelection.collapsed(
          offset: state.userInfo.job.length,
        ),
      );
      /*TODO: the reason why we need this is because of this bug
              https://github.com/flutter/flutter/issues/137659
              need to check and update in the future
      */

    } else {
      nameController.text = state.userInfo.name;
      jobController.text = state.userInfo.job;
    }

    return PageSkeletonWidget(
      title: "We're thrilled to have you here. What should we call you? 👋",
      description:
          "The more detailed your answers, the better Cupid Mentor can give personalized suggestions for you. Let's dive in!!!",
      children: [
        Text(
          "Your name is",
          style: context.textTheme.titleLarge!.copyWith(color: ref.currentAppColor.textColor),
        ),
        const VerticalSpace(size: 6),
        MyTextField(
          controller: nameController,
          focusNode: nameFocusNode,
          key: const ValueKey("name"),
          initialText: ref.read(onboardingNotifierProvider).userInfo.name,
          onChanged: (text) {
            ref.read(onboardingNotifierProvider.notifier).updateBasicInfo(name: text);
          },
          hintText: "Enter your name",
        ),
        const VerticalSpace(size: 24),
        Text(
          "Your gender is",
          style: context.textTheme.titleLarge!.copyWith(color: ref.currentAppColor.textColor),
        ),
        const VerticalSpace(size: 6),
        const SelectGenderDropdown(),
        const VerticalSpace(size: 24),
        Text(
          "Your birthday is",
          style: context.textTheme.titleLarge!.copyWith(color: ref.currentAppColor.textColor),
        ),
        const VerticalSpace(size: 6),
        SelectDateWidget(
          onDateSelected: (selectedDate) {
            ref.read(onboardingNotifierProvider.notifier).updateBasicInfo(birthDay: selectedDate);
          },
          selectedDate: state.userInfo.birthday.isSameDate(DateTimeConst.empty())
              ? null
              : state.userInfo.birthday,
        ),
        const VerticalSpace(size: 24),
        Text(
          "And your job is",
          style: context.textTheme.titleLarge!.copyWith(color: ref.currentAppColor.textColor),
        ),
        const VerticalSpace(size: 6),
        MyTextField(
          controller: jobController,
          focusNode: jobFocusNode,
          key: const ValueKey("jobs"),
          onChanged: (text) {
            ref.read(onboardingNotifierProvider.notifier).updateBasicInfo(job: text);
          },
          hintText: "Input your jobs",
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
              "Your information will be safe with us.",
              style: context.textTheme.bodyLarge!.copyWith(color: ref.currentAppColor.textColor),
            )
          ],
        ),
      ],
    );
  }
}
