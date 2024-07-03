import 'package:cupid_mentor/core/assets/assets.gen.dart';
import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/navigation/navigation_service.dart';
import 'package:cupid_mentor/core/navigation/routes.dart';
import 'package:cupid_mentor/core/widgets/animated_button.dart';
import 'package:cupid_mentor/core/widgets/vertical_space.dart';
import 'package:cupid_mentor/features/onboarding/presentation/manager/onboarding_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
              Expanded(child: Assets.png.welcomeDark.image()),
              Text(
                'Welcome, ${userInfo.name}',
                style: context.textTheme.titleLarge!
                    .copyWith(fontSize: 30, color: ref.currentAppColor.textColor),
                textAlign: TextAlign.center,
              ),
              const VerticalSpace(size: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Text(
                  'Get ready with us to discover all the amazing features we have in store for you!',
                  style: context.textTheme.bodyLarge!
                      .copyWith(fontSize: 20, color: ref.currentAppColor.textColor),
                  textAlign: TextAlign.center,
                ),
              ),
              const VerticalSpace(size: 56),
              AnimatedButton(
                onPress: () {
                  NavigationService.instance.push(AppRoutes.home, replace: true);
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
                      "Okay, let's start",
                      style: context.textTheme.titleMedium!
                          .copyWith(color: ref.currentAppColor.textColor),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
