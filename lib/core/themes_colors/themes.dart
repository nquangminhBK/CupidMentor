import 'package:cupid_mentor/core/themes_colors/app_colors.dart';
import 'package:cupid_mentor/core/themes_colors/text_themes.dart';
import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme(context) => ThemeData.light(useMaterial3: false).copyWith(
        brightness: Brightness.light,
        primaryColor: AppColors.dark.primaryColor,
        scaffoldBackgroundColor: AppColors.dark.screenBackgroundColor,
        // hintColor: AppColors.darkColor.hintColor,
        // cardColor: AppColors.darkColor.itemListBackgroundColor,

        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        textTheme: TextThemes.textTheme(context)
            .apply(displayColor: AppColors.light.textColor, bodyColor: AppColors.light.textColor),
      );

  static ThemeData darkTheme(context) => ThemeData.dark(useMaterial3: false).copyWith(
        brightness: Brightness.dark,
        primaryColor: AppColors.light.primaryColor,
        scaffoldBackgroundColor: AppColors.light.screenBackgroundColor,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        textTheme: TextThemes.textTheme(context)
            .apply(displayColor: AppColors.dark.textColor, bodyColor: AppColors.dark.textColor),
      );
}

enum ThemeEnum {
  light('light'),
  dark('dark');

  final String value;

  const ThemeEnum(this.value);

  static ThemeEnum parse(String theme) => ThemeEnum.values
      .firstWhere((element) => element.value == theme, orElse: () => ThemeEnum.light);
}
