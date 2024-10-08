import 'package:cupid_mentor/core/assets/assets.gen.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/navigation/routes.dart';
import 'package:cupid_mentor/features/splash_screen/presentation/manager/splash_notifier.dart';
import 'package:cupid_mentor/features/splash_screen/presentation/manager/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(splashNotifierProvider, (previous, next) {
      Future.delayed(const Duration(milliseconds: 200), () {
        if (previous is! SplashGoToSelectLanguageState && next is SplashGoToSelectLanguageState) {
          context.replace('/${AppRoutes.selectLanguage}');
        }

        if (previous is! SplashGoToShowCaseState && next is SplashGoToShowCaseState) {
          context.replace('/${AppRoutes.showcase}');
        }

        if (previous is! SplashGoToLoginState && next is SplashGoToLoginState) {
          context.replace('/${AppRoutes.login}');
        }
        if (previous is! SplashGoToOnboardingState && next is SplashGoToOnboardingState) {
          context.replace('/${AppRoutes.onboarding}');
        }

        if (previous is! SplashGoToHomeState && next is SplashGoToHomeState) {
          context.replace('/${AppRoutes.home}');
        }
      });
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
