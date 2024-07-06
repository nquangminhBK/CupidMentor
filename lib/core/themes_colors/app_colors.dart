import 'package:flutter/material.dart';

class AppColors {
  final Color primaryColor;
  final Color secondaryColor;
  final Color screenBackgroundColor;
  final Color buttonBackgroundColor;
  final Color textColor;
  final Color cardColorWithoutOpacity;
  final Gradient mainGradient;
  final Gradient buttonBackgroundColorInGradient;
  final Color homeMenuColor;

  const AppColors({
    required this.primaryColor,
    required this.secondaryColor,
    required this.screenBackgroundColor,
    required this.buttonBackgroundColor,
    required this.cardColorWithoutOpacity,
    required this.mainGradient,
    required this.textColor,
    required this.buttonBackgroundColorInGradient,
    required this.homeMenuColor,
  });

  static AppColors dark = AppColors(
    primaryColor: const Color(0xff642CA9),
    secondaryColor: const Color(0xffFF36AB),
    screenBackgroundColor: const Color(0xff1A1A1A),
    buttonBackgroundColor: Colors.white.withOpacity(0.08),
    cardColorWithoutOpacity: const Color(0xff282828),
    textColor: const Color(0xffF9FAFB),
    homeMenuColor: Colors.white.withOpacity(0.05),
    mainGradient: const LinearGradient(
      colors: [
        Color(0xff642ca9),
        Color(0xffff36ab),
      ],
    ),
    buttonBackgroundColorInGradient: LinearGradient(
      colors: [
        Colors.white.withOpacity(0.08),
        Colors.white.withOpacity(0.08),
      ],
    ),
  );
  static AppColors light = AppColors(
    primaryColor: const Color(0xff642CA9),
    secondaryColor: const Color(0xffFF36AB),
    screenBackgroundColor: Colors.white,
    cardColorWithoutOpacity: Colors.white,
    homeMenuColor: Colors.grey.withOpacity(0.08),
    buttonBackgroundColor: const Color(0xfff1f1f1),
    textColor: const Color(0xff101828),
    mainGradient: const LinearGradient(
      colors: [
        Color(0xff642ca9),
        Color(0xffff36ab),
      ],
    ),
    buttonBackgroundColorInGradient: const LinearGradient(
      colors: [
        Color(0xfff1f1f1),
        Color(0xfff1f1f1),
      ],
    ),
  );
}
