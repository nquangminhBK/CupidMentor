import 'package:cupid_mentor/core/navigation/navigation_service.dart';
import 'package:cupid_mentor/core/navigation/routes.dart';
import 'package:cupid_mentor/core/widgets/navigate_button.dart';
import 'package:cupid_mentor/core/widgets/page_indicator.dart';
import 'package:cupid_mentor/core/widgets/vertical_space.dart';
import 'package:cupid_mentor/features/showcase/presentation/pages/dating_delights_page.dart';
import 'package:cupid_mentor/features/showcase/presentation/pages/profile_prowess_page.dart';
import 'package:cupid_mentor/features/showcase/presentation/pages/self_enhancement_page.dart';
import 'package:cupid_mentor/features/showcase/presentation/widgets/skip_button.dart';
import 'package:cupid_mentor/features/splash_screen/presentation/manager/splash_notifier.dart';
import 'package:cupid_mentor/features/splash_screen/presentation/manager/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShowcaseScreen extends ConsumerStatefulWidget {
  const ShowcaseScreen({super.key});

  @override
  ConsumerState<ShowcaseScreen> createState() => _ShowcasePageState();
}

class _ShowcasePageState extends ConsumerState<ShowcaseScreen> {
  int currentIndex = 0;
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    ref.listen(splashNotifierProvider, (previous, next) {
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
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              SkipButton(
                visible: currentIndex != 2,
                onPress: () {
                  pageController.animateToPage(
                    2,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                  setState(() {
                    currentIndex = 2;
                  });
                },
              ),
              Expanded(
                child: PageView(
                  controller: pageController,
                  children: const [
                    ProfileProwessPage(),
                    SelfEnhancementPage(),
                    DatingDelightPage(),
                  ],
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
              ),
              const VerticalSpace(size: 17),
              PageIndicator(
                totalCount: 3,
                currentIndex: currentIndex,
              ),
              const VerticalSpace(size: 22),
              NavigateButton(
                showBackButton: currentIndex != 0,
                showLastButton: currentIndex == 2,
                onPressBack: () {
                  pageController.animateToPage(
                    currentIndex - 1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                  setState(() {
                    currentIndex = currentIndex - 1;
                  });
                },
                onPressNext: () {
                  pageController.animateToPage(
                    currentIndex + 1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                  setState(() {
                    currentIndex = currentIndex + 1;
                  });
                },
                onPressLastButton: () {
                  ref.read(splashNotifierProvider.notifier).checkInitialCondition();
                },
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
