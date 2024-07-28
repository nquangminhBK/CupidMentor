import 'package:cupid_mentor/core/errors/ui_success.dart';
import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/navigation/navigation_service.dart';
import 'package:cupid_mentor/core/navigation/routes.dart';
import 'package:cupid_mentor/core/utils/snackbar_service.dart';
import 'package:cupid_mentor/core/widgets/horizontal_space.dart';
import 'package:cupid_mentor/core/widgets/navigate_button.dart';
import 'package:cupid_mentor/core/widgets/progress_bar.dart';
import 'package:cupid_mentor/core/widgets/vertical_space.dart';
import 'package:cupid_mentor/features/onboarding/presentation/manager/onboarding_notifier.dart';
import 'package:cupid_mentor/features/onboarding/presentation/pages/input_basic_info_page.dart';
import 'package:cupid_mentor/features/onboarding/presentation/pages/input_partner_basic_info_page.dart';
import 'package:cupid_mentor/features/onboarding/presentation/pages/input_partner_hobbies_page.dart';
import 'package:cupid_mentor/features/onboarding/presentation/pages/input_hobbies_page.dart';
import 'package:cupid_mentor/features/onboarding/presentation/pages/input_love_languages_page.dart';
import 'package:cupid_mentor/features/onboarding/presentation/pages/input_personalities_page.dart';
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
      if (next.errorOrSuccess != null) {
        next.errorOrSuccess!.fold((error) {
          SnackBarService.instance.showErrorSnackBar(
            message: error.getDisplayMessage(context),
            context: context,
            icon: Icons.warning_amber_rounded,
          );
        }, (success) {
          if (success is OnboardingSaveInfoSuccess) {
            NavigationService.instance.push(AppRoutes.welcome, replace: true);
          }
        });
      }
      if (!(previous?.canGoNext ?? false) && next.canGoNext) {
        pageController.animateToPage(
          currentPage + 1,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
        setState(() {
          currentPage = currentPage + 1;
        });
      }
    });
    final state = ref.watch(onboardingNotifierProvider);
    final totalStep = state.userInfo.hasPartner ? 7 : 5;
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
                      totalStep: totalStep,
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
                        '${currentPage + 1}/$totalStep',
                        style: context.textTheme.titleSmall,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: pageController,
                  children: [
                    const InputBasicInfoPage(),
                    const InputPersonalitiesPage(),
                    const InputHobbiesPage(),
                    const InputLoveLanguagesPage(),
                    const InputRelationshipStatusPage(
                      isOnboarding: true,
                    ),
                    if (state.userInfo.hasPartner) ...[
                      const InputPartnerBasicInfoPage(),
                      const InputPartnerHobbiesPage(),
                    ],
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
                  pageController.animateToPage(
                    currentPage - 1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                  setState(() {
                    currentPage = currentPage - 1;
                  });
                },
                onPressNext: () async {
                  if (currentPage == totalStep - 1) {
                    await ref.read(onboardingNotifierProvider.notifier).saveUser();
                  } else {
                    await ref
                        .read(onboardingNotifierProvider.notifier)
                        .goNextPage(currentPage, true);
                  }
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
