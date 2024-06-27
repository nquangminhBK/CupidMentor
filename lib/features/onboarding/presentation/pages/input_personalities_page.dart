import 'package:cupid_mentor/core/constants/personalities.dart';
import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/widgets/custom_tag.dart';
import 'package:cupid_mentor/core/widgets/gradient_outline_input_border.dart';
import 'package:cupid_mentor/core/widgets/text_field.dart';
import 'package:cupid_mentor/core/widgets/vertical_space.dart';
import 'package:cupid_mentor/features/onboarding/presentation/widgets/page_skeleton_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InputPersonalitiesPage extends ConsumerStatefulWidget {
  const InputPersonalitiesPage({super.key});

  @override
  ConsumerState<InputPersonalitiesPage> createState() => _InputPersonalitiesPageState();
}

class _InputPersonalitiesPageState extends ConsumerState<InputPersonalitiesPage> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return PageSkeletonWidget(
      title: "Describe yourself in a few words that we can know the real you 🙄",
      description:
          "Choose some words that best describe your personality. This enables us to enhance your unique and memorable dating experience.",
      children: [
        MyTextField(
          onChanged: (text) {
            debugPrint(text);
          },
          hintText: "Search your personalities",
          suffixIcon: Icon(
            Icons.search_rounded,
            color: ref.currentAppColor.textColor,
          ),
        ),
        const VerticalSpace(size: 16),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: Personalities.personalities
              .map((e) => CustomTag(title: e, isSelected: false, onTap: () {}))
              .toList(),
        ),
      ],
    );
  }
}
