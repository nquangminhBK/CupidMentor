import 'package:cupid_mentor/core/themes_colors/app_colors.dart';
import 'package:flutter/material.dart';

class ThemeState {
  final ThemeMode currentTheme;
  final AppColors currentAppColor;

  ThemeState({required this.currentTheme, required this.currentAppColor});

  ThemeState copyWith({ThemeMode? currentTheme, AppColors? currentAppColor}) => ThemeState(
        currentTheme: currentTheme ?? this.currentTheme,
        currentAppColor: currentAppColor ?? this.currentAppColor,
      );
}
