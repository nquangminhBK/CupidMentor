import 'package:cupid_mentor/core/navigation/routes.dart';
import 'package:cupid_mentor/core/widgets/adaptive_screen.dart';
import 'package:flutter/material.dart';

Route<Object>? generateRoute(RouteSettings settings) {
  debugPrint('\n=============== >> Navigating to: ${settings.name}\n');
  final args = settings.arguments;
  switch (settings.name) {
    case AppRoutes.splash:
      return _buildRoute(
        settings: settings,
        screen: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.red,
        ),
        screenName: 'Splash Page',
      );
    default:
      return _errorRoute();
  }
}
Route<Object>? _errorRoute() {
  return MaterialPageRoute(
    builder: (_) {
      return AdaptiveScreen(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Error'),
          ),
          body: const Center(
            child: Text('ERROR'),
          ),
        ),
      );
    },
  );
}
Route<T>? _buildRoute<T extends Object>({
  required RouteSettings settings,
  required Widget screen,
  required String screenName,
}) {
  return MaterialPageRoute<T>(
    settings: settings,
    builder: (context) {
      return AdaptiveScreen(
        child: screen,
      );
    },
  );
}

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
  ) {
    return child;
  }
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
  ) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}
