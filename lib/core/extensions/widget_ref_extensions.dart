import 'package:cupid_mentor/core/themes_colors/app_colors.dart';
import 'package:cupid_mentor/core/themes_colors/themes_provider.dart';
import 'package:cupid_mentor/features/preload_data/presentation/manager/preload_data_notifier.dart';
import 'package:cupid_mentor/features/preload_data/presentation/manager/preload_data_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension WidgetRefExtension on WidgetRef {
  AppColors get currentAppColor => watch(themeNotifierProvider).currentAppColor;

  ThemeMode get currentTheme => watch(themeNotifierProvider).currentTheme;

  PreloadDataState get preloadData => read(preloadDataNotifierProvider);
}

extension NotifierProviderRefExtension on NotifierProviderRef {
  PreloadDataState get preloadData => read(preloadDataNotifierProvider);
}
