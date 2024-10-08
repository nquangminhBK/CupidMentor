import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextThemes {
  static TextStyle thin() => GoogleFonts.manrope(
        fontWeight: FontWeight.w300,
      );

  static TextStyle medium() => GoogleFonts.manrope(fontWeight: FontWeight.w500);

  static TextStyle bold() => GoogleFonts.manrope(fontWeight: FontWeight.w700);

  static TextTheme textTheme(context) => Theme.of(context).textTheme.copyWith(
        displayLarge: TextThemes.bold().copyWith(fontSize: 60),
        displayMedium: TextThemes.bold().copyWith(fontSize: 50),
        displaySmall: TextThemes.bold().copyWith(fontSize: 40),
        headlineMedium: TextThemes.bold().copyWith(fontSize: 30),
        headlineSmall: TextThemes.bold().copyWith(fontSize: 25),
        titleLarge: TextThemes.medium().copyWith(fontSize: 18),
        titleMedium: TextThemes.medium().copyWith(fontSize: 15),
        titleSmall: TextThemes.medium(),
        bodyLarge: TextThemes.medium(),
        labelLarge: TextThemes.medium(),
        bodySmall: TextThemes.medium(),
      );
}
