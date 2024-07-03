import 'package:cupid_mentor/core/constants/relationship_type.dart';
import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
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
    final state = ref.watch(onboardingNotifierProvider);
    return PageSkeletonWidget(
        title: "Have you found your perfect match? 😘",
        description: "Let us know if there's someone special in your life.",
        children: [
          ToggleButtonOnboarding(
            isSelected: state.userInfo.hasCrush,
            onChange: () =>
                ref.read(onboardingNotifierProvider.notifier).updateRelationshipStatus(true),
            title: 'Already have',
          ),
          const VerticalSpace(size: 16),
          ToggleButtonOnboarding(
            isSelected: !state.userInfo.hasCrush,
            onChange: () =>
                ref.read(onboardingNotifierProvider.notifier).updateRelationshipStatus(false),
            title: 'Not have yet',
          ),
          const VerticalSpace(size: 32),
          if (state.userInfo.hasCrush) ...[
            Text(
              "Wow that's wonderful! Congratulations! So what's your relationship with that special someone?",
              style: context.textTheme.bodyLarge!.copyWith(color: ref.currentAppColor.textColor),
            ),
            ...RelationshipType.relationshipTypes().map((e) => Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: ToggleButtonOnboarding(
                    isSelected: e.value == state.userInfo.crushType,
                    onChange: () =>
                        ref.read(onboardingNotifierProvider.notifier).updateCrushType(e),
                    title: e.value,
                  ),
                )),
          ]
        ]);
  }
}
