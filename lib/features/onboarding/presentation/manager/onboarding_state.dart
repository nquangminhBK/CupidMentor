import 'package:cupid_mentor/core/errors/ui_failures.dart';
import 'package:cupid_mentor/features/auth/domain/entities/user_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_state.freezed.dart';

@freezed
abstract class OnboardingState with _$OnboardingState {
  const OnboardingState._();

  const factory OnboardingState({
    required LoggedInUserInfo userInfo,
    required bool canGoNext,
    required UIError? error,
  }) = _OnboardingState;

  factory OnboardingState.initial() =>
      OnboardingState(userInfo: LoggedInUserInfo.empty(), canGoNext: false, error: null);
}
