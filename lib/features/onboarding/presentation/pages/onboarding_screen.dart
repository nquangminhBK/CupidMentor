import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/utils/snackbar_utils.dart';
import 'package:cupid_mentor/core/widgets/horizontal_space.dart';
import 'package:cupid_mentor/core/widgets/progress_bar.dart';
import 'package:cupid_mentor/core/widgets/vertical_space.dart';
import 'package:cupid_mentor/features/onboarding/presentation/manager/onboarding_notifier.dart';
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
  @override
  void initState() {
    ref.read(onboardingNotifierProvider.notifier).initializeUserInfo();
    super.initState();
  }

  int currentPage = 0;
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    ref.listen(onboardingNotifierProvider, (previous, next) {
      if (next.errorMessage.isNotEmpty) {
        SnackBarUtils.showErrorSnackBar(
            message: next.errorMessage, context: context, icon: Icons.warning_amber_rounded);
      }
      if (!(previous?.canGoNext ?? false) && next.canGoNext) {
        pageController.animateToPage(currentPage + 1,
            duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
        setState(() {
          currentPage = currentPage + 1;
        });
      }
    });
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
                      currentStep: currentPage,
                      width: context.screenSize.width - 100,
                      color: currentPage > 4
                          ? ref.currentAppColor.secondaryColor
                          : ref.currentAppColor.primaryColor,
                    ),
                  ),
                  SizedBox(
                    width: 70,
                    child: Center(
                      child: Text(
                        "${currentPage + 1}/5",
                        style: context.textTheme.titleSmall!.copyWith(color: ref.currentAppColor.textColor),
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: pageController,
                  children: const [
                    InputBasicInfoPage(),
                    InputPersonalitiesPage(),
                    InputHobbiesPage(),
                    InputLoveLanguagesPage(),
                    InputRelationshipStatusPage()
                  ],
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                ),
              ),
              NavigateButton(
                showBackButton: currentPage != 0,
                showLastButton: currentPage == 10,
                onPressBack: () {
                  pageController.animateToPage(currentPage - 1,
                      duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
                  setState(() {
                    currentPage = currentPage - 1;
                  });
                },
                onPressNext: () {
                  ref.read(onboardingNotifierProvider.notifier).goNextPage(currentPage);
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
