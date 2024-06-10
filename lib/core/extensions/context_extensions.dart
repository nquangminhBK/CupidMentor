import 'package:cupid_mentor/core/themes_colors/app_colors.dart';
import 'package:cupid_mentor/core/themes_colors/themes_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension BuildContextExtension on BuildContext {
  Orientation get orientation => MediaQuery.of(this).orientation;

  Size get screenSize => MediaQuery.of(this).size;
}

extension WidgetRefExtension on WidgetRef {
  AppColors get currentAppColor => watch(themeNotifierProvider).currentAppColor;

  ThemeMode get currentTheme => watch(themeNotifierProvider).currentTheme;
}
