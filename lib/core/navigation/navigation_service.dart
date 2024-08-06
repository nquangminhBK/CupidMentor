import 'package:flutter/material.dart';

class NavigationService {
  static final NavigationService navigation = NavigationService();

  @visibleForTesting
  static NavigationService? overrideService;

  static NavigationService get instance => overrideService ?? navigation;

  GlobalKey<NavigatorState> globalNavigatorKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState>? getNavigatorKey() => globalNavigatorKey;

  void resetNavigatorKey() {
    globalNavigatorKey = GlobalKey<NavigatorState>();
  }

  /// Returns value from pop if exists.
  /// [clean] is true to remove all back stacks after pushing
  /// [replace] is true to replace the current route by new route
  ///
  /// How to use:
  /// 1. Push:
  /// NavigationService.push(Routes.home);
  /// 2. Push replacement
  /// NavigationService.push(Routes.home, replace: true);
  /// 3. Push replace back stack
  /// NavigationService.push(Routes.home, clean: true);
  /// 4. Push replace remove util
  /// NavigationService.push(Routes.home, replace: true, clean: true);
  ///
  Future<T?>? push<T extends Object>(
    String route, {
    dynamic arguments,
    bool replace = false,
    bool clean = false,
  }) async {
    if (clean) {
      return Navigator.of(getNavigatorKey()!.currentContext!).pushNamedAndRemoveUntil<T>(
        route,
        (_) => false,
        arguments: arguments,
      );
    }

    if (replace) {
      return Navigator.of(getNavigatorKey()!.currentContext!).pushReplacementNamed(
        route,
        arguments: arguments,
      );
    }
    return Navigator.of(getNavigatorKey()!.currentContext!).pushNamed<T>(
      route,
      arguments: arguments,
    );
  }

  Future<T?>? pushNamedAndRemoveUntil<T extends Object>(
    String route, {
    required String oldRoute,
    dynamic arguments,
  }) =>
      Navigator.of(getNavigatorKey()!.currentContext!).pushNamedAndRemoveUntil(
        route,
        (old) => old.settings.name == oldRoute,
        arguments: arguments,
      );

  void popUntil<T extends Object>(String route) =>
      Navigator.of(getNavigatorKey()!.currentContext!).popUntil(
        (r) => r.settings.name == route,
      );

  void pop({dynamic data}) {
    if (getNavigatorKey()!.currentState!.canPop()) {
      getNavigatorKey()!.currentState!.pop(data);
    }
  }

  void popWithGlobalKey({dynamic data}) {
    if (globalNavigatorKey.currentState!.canPop()) {
      globalNavigatorKey.currentState!.pop(data);
    }
  }

  bool get isContextExisted => globalNavigatorKey.currentState?.overlay?.context != null;
}
