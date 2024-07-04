import 'package:cupid_mentor/core/constants/relationship_type.dart';
import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/widgets/vertical_space.dart';
import 'package:cupid_mentor/features/onboarding/presentation/manager/onboarding_notifier.dart';
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
    final hasCrush = ref.watch(onboardingNotifierProvider).userInfo.hasCrush;
    final crushType = ref.watch(onboardingNotifierProvider).userInfo.crushType;
    final notifier = ref.read(onboardingNotifierProvider.notifier);
    return PageSkeletonWidget(
      title: 'Have you found your perfect match? 😘',
      description: "Let us know if there's someone special in your life.",
      children: [
        ToggleButtonOnboarding(
          isSelected: !hasCrush,
          onChange: () => notifier.updateRelationshipStatus(false),
          title: 'Not have yet',
        ),
        const VerticalSpace(size: 16),
        ToggleButtonOnboarding(
          isSelected: hasCrush,
          onChange: () => notifier.updateRelationshipStatus(true),
          title: 'Already have',
        ),
        const VerticalSpace(size: 32),
        if (hasCrush) ...[
          Text(
            "Wow that's wonderful! Congratulations! So what's your relationship with that special someone?",
            style: context.textTheme.bodyLarge,
          ),
          ...RelationshipType.relationshipTypes().map(
            (e) => Padding(
              padding: const EdgeInsets.only(top: 16),
              child: ToggleButtonOnboarding(
                isSelected: e.value == crushType,
                onChange: () => notifier.updateCrushType(e),
                title: e.value,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
