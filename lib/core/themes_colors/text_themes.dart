import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextThemes {
  static TextStyle thin() {
    return GoogleFonts.poppins(
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle light() {
    return GoogleFonts.poppins(
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle medium() {
    return GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle bold() {
    return GoogleFonts.poppins(fontWeight: FontWeight.w700);
  }

  static TextTheme textTheme(context) => Theme.of(context).textTheme.copyWith(
        displayLarge: TextThemes.bold().copyWith(fontSize: 60),
        displayMedium: TextThemes.bold().copyWith(fontSize: 50),
        displaySmall: TextThemes.bold().copyWith(fontSize: 40),
        headlineMedium: TextThemes.bold().copyWith(fontSize: 30),
        headlineSmall: TextThemes.bold().copyWith(fontSize: 25),
        titleLarge: TextThemes.medium().copyWith(fontSize: 18),
        titleMedium: TextThemes.medium().copyWith(fontSize: 15),
        titleSmall: TextThemes.medium(),
        bodyLarge: TextThemes.thin(),
        labelLarge: TextThemes.thin(),
        bodySmall: TextThemes.thin(),
      );
}
