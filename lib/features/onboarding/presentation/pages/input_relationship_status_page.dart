import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/widgets/vertical_space.dart';
import 'package:cupid_mentor/features/onboarding/presentation/widgets/page_skeleton_widget.dart';
import 'package:cupid_mentor/features/onboarding/presentation/widgets/toggle_button_onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InputRelationshipStatusPage extends ConsumerStatefulWidget {
  const InputRelationshipStatusPage({super.key});

  @override
  ConsumerState<InputRelationshipStatusPage> createState() => _InputRelationshipStatusPageState();
}

class _InputRelationshipStatusPageState extends ConsumerState<InputRelationshipStatusPage> {
  @override
  Widget build(BuildContext context) {
    return PageSkeletonWidget(
        title: "Have you found your perfect match? 😘",
        description: "Let us know if there's someone special in your life.",
        children: [
          ToggleButtonOnboarding(
            isSelected: true,
            onChange: (){},
            title: 'Already have',
          ),
          const VerticalSpace(size: 16),
          ToggleButtonOnboarding(
            isSelected: false,
            onChange: (){},
            title: 'Not have yet',
          ),
          const VerticalSpace(size: 32),
          Text(
            "Wow that's wonderful! Congratulations! So what's your relationship with that special someone?",
            style: context.textTheme.bodyLarge,
          ),
          const VerticalSpace(size: 24),
          ToggleButtonOnboarding(
            isSelected: true,
            onChange: (){},
            title: 'Crush',
          ),
          const VerticalSpace(size: 16),
          ToggleButtonOnboarding(
            isSelected: false,
            onChange: (){},
            title: 'Friends',
          ),
          const VerticalSpace(size: 16),
          ToggleButtonOnboarding(
            isSelected: false,
            onChange: (){},
            title: 'Lover',
          ),
        ]);
  }
}
