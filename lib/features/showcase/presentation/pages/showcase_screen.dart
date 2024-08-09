import 'package:cupid_mentor/core/assets/assets.gen.dart';
import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/navigation/routes.dart';
import 'package:cupid_mentor/core/widgets/gradient_text.dart';
import 'package:cupid_mentor/core/widgets/horizontal_space.dart';
import 'package:cupid_mentor/core/widgets/navigate_button.dart';
import 'package:cupid_mentor/core/widgets/page_indicator.dart';
import 'package:cupid_mentor/core/widgets/vertical_space.dart';
import 'package:cupid_mentor/features/showcase/presentation/manager/showcase_notifier.dart';
import 'package:cupid_mentor/features/showcase/presentation/pages/dating_delights_page.dart';
import 'package:cupid_mentor/features/showcase/presentation/pages/profile_prowess_page.dart';
import 'package:cupid_mentor/features/showcase/presentation/pages/self_enhancement_page.dart';
import 'package:cupid_mentor/features/showcase/presentation/widgets/text_animation_widget.dart';
import 'package:cupid_mentor/features/splash_screen/presentation/manager/splash_notifier.dart';
import 'package:cupid_mentor/features/splash_screen/presentation/manager/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
        context.replace('/${AppRoutes.login}');
      }

      if (previous is! SplashGoToOnboardingState && next is SplashGoToOnboardingState) {
        context.replace('/${AppRoutes.onboarding}');
      }

      if (previous is! SplashGoToHomeState && next is SplashGoToHomeState) {
        context.replace('/${AppRoutes.home}');
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
                mainAxisSize: MainAxisSize.max,
                children: [
                  const HorizontalSpace(size: 24),
                  Assets.png.appIcon.image(width: 40, height: 40),
                  GradientText(
                    'Cupid Mentor',
                    style: context.textTheme.headlineSmall?.copyWith(
                      fontSize: 30,
                    ),
                    gradient: ref.currentAppColor.mainGradient,
                  ),
                ],
              ),
              Expanded(
                child: PageView(
                  controller: pageController,
                  physics: const NeverScrollableScrollPhysics(),
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
              const TextAnimationWidget(),
              const VerticalSpace(size: 17),
              PageIndicator(
                totalCount: 3,
                currentIndex: currentIndex,
              ),
              const VerticalSpace(size: 22),
              NavigateButton(
                showBackButton: false,
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
                  ref.read(showcaseNotifierProvider.notifier).nextPage(currentIndex);
                  Future.delayed(const Duration(milliseconds: 300), () {
                    pageController.animateToPage(
                      currentIndex + 1,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                    setState(() {
                      currentIndex = currentIndex + 1;
                    });
                  });
                },
                onPressLastButton: () async {
                  await ref.read(showcaseNotifierProvider.notifier).updateShowCaseFinish();
                  await ref.read(splashNotifierProvider.notifier).checkInitialCondition();
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
