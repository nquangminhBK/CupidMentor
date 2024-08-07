import 'package:cupid_mentor/core/constants/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension BuildContextExtension on BuildContext {
  Orientation get orientation => MediaQuery.of(this).orientation;

  Size get screenSize {
    final screenSize = MediaQuery.of(this).size;
    final width = screenSize.width > ScreenSize.maxWidth ? ScreenSize.maxWidth : screenSize.width;
    final height =
        screenSize.height > ScreenSize.maxHeight ? ScreenSize.maxHeight : screenSize.height;
    return Size(width, height);
  }

  TextTheme get textTheme => Theme.of(this).textTheme;

  ThemeData get theme => Theme.of(this);

  AppLocalizations get l10n => AppLocalizations.of(this)!;
}
