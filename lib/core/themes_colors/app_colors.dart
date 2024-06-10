import 'package:flutter/material.dart';

class AppColors {
  final Color primaryColor;
  final Color secondaryColor;
  final Color screenBackgroundColor;

  const AppColors({
    required this.primaryColor,
    required this.secondaryColor,
    required this.screenBackgroundColor,
  });

  static const AppColors darkColor = AppColors(
      primaryColor: Color(0xff642CA9),
      secondaryColor: Color(0xffFF36AB),
      screenBackgroundColor: Color(0xff1A1A1A));
  static const AppColors lightColor = AppColors(
      primaryColor: Color(0xff642CA9),
      secondaryColor: Color(0xffFF36AB),
      screenBackgroundColor: Colors.white);
}
