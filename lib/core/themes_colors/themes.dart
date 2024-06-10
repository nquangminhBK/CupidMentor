import 'package:cupid_mentor/core/themes_colors/app_colors.dart';
import 'package:cupid_mentor/core/themes_colors/text_themes.dart';
import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme(context) => ThemeData.light(useMaterial3: false).copyWith(
        brightness: Brightness.light,
        primaryColor: AppColors.darkColor.primaryColor,
        // hintColor: AppColors.darkColor.hintColor,
        // cardColor: AppColors.darkColor.itemListBackgroundColor,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        textTheme: TextThemes.textTheme(context),
      );

  static ThemeData darkTheme(context) => ThemeData.dark(useMaterial3: false).copyWith(
        brightness: Brightness.dark,
        primaryColor: AppColors.lightColor.primaryColor,
        // hintColor: Colors.grey,
        // cardColor: AppColors.lightColor.itemListBackgroundColor,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        textTheme: TextThemes.textTheme(context),
      );
}

enum ThemeEnum {
  light("light"),
  dark("dark");

  final String value;

  const ThemeEnum(this.value);

  static ThemeEnum parse(String theme) {
    return ThemeEnum.values
        .firstWhere((element) => element.value == theme, orElse: () => ThemeEnum.light);
  }
}
