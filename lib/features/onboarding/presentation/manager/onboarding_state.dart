import 'package:cupid_mentor/core/constants/gender.dart';
import 'package:cupid_mentor/features/auth/domain/entities/crush_info.dart';
import 'package:cupid_mentor/features/auth/domain/entities/user_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_state.freezed.dart';

@freezed
abstract class OnboardingState with _$OnboardingState {
  const factory OnboardingState.initialized() = OnboardingInitializedState;

  const factory OnboardingState.infoUpdated(
      {required LoggedInUserInfo userInfo, CrushInfo? crushInfo}) = OnboardingInfoUpdatedState;
}
