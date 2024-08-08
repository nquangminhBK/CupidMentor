import 'package:cupid_mentor/core/assets/assets.gen.dart';
import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
 
import 'package:cupid_mentor/core/navigation/routes.dart';
import 'package:cupid_mentor/core/widgets/animated_button.dart';
import 'package:cupid_mentor/core/widgets/gradient_text.dart';
import 'package:cupid_mentor/core/widgets/vertical_space.dart';
import 'package:cupid_mentor/features/onboarding/presentation/manager/onboarding_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends ConsumerWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfo = ref.watch(onboardingNotifierProvider).userInfo;
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: ref.currentTheme == ThemeMode.dark
                      ? Assets.png.welcomeImage.image()
                      : Assets.png.welcomeImageLight.image(),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Assets.png.appIcon.image(width: 60, height: 60),
                  GradientText(
                    'Cupid Mentor',
                    style: context.textTheme.headlineSmall?.copyWith(
                      fontSize: 40,
                    ),
                    gradient: ref.currentAppColor.mainGradient,
                  ),
                ],
              ),
              const VerticalSpace(size: 16),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  '${context.l10n.welcomeScreenTitle}, ${userInfo.name}',
                  style: context.textTheme.titleLarge!.copyWith(
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Text(
                  context.l10n.welcomeScreenDesc,
                  style: context.textTheme.bodyLarge!.copyWith(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const VerticalSpace(size: 20),
              AnimatedButton(
                onPress: () {
                  context.pushReplacement(AppRoutes.home);
                  ref.invalidate(onboardingNotifierProvider);
                },
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: ref.currentAppColor.primaryColor,
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                  width: double.infinity,
                  height: 48,
                  child: Center(
                    child: Text(
                      context.l10n.letStartButton,
                      style: context.textTheme.titleMedium!.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
              const VerticalSpace(size: 10),
            ],
          ),
        ),
      ),
    );
  }
}
