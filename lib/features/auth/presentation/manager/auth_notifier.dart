import 'package:cupid_mentor/core/usecases/usecase.dart';
import 'package:cupid_mentor/features/auth/domain/use_cases/signin.dart';
import 'package:cupid_mentor/features/auth/presentation/manager/auth_state.dart';
import 'package:cupid_mentor/features/splash_screen/domain/use_cases/check_need_onboarding.dart';
import 'package:cupid_mentor/features/splash_screen/presentation/manager/splash_notifier.dart';
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
    await loginResult.fold((failed) {
      state = const AuthState.loginFailed();
    }, (result) async {
      if (result) {
        state = const AuthState.loginSuccess();
        await ref.read(splashNotifierProvider.notifier).checkInitialCondition();
      } else {
        state = const AuthState.loginFailed();
      }
    });
  }
}
