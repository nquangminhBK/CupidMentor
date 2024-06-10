import 'package:cupid_mentor/core/themes_colors/app_colors.dart';
import 'package:cupid_mentor/core/themes_colors/theme_state.dart';
import 'package:cupid_mentor/core/themes_colors/themes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'themes_provider.g.dart';

const String themeKey = "theme";

@riverpod
class ThemeNotifier extends _$ThemeNotifier {
  @override
  ThemeState build() {
    return ThemeState(currentTheme: ThemeMode.light, currentAppColor: AppColors.lightColor);
  }

  Future<void> checkInitialTheme() async {
    await GetIt.I.isReady<SharedPreferences>();
    SharedPreferences sharedPreference = GetIt.I<SharedPreferences>();
    String? theme = sharedPreference.getString(themeKey);
    if (theme == null) {
      if (PlatformDispatcher.instance.platformBrightness == Brightness.dark) {
        setDarkTheme();
      } else {
        setLightTheme();
      }
    } else {
      if (ThemeEnum.parse(theme) == ThemeEnum.dark) {
        setDarkTheme();
      } else {
        setLightTheme();
      }
    }
  }

  Future<void> setDarkTheme() async {
    SharedPreferences sharedPreference = GetIt.I<SharedPreferences>();
    await sharedPreference.setString(themeKey, ThemeEnum.dark.value);
    state = state.copyWith(currentTheme: ThemeMode.dark, currentAppColor: AppColors.darkColor);
    debugPrint("set dark theme");
  }

  Future<void> setLightTheme() async {
    SharedPreferences sharedPreference = GetIt.I<SharedPreferences>();
    await sharedPreference.setString(themeKey, ThemeEnum.light.value);
    state = state.copyWith(currentTheme: ThemeMode.light, currentAppColor: AppColors.lightColor);
    debugPrint("set light theme");
  }

  Future<void> switchTheme() async {
    SharedPreferences sharedPreference = GetIt.I<SharedPreferences>();
    bool isDarkMode = sharedPreference.getString(themeKey) == ThemeEnum.dark.value;
    if (isDarkMode) {
      await setLightTheme();
    } else {
      await setDarkTheme();
    }
  }
}
