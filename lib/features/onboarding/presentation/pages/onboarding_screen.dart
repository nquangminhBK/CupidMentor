import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/widgets/horizontal_space.dart';
import 'package:cupid_mentor/core/widgets/progress_bar.dart';
import 'package:cupid_mentor/core/widgets/vertical_space.dart';
import 'package:cupid_mentor/features/onboarding/presentation/pages/input_hobbies_page.dart';
import 'package:cupid_mentor/features/onboarding/presentation/pages/input_basic_info_page.dart';
import 'package:cupid_mentor/features/onboarding/presentation/pages/input_love_languages_page.dart';
import 'package:cupid_mentor/features/onboarding/presentation/pages/input_personalities_page.dart';
import 'package:cupid_mentor/core/widgets/navigate_button.dart';
import 'package:cupid_mentor/features/onboarding/presentation/pages/input_relationship_status_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  int currentIndex = 0;
  PageController pageController = PageController(initialPage: 0);

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
                      totalStep: 10,
                      currentStep: currentIndex,
                      width: context.screenSize.width - 100,
                      color: currentIndex > 4
                          ? ref.currentAppColor.secondaryColor
                          : ref.currentAppColor.primaryColor,
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
                  controller: pageController,
                  children: [
                    InputBasicInfoPage(),
                    InputPersonalitiesPage(),
                    InputHobbiesPage(),
                    InputLoveLanguagesPage(),
                    InputRelationshipStatusPage()
                  ],
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
              ),
              NavigateButton(
                showBackButton: currentIndex != 0,
                showLastButton: currentIndex == 10,
                onPressBack: () {
                  pageController.animateToPage(currentIndex - 1,
                      duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
                  setState(() {
                    currentIndex = currentIndex - 1;
                  });
                },
                onPressNext: () {
                  pageController.animateToPage(currentIndex + 1,
                      duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
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
