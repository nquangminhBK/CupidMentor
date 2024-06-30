import 'package:cupid_mentor/core/usecases/usecase.dart';
import 'package:cupid_mentor/features/splash_screen/domain/use_cases/check_is_logged_in.dart';
import 'package:cupid_mentor/features/splash_screen/domain/use_cases/check_need_onboarding.dart';
import 'package:cupid_mentor/features/splash_screen/domain/use_cases/check_need_showcase.dart';
import 'package:cupid_mentor/features/splash_screen/presentation/manager/splash_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'splash_notifier.g.dart';

@riverpod
class SplashNotifier extends _$SplashNotifier {
  @override
  SplashState build() {
    return const SplashState.initialized();
  }

  CheckNeedShowCase get checkNeedShowCase => ref.read(checkNeedShowCaseUseCaseProvider);

  CheckNeedOnboarding get checkNeedOnboarding => ref.read(checkNeedOnboardingUseCaseProvider);

  CheckNeedLogin get checkNeedLogin => ref.read(checkNeedLoginUseCaseProvider);

  Future<void> checkInitialCondition() async {
    final needShowCaseResult = await checkNeedShowCase(NoParams());
    needShowCaseResult.fold((failed) => null, (needShowCase) async {
      if (needShowCase) {
        state = const SplashState.goToShowCase();
      } else {
        final needLoginResult = await checkNeedLogin(NoParams());
        needLoginResult.fold((failed) => null, (needLogin) async {
          if (needLogin) {
            state = const SplashState.goToLogin();
          } else {
            final needOnboarding = await checkNeedOnboarding(NoParams());
            needOnboarding.fold((failed) => null, (needOnboarding) async {
              if (needOnboarding) {
                state = const SplashState.goToOnboarding();
              } else {
                state = const SplashState.goToHome();
              }
            });
          }
        });
      }
    });
  }
}
