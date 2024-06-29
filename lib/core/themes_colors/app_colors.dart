import 'package:flutter/material.dart';

class AppColors {
  final Color primaryColor;
  final Color secondaryColor;
  final Color screenBackgroundColor;
  final Color buttonBackgroundColor;
  final Color textColor;
  final Color cardColorWithoutOpacity;
  final Gradient mainGradient;

  const AppColors(
      {required this.primaryColor,
      required this.secondaryColor,
      required this.screenBackgroundColor,
      required this.buttonBackgroundColor,
      required this.cardColorWithoutOpacity,
      required this.mainGradient,
      required this.textColor});

  static AppColors dark = AppColors(
    primaryColor: const Color(0xff642CA9),
    secondaryColor: const Color(0xffFF36AB),
    screenBackgroundColor: const Color(0xff1A1A1A),
    buttonBackgroundColor: Colors.white.withOpacity(0.08),
    cardColorWithoutOpacity: const Color(0xff282828),
    textColor: const Color(0xffF9FAFB),
    mainGradient: const LinearGradient(
      colors: [
        Color(0xff642ca9),
        Color(0xffff36ab),
      ],
    ),
  );
  static AppColors light = AppColors(
    primaryColor: const Color(0xff642CA9),
    secondaryColor: const Color(0xffFF36AB),
    screenBackgroundColor: const Color(0xff1A1A1A),
    cardColorWithoutOpacity: const Color(0xff282828),
    buttonBackgroundColor: Colors.white.withOpacity(0.08),
    textColor: const Color(0xffF9FAFB),
    mainGradient: const LinearGradient(
      colors: [
        Color(0xff642ca9),
        Color(0xffff36ab),
      ],
    ),
  );
}
