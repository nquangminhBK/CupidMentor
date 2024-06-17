import 'package:cupid_mentor/core/constants/hobbies.dart';
import 'package:cupid_mentor/core/constants/personalities.dart';
import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/widgets/custom_tag.dart';
import 'package:cupid_mentor/core/widgets/gradient_outline_input_border.dart';
import 'package:cupid_mentor/core/widgets/vertical_space.dart';
import 'package:cupid_mentor/features/onboarding/presentation/widgets/page_skeleton_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InputHobbiesPage extends ConsumerStatefulWidget {
  const InputHobbiesPage({super.key});

  @override
  ConsumerState<InputHobbiesPage> createState() => _InputHobbiesPageState();
}

class _InputHobbiesPageState extends ConsumerState<InputHobbiesPage> {
  @override
  Widget build(BuildContext context) {
    return PageSkeletonWidget(
      title: "We’re excited to discover your unique interests & passions 🤩",
      description:
          "Feel free to share your hobbies so we can tailor our suggestions perfectly for you.",
      children: [
        SizedBox(
          height: 50,
          child: TextField(
            autofocus: false,
            textInputAction: TextInputAction.done,
            onChanged: (text) {},
            style: context.textTheme.bodyLarge!
                .copyWith(color: ref.currentAppColor.textColor, fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
            cursorColor: Colors.white,
            decoration: InputDecoration(
              suffixIcon: Icon(
                Icons.search_rounded,
                color: ref.currentAppColor.textColor,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 14),
              fillColor: ref.currentAppColor.buttonBackgroundColor,
              filled: true,
              hintText: "Search your hobbies",
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.transparent),
              ),
              focusedBorder: GradientOutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  gradient: ref.currentAppColor.mainGradient),
            ),
          ),
        ),
        const VerticalSpace(size: 16),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: Hobbies.hobbies
              .map((e) => CustomTag(title: e, isSelected: true, onTap: () {}))
              .toList(),
        ),
      ],
    );
  }
}
