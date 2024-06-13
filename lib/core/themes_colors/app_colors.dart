import 'package:flutter/material.dart';

class AppColors {
  final Color primaryColor;
  final Color secondaryColor;
  final Color screenBackgroundColor;
  final Color buttonBackgroundColor;
  final Color textColor;

  const AppColors(
      {required this.primaryColor,
      required this.secondaryColor,
      required this.screenBackgroundColor,
      required this.buttonBackgroundColor,
      required this.textColor});

  static AppColors dark = AppColors(
    primaryColor: const Color(0xff642CA9),
    secondaryColor: const Color(0xffFF36AB),
    screenBackgroundColor: const Color(0xff1A1A1A),
    buttonBackgroundColor: Colors.white.withOpacity(0.08),
    textColor: const Color(0xffF9FAFB),
  );
  static AppColors light = AppColors(
    primaryColor: const Color(0xff642CA9),
    secondaryColor: const Color(0xffFF36AB),
    screenBackgroundColor: const Color(0xff1A1A1A),
    buttonBackgroundColor: Colors.white.withOpacity(0.08),
    textColor: const Color(0xffF9FAFB),
  );
}
