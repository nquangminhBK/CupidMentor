import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/widgets/gradient_outline_input_border.dart';
import 'package:cupid_mentor/core/widgets/horizontal_space.dart';
import 'package:cupid_mentor/core/widgets/text_field.dart';
import 'package:cupid_mentor/core/widgets/vertical_space.dart';
import 'package:cupid_mentor/features/onboarding/presentation/widgets/page_skeleton_widget.dart';
import 'package:cupid_mentor/features/onboarding/presentation/widgets/select_date_widget.dart';
import 'package:cupid_mentor/features/onboarding/presentation/widgets/select_gender_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InputBasicInfoPage extends ConsumerStatefulWidget {
  const InputBasicInfoPage({super.key});

  @override
  ConsumerState<InputBasicInfoPage> createState() => _InputNamePageState();
}

class _InputNamePageState extends ConsumerState<InputBasicInfoPage> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
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
          onChanged: (text) {
            debugPrint(text);
          },
          hintText: "Enter your name",
        ),
        const VerticalSpace(size: 24),
        Text(
          "Your gender is",
          style: context.textTheme.titleLarge!.copyWith(color: ref.currentAppColor.textColor),
        ),
        const VerticalSpace(size: 6),
        SelectGenderDropdown(),
        const VerticalSpace(size: 24),
        Text(
          "Your birthday is",
          style: context.textTheme.titleLarge!.copyWith(color: ref.currentAppColor.textColor),
        ),
        const VerticalSpace(size: 6),
        SelectDateWidget(
          onDateSelected: (selectedDate) {
            setState(() {
              this.selectedDate = selectedDate;
            });
          },
          selectedDate: selectedDate,
        ),
        const VerticalSpace(size: 24),
        Text(
          "And your job is",
          style: context.textTheme.titleLarge!.copyWith(color: ref.currentAppColor.textColor),
        ),
        const VerticalSpace(size: 6),
        MyTextField(
          onChanged: (text) {
            debugPrint(text);
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
