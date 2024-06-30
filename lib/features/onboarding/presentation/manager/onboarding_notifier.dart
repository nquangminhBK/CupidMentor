import 'package:cupid_mentor/features/onboarding/presentation/manager/onboarding_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'onboarding_notifier.g.dart';
@riverpod
class OnboardingNotifier extends _$OnboardingNotifier {
  @override
  OnboardingState build() {
    return const OnboardingState.initialized();
  }
}