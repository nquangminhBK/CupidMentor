import 'package:cupid_mentor/core/navigation/routes.dart';
import 'package:cupid_mentor/core/widgets/adaptive_screen.dart';
import 'package:cupid_mentor/features/auth/presentation/pages/login_screen.dart';
import 'package:cupid_mentor/features/home/presentation/pages/home_screen.dart';
import 'package:cupid_mentor/features/localization/presentation/pages/select_language_page.dart';
import 'package:cupid_mentor/features/onboarding/presentation/pages/onboarding_screen.dart';
import 'package:cupid_mentor/features/onboarding/presentation/pages/welcome_screen.dart';
import 'package:cupid_mentor/features/setting/presentation/pages/setting_screen.dart';
import 'package:cupid_mentor/features/showcase/presentation/pages/showcase_screen.dart';
import 'package:cupid_mentor/features/splash_screen/presentation/pages/splash_screen.dart';
import 'package:cupid_mentor/features/tip_date_spots/presentation/pages/tips_date_spot_screen.dart';
import 'package:cupid_mentor/features/tips_gift/presentation/pages/tips_gift_screen.dart';
import 'package:cupid_mentor/features/tips_replying/presentation/pages/tips_replying_screen.dart';
import 'package:cupid_mentor/features/tips_self_improvement/presentation/pages/tips_self_improvement_screen.dart';
import 'package:flutter/material.dart';

Route<Object>? generateRoute(RouteSettings settings) {
  debugPrint('\n=============== >> Navigating to: ${settings.name}\n');
  //final args = settings.arguments;
  switch (settings.name) {
    case AppRoutes.splash:
      return _buildRoute(
        settings: settings,
        screen: const SplashScreen(),
      );
    case AppRoutes.selectLanguage:
      return _buildRoute(
        settings: settings,
        screen: const SelectLanguagePage(),
      );
    case AppRoutes.showcase:
      return _buildRoute(
        settings: settings,
        screen: const ShowcaseScreen(),
      );
    case AppRoutes.login:
      return _buildRoute(
        settings: settings,
        screen: const LoginScreen(),
      );
    case AppRoutes.onboarding:
      return _buildRoute(
        settings: settings,
        screen: const OnboardingScreen(),
      );
    case AppRoutes.welcome:
      return _buildRoute(
        settings: settings,
        screen: const WelcomeScreen(),
      );
    case AppRoutes.home:
      return _buildRoute(
        settings: settings,
        screen: const HomeScreen(),
      );
    case AppRoutes.tipGift:
      return _buildRoute(
        settings: settings,
        screen: const TipsGiftsScreen(),
      );
    case AppRoutes.tipDateSpot:
      return _buildRoute(
        settings: settings,
        screen: const TipsDateSpotsScreen(),
      );
    case AppRoutes.tipSelfImprovement:
      return _buildRoute(
        settings: settings,
        screen: const TipsSelfImprovementScreen(),
      );
    case AppRoutes.tipReplying:
      return _buildRoute(
        settings: settings,
        screen: const TipsReplyingMessageScreen(),
      );
    case AppRoutes.setting:
      return _buildRoute(
        settings: settings,
        screen: const SettingScreen(),
      );
    default:
      return _errorRoute();
  }
}

Route<Object>? _errorRoute() => MaterialPageRoute(
      builder: (_) => AdaptiveScreen(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Error'),
          ),
          body: const Center(
            child: Text('ERROR'),
          ),
        ),
      ),
    );

Route<T>? _buildRoute<T extends Object>({
  required RouteSettings settings,
  required Widget screen,
}) =>
    MaterialPageRoute<T>(
      settings: settings,
      builder: (context) => AdaptiveScreen(
        child: screen,
      ),
    );

class NoAnimationMaterialPageRoute<T> extends MaterialPageRoute<T> {
  NoAnimationMaterialPageRoute({
    required super.builder,
    required RouteSettings super.settings,
    super.maintainState,
    super.fullscreenDialog,
  });

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) =>
      child;
}

class FadePageRoute<T> extends PageRoute<T> {
  FadePageRoute(this.child);

  final Widget child;

  @override
  Color get barrierColor => Colors.black;

  @override
  String get barrierLabel => '';

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 700);

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) =>
      FadeTransition(
        opacity: animation,
        child: child,
      );
}
