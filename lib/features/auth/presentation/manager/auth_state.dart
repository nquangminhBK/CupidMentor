import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.initialized() = AuthInitializedState;

  const factory AuthState.loading() = AuthLoadingState;

  const factory AuthState.loginSuccess() = AuthLoginSuccessState;

  const factory AuthState.loginFailed() = AuthStateLoginFailedState;

  const factory AuthState.goToOnboarding() = AuthGoToOnboardingState;

  const factory AuthState.goToHome() = AuthGoToHomeState;
}
