import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/widgets/horizontal_space.dart';
import 'package:cupid_mentor/core/widgets/progress_bar.dart';
import 'package:cupid_mentor/core/widgets/vertical_space.dart';
import 'package:cupid_mentor/features/onboarding/presentation/pages/input_name_page.dart';
import 'package:cupid_mentor/features/showcase/presentation/pages/dating_delights_page.dart';
import 'package:cupid_mentor/features/showcase/presentation/pages/profile_prowess_page.dart';
import 'package:cupid_mentor/features/showcase/presentation/pages/self_enhancement_page.dart';
import 'package:cupid_mentor/core/widgets/navigate_button.dart';
import 'package:cupid_mentor/core/widgets/page_indicator.dart';
import 'package:cupid_mentor/features/showcase/presentation/widgets/skip_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Row(
                children: [
                  const HorizontalSpace(size: 30),
                  Expanded(
                    child: ProgressBar(
                      totalStep: 6,
                      currentStep: currentIndex,
                      width: context.screenSize.width - 100,
                    ),
                  ),
                  SizedBox(
                    width: 70,
                    child: Center(
                      child: Text(
                        "5/7",
                        style: context.textTheme.titleSmall,
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                child: PageView(
                  children: [
                    InputNamePage(),
                  ],
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
              ),
              const VerticalSpace(size: 17),
              NavigateButton(
                showBackButton: currentIndex != 0,
                showLastButton: currentIndex == 2,
                onPressBack: () {},
                onPressNext: () {
                  setState(() {
                    currentIndex = currentIndex + 1;
                  });
                },
                onPressLastButton: () {},
                lastButtonTitle: '',
              ),
              const VerticalSpace(size: 10),
            ],
          ),
        ),
      ),
    );
  }
}
