import 'package:cupid_mentor/core/assets/assets.gen.dart';
import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/navigation/navigation_service.dart';
import 'package:cupid_mentor/core/navigation/routes.dart';
import 'package:cupid_mentor/core/utils/loading_utils.dart';
import 'package:cupid_mentor/core/widgets/animated_button.dart';
import 'package:cupid_mentor/core/widgets/gradient_text.dart';
import 'package:cupid_mentor/core/widgets/horizontal_space.dart';
import 'package:cupid_mentor/core/widgets/vertical_space.dart';
import 'package:cupid_mentor/features/auth/presentation/manager/auth_notifier.dart';
import 'package:cupid_mentor/features/auth/presentation/manager/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(authNotifierProvider, (previous, next) {
      if (next is AuthLoadingState) {
        LoadingUtils.showLoading(message: 'Logging in...');
      } else {
        LoadingUtils.hideLoading();
      }
      if (previous is! AuthGoToOnboardingState && next is AuthGoToOnboardingState) {
        NavigationService.instance.push(AppRoutes.onboarding, replace: true);
      }
      if (previous is! AuthGoToHomeState && next is AuthGoToHomeState) {
        NavigationService.instance.push(AppRoutes.home, replace: true);
      }
    });
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: ref.currentTheme == ThemeMode.dark
                        ? Assets.png.loginImage.image()
                        : Assets.png.loginImageLight.image(),
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Assets.png.appIcon.image(width: 60, height: 60),
                      GradientText(
                        'Cupid Mentor',
                        style: context.textTheme.titleLarge?.copyWith(
                          fontSize: 40,
                        ),
                        gradient: ref.currentAppColor.mainGradient,
                      ),
                    ],
                  ),
                  const VerticalSpace(size: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      "To start your journey, let's",
                      textAlign: TextAlign.center,
                      style: context.textTheme.bodyLarge!.copyWith(fontSize: 16),
                    ),
                  ),
                  const VerticalSpace(size: 10),
                  AnimatedButton(
                    onPress: () async {
                      await ref.read(authNotifierProvider.notifier).login();
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                      width: double.infinity,
                      height: 44,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: ref.currentAppColor.buttonBackgroundColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Assets.svg.googleIcon.svg(),
                          const HorizontalSpace(size: 12),
                          Text(
                            'Continue with Google',
                            textAlign: TextAlign.center,
                            style: context.textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const VerticalSpace(size: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      'By logging in, you agree to our Terms of Conditions. LEarn how we use your data in our Privacy Policy',
                      textAlign: TextAlign.center,
                      style: context.textTheme.bodyLarge,
                    ),
                  ),
                  const VerticalSpace(size: 10),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
