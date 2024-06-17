import 'package:cupid_mentor/core/assets/assets.gen.dart';
import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/navigation/navigation_service.dart';
import 'package:cupid_mentor/core/navigation/routes.dart';
import 'package:cupid_mentor/core/widgets/animated_button.dart';
import 'package:cupid_mentor/core/widgets/horizontal_space.dart';
import 'package:cupid_mentor/core/widgets/vertical_space.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Assets.png.datingDelightImage.image(),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Text(
                          "Hi there, let's enter your information initially to start your journey !!!",
                          textAlign: TextAlign.center,
                          style: context.textTheme.bodyLarge,
                        )),
                    const VerticalSpace(size: 20),
                    AnimatedButton(
                        onPress: () {
                          NavigationService.instance.push(AppRoutes.onboarding);
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 24),
                          width: double.infinity,
                          height: 44,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: ref.currentAppColor.buttonBackgroundColor),
                          child: Center(
                            child: Text(
                              "Enter my information",
                              textAlign: TextAlign.center,
                              style: context.textTheme.titleMedium,
                            ),
                          ),
                        )),
                    const VerticalSpace(size: 20),
                    Row(
                      children: [
                        const HorizontalSpace(size: 100),
                        Expanded(
                          child: Container(
                            height: 1,
                            color: Colors.white,
                          ),
                        ),
                        const HorizontalSpace(size: 8),
                        Text(
                          'or',
                          style: context.textTheme.bodyLarge,
                        ),
                        const HorizontalSpace(size: 8),
                        Expanded(
                          child: Container(
                            height: 1,
                            color: Colors.white,
                          ),
                        ),
                        const HorizontalSpace(size: 100),
                      ],
                    ),
                    const VerticalSpace(size: 20),
                    AnimatedButton(
                        onPress: () {},
                        child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 24),
                            width: double.infinity,
                            height: 44,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: ref.currentAppColor.buttonBackgroundColor),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Assets.svg.googleIcon.svg(),
                                const HorizontalSpace(size: 12),
                                Text(
                                  "Continue with Google",
                                  textAlign: TextAlign.center,
                                  style: context.textTheme.titleMedium,
                                ),
                              ],
                            ))),
                    const VerticalSpace(size: 20),
                    AnimatedButton(
                        onPress: () {},
                        child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 24),
                            width: double.infinity,
                            height: 44,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: ref.currentAppColor.buttonBackgroundColor),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Assets.svg.appleIcon.svg(),
                                const HorizontalSpace(size: 12),
                                Text(
                                  "Continue with Apple",
                                  textAlign: TextAlign.center,
                                  style: context.textTheme.titleMedium,
                                ),
                              ],
                            ))),
                    const VerticalSpace(size: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        "By logging in, you agree to our Terms of Conditions. LEarn how we use your data in our Privacy Policy",
                        textAlign: TextAlign.center,
                        style: context.textTheme.bodyLarge,
                      ),
                    ),
                    const VerticalSpace(size: 10),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
