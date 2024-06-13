import 'package:cupid_mentor/core/themes_colors/app_colors.dart';
import 'package:cupid_mentor/core/themes_colors/theme_state.dart';
import 'package:cupid_mentor/core/themes_colors/themes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'themes_provider.g.dart';

const String themeKey = "theme";

@riverpod
class ThemeNotifier extends _$ThemeNotifier {
  @override
  ThemeState build() {
    return ThemeState(currentTheme: ThemeMode.light, currentAppColor: AppColors.light);
  }

  Future<void> checkInitialTheme() async {
    await GetIt.I.isReady<SharedPreferences>();
    SharedPreferences sharedPreference = GetIt.I<SharedPreferences>();
    String? theme = sharedPreference.getString(themeKey);
    if (theme == null) {
      if (PlatformDispatcher.instance.platformBrightness == Brightness.dark) {
        _setTheme(ThemeEnum.dark);
      } else {
        _setTheme(ThemeEnum.light);
      }
    } else {
      if (ThemeEnum.parse(theme) == ThemeEnum.dark) {
        _setTheme(ThemeEnum.dark);
      } else {
        _setTheme(ThemeEnum.light);
      }
    }
  }

  Future<void> switchTheme() async {
    SharedPreferences sharedPreference = GetIt.I<SharedPreferences>();
    bool isDarkMode = sharedPreference.getString(themeKey) == ThemeEnum.dark.value;
    if (isDarkMode) {
      await _setTheme(ThemeEnum.light);
    } else {
      await _setTheme(ThemeEnum.dark);
    }
  }

  Future<void> _setTheme(ThemeEnum theme) async {
    SharedPreferences sharedPreference = GetIt.I<SharedPreferences>();
    await sharedPreference.setString(themeKey, theme.value);
    state = state.copyWith(
        currentTheme: theme == ThemeEnum.dark ? ThemeMode.dark : ThemeMode.light,
        currentAppColor: theme == ThemeEnum.dark ? AppColors.dark : AppColors.light);
  }
}
