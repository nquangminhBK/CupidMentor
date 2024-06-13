import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  Orientation get orientation => MediaQuery.of(this).orientation;

  Size get screenSize => MediaQuery.of(this).size;

  TextTheme get textTheme => Theme.of(this).textTheme;
}
