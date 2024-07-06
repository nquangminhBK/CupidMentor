import 'package:cupid_mentor/core/assets/assets.gen.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/navigation/navigation_service.dart';
import 'package:cupid_mentor/core/navigation/routes.dart';
import 'package:cupid_mentor/features/splash_screen/presentation/manager/splash_notifier.dart';
import 'package:cupid_mentor/features/splash_screen/presentation/manager/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    ref.read(splashNotifierProvider.notifier).checkInitialCondition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(splashNotifierProvider, (previous, next) {

      if (previous is! SplashGoToSelectLanguageState && next is SplashGoToSelectLanguageState) {
        NavigationService.instance.push(AppRoutes.selectLanguage, replace: true);
      }

      if (previous is! SplashGoToShowCaseState && next is SplashGoToShowCaseState) {
        NavigationService.instance.push(AppRoutes.showcase, replace: true);
      }

      if (previous is! SplashGoToLoginState && next is SplashGoToLoginState) {
        NavigationService.instance.push(AppRoutes.login, replace: true);
      }

      if (previous is! SplashGoToOnboardingState && next is SplashGoToOnboardingState) {
        NavigationService.instance.push(AppRoutes.onboarding, replace: true);
      }

      if (previous is! SplashGoToHomeState && next is SplashGoToHomeState) {
        NavigationService.instance.push(AppRoutes.home, replace: true);
      }
    });
    return Container(
      color: ref.currentAppColor.screenBackgroundColor,
      child: SafeArea(
        child: Center(
          child: Assets.png.appIcon.image(width: 200, height: 200),
        ),
      ),
    );
  }
}
