import 'package:flutter/material.dart';

class NavigationService {
  static final NavigationService navigation = NavigationService();

  @visibleForTesting
  static NavigationService? overrideService;

  static NavigationService get instance => overrideService ?? navigation;

  GlobalKey<NavigatorState> globalNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'global_key');
}
