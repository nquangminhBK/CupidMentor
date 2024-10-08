import 'package:cupid_mentor/core/constants/relationship_type.dart';
import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/widgets/vertical_space.dart';
import 'package:cupid_mentor/features/onboarding/presentation/manager/onboarding_notifier.dart';
import 'package:cupid_mentor/features/onboarding/presentation/widgets/page_skeleton_widget.dart';
import 'package:cupid_mentor/features/onboarding/presentation/widgets/toggle_button_onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InputRelationshipStatusPage extends ConsumerWidget {
  const InputRelationshipStatusPage({super.key, required this.isOnboarding});

  final bool isOnboarding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasPartner = ref.watch(onboardingNotifierProvider).userInfo.hasPartner;
    final relationship = ref.watch(onboardingNotifierProvider).userInfo.relationship;
    final notifier = ref.read(onboardingNotifierProvider.notifier);
    if (isOnboarding) {
      return PageSkeletonWidget(
        title: context.l10n.inputRelationshipStatusTitle,
        description: context.l10n.inputRelationshipStatusDesc,
        children: [
          ToggleButtonOnboarding(
            isSelected: !hasPartner,
            onChange: () => notifier.updateRelationshipStatus(false),
            title: context.l10n.notHaveYet,
          ),
          const VerticalSpace(size: 16),
          ToggleButtonOnboarding(
            isSelected: hasPartner,
            onChange: () => notifier.updateRelationshipStatus(true),
            title: context.l10n.alreadyHave,
          ),
          const VerticalSpace(size: 32),
          if (hasPartner) ...[
            Text(
              context.l10n.inputRelationshipStatusDesc2,
              style: context.textTheme.bodyLarge,
            ),
            ...RelationshipType.values.map(
              (e) => Padding(
                padding: const EdgeInsets.only(top: 16),
                child: ToggleButtonOnboarding(
                  isSelected: e.value == relationship,
                  onChange: () => notifier.updateRelationship(e),
                  title: e.displayText.value(context),
                ),
              ),
            ),
          ],
        ],
      );
    }
    return PageSkeletonWidget(
      title: context.l10n.addPartnerScreenTitle,
      description: context.l10n.inputRelationshipStatusDesc,
      children: [
        ...RelationshipType.values.map(
          (e) => Padding(
            padding: const EdgeInsets.only(top: 16),
            child: ToggleButtonOnboarding(
              isSelected: e.value == relationship,
              onChange: () => notifier.updateRelationship(e),
              title: e.displayText.value(context),
            ),
          ),
        ),
      ],
    );
  }
}
