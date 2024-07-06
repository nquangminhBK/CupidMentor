import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension BuildContextExtension on BuildContext {
  Orientation get orientation => MediaQuery.of(this).orientation;

  Size get screenSize => MediaQuery.of(this).size;

  TextTheme get textTheme => Theme.of(this).textTheme;

  ThemeData get theme => Theme.of(this);

  AppLocalizations get l10n => AppLocalizations.of(this)!;
}
