import 'package:cupid_mentor/core/navigation/navigation_service.dart';
import 'package:cupid_mentor/core/navigation/routes.dart';
import 'package:cupid_mentor/core/widgets/constraint_size_screen.dart';
import 'package:cupid_mentor/features/auth/presentation/pages/login_screen.dart';
import 'package:cupid_mentor/features/home/presentation/pages/home_screen.dart';
import 'package:cupid_mentor/features/onboarding/presentation/pages/onboarding_screen.dart';
import 'package:cupid_mentor/features/onboarding/presentation/pages/welcome_screen.dart';
import 'package:cupid_mentor/features/profile/presentation/pages/add_partner_screen.dart';
import 'package:cupid_mentor/features/profile/presentation/pages/partner_profile_page.dart';
import 'package:cupid_mentor/features/profile/presentation/pages/your_profile_page.dart';
import 'package:cupid_mentor/features/select_language/presentation/pages/select_language_page.dart';
import 'package:cupid_mentor/features/setting/presentation/pages/about_the_author_screen.dart';
import 'package:cupid_mentor/features/setting/presentation/pages/privacy_policy_page.dart';
import 'package:cupid_mentor/features/setting/presentation/pages/setting_screen.dart';
import 'package:cupid_mentor/features/setting/presentation/pages/term_of_service_page.dart';
import 'package:cupid_mentor/features/showcase/presentation/pages/showcase_screen.dart';
import 'package:cupid_mentor/features/splash_screen/presentation/pages/splash_screen.dart';
import 'package:cupid_mentor/features/tip_date_spots/presentation/pages/tips_date_spot_screen.dart';
import 'package:cupid_mentor/features/tips_gift/presentation/pages/tips_gift_screen.dart';
import 'package:cupid_mentor/features/tips_replying/presentation/pages/tips_replying_screen.dart';
import 'package:cupid_mentor/features/tips_self_improvement/presentation/pages/tips_self_improvement_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final routeProvider = Provider<GoRouter>((ref) {
  final router = GoRouter(
    redirect: (context, state) {
      if (state.matchedLocation != AppRoutes.splash &&
          state.matchedLocation != AppRoutes.showcase &&
          state.matchedLocation != AppRoutes.selectLanguage &&
          state.matchedLocation != AppRoutes.login &&
          FirebaseAuth.instance.currentUser == null) {
        return AppRoutes.splash;
      }
      return null;
    },
    navigatorKey: NavigationService.instance.globalNavigatorKey,
    redirectLimit: 1,
    initialLocation: AppRoutes.splash,
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        pageBuilder: (context, state) => _buildFadeTransitionPage(
          settings: state,
          screen: const SplashScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.selectLanguage,
        pageBuilder: (context, state) => _buildFadeTransitionPage(
          settings: state,
          screen: const SelectLanguagePage(),
        ),
      ),
      GoRoute(
        path: AppRoutes.showcase,
        pageBuilder: (context, state) => _buildFadeTransitionPage(
          settings: state,
          screen: const ShowcaseScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.login,
        pageBuilder: (context, state) => _buildFadeTransitionPage(
          settings: state,
          screen: const LoginScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.onboarding,
        pageBuilder: (context, state) => _buildFadeTransitionPage(
          settings: state,
          screen: const OnboardingScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.welcome,
        pageBuilder: (context, state) => _buildFadeTransitionPage(
          settings: state,
          screen: const WelcomeScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.home,
        pageBuilder: (context, state) => _buildFadeTransitionPage(
          settings: state,
          screen: const HomeScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.tipGift,
        pageBuilder: (context, state) => _buildFadeTransitionPage(
          settings: state,
          screen: const TipsGiftsScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.tipDateSpot,
        pageBuilder: (context, state) => _buildFadeTransitionPage(
          settings: state,
          screen: const TipsDateSpotsScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.tipSelfImprovement,
        pageBuilder: (context, state) => _buildFadeTransitionPage(
          settings: state,
          screen: const TipsSelfImprovementScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.tipReplying,
        pageBuilder: (context, state) => _buildFadeTransitionPage(
          settings: state,
          screen: const TipsReplyingMessageScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.setting,
        pageBuilder: (context, state) => _buildFadeTransitionPage(
          settings: state,
          screen: const SettingScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.profile,
        pageBuilder: (context, state) => _buildFadeTransitionPage(
          settings: state,
          screen: const YourProfilePages(),
        ),
      ),
      GoRoute(
        path: AppRoutes.partnerProfile,
        pageBuilder: (context, state) => _buildFadeTransitionPage(
          settings: state,
          screen: const PartnerProfilePage(),
        ),
      ),
      GoRoute(
        path: AppRoutes.addPartnerProfile,
        pageBuilder: (context, state) => _buildFadeTransitionPage(
          settings: state,
          screen: const AddPartnerScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.aboutTheAuthor,
        pageBuilder: (context, state) => _buildFadeTransitionPage(
          settings: state,
          screen: const AboutTheAuthorScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.termOfService,
        pageBuilder: (context, state) => _buildFadeTransitionPage(
          settings: state,
          screen: const TermOfServicePage(),
        ),
      ),
      GoRoute(
        path: AppRoutes.privacyPolicy,
        pageBuilder: (context, state) => _buildFadeTransitionPage(
          settings: state,
          screen: const PrivacyPolicyPage(),
        ),
      ),
    ],
  );
  return router;
});

Page<T> _buildFadeTransitionPage<T extends Object>({
  required GoRouterState settings,
  required Widget screen,
}) {
  return CustomTransitionPage<T>(
    key: settings.pageKey,
    child: screen,
    transitionDuration: const Duration(milliseconds: 300),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: ConstraintSizeScreen(
          child: child,
        ),
      );
    },
  );
}
