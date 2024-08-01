import 'package:cupid_mentor/core/usecases/usecase.dart';
import 'package:cupid_mentor/features/localization/domain/use_cases/get_language.dart';
import 'package:cupid_mentor/features/preload_data/presentation/manager/preload_data_notifier.dart';
import 'package:cupid_mentor/features/splash_screen/domain/use_cases/check_is_logged_in.dart';
import 'package:cupid_mentor/features/splash_screen/domain/use_cases/check_need_onboarding.dart';
import 'package:cupid_mentor/features/splash_screen/domain/use_cases/check_need_showcase.dart';
import 'package:cupid_mentor/features/splash_screen/presentation/manager/splash_state.dart';
import 'package:flutter/material.dart';
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

  GetLanguage get getLanguage => ref.read(getLanguageUseCaseProvider);

  Future<void> checkInitialCondition() async {
    debugPrint('checkInitialCondition');
    final languageResult = await getLanguage(NoParams());
    final language = languageResult.getOrElse(() => null);
    if (language == null) {
      state = const SplashState.goToSelectLanguage();
      return;
    }
    final needShowCaseResult = await checkNeedShowCase(NoParams());
    final needShowCase = needShowCaseResult.getOrElse(() => false);
    if (needShowCase) {
      state = const SplashState.goToShowCase();
      return;
    }
    final needLoginResult = await checkNeedLogin(NoParams());
    final needLogin = needLoginResult.getOrElse(() => false);
    if (needLogin) {
      state = const SplashState.goToLogin();
      return;
    }
    final needOnboardingResult = await checkNeedOnboarding(NoParams());
    final needOnboarding = needOnboardingResult.getOrElse(() => false);
    if (needOnboarding) {
      state = const SplashState.goToOnboarding();
    } else {
      state = const SplashState.goToHome();
    }
  }

  Future<void> checkPreloadDataAndInitialCondition() async {
    debugPrint('checkPreloadDataAndInitialCondition');
    ref.listen(preloadDataNotifierProvider, (previous, next) async {
      if (next.isInitializing == true && next.isInitializing != previous?.isInitializing) {
        debugPrint('preload data finished, check initial condition');
        await checkInitialCondition();
      }
    });
  }
}
