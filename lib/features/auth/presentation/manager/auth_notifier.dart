import 'package:cupid_mentor/core/usecases/usecase.dart';
import 'package:cupid_mentor/features/auth/domain/use_cases/signin.dart';
import 'package:cupid_mentor/features/auth/presentation/manager/auth_state.dart';
import 'package:cupid_mentor/features/splash_screen/domain/use_cases/check_need_onboarding.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_notifier.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  AuthState build() {
    return const AuthState.initialized();
  }

  CheckNeedOnboarding get checkNeedOnboarding => ref.read(checkNeedOnboardingUseCaseProvider);

  LoginUseCase get loginUseCase => ref.read(loginUseCaseProvider);

  Future<void> login() async {
    state = const AuthState.loading();
    final loginResult = await loginUseCase(NoParams());
    loginResult.fold((failed) {
      state = const AuthState.loginFailed();
    }, (result) async {
      if (result) {
        final checkNeedOnboardingResult = await checkNeedOnboarding(NoParams());
        checkNeedOnboardingResult.fold((l) {
          state = const AuthState.goToOnboarding();
        }, (result) {
          if (result) {
            state = const AuthState.goToOnboarding();
          } else {
            state = const AuthState.goToHome();
          }
        });
      } else {
        state = const AuthState.loginFailed();
      }
    });
  }
}
