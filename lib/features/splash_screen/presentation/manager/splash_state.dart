import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_state.freezed.dart';

@freezed
abstract class SplashState with _$SplashState {
  const factory SplashState.initialized() = SplashInitializedState;

  const factory SplashState.goToLogin() = SplashGoToLoginState;

  const factory SplashState.goToSelectLanguage() = SplashGoToSelectLanguageState;

  const factory SplashState.goToOnboarding() = SplashGoToOnboardingState;

  const factory SplashState.goToShowCase() = SplashGoToShowCaseState;

  const factory SplashState.goToHome() = SplashGoToHomeState;
}
