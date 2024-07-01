import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/themes_colors/themes_provider.dart';
import 'package:cupid_mentor/core/widgets/horizontal_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SnackBarUtils {
  static SnackBar _snackBarContent(
      {required BuildContext context,
      required String message,
      required Color color,
      IconData? icon}) {
    return SnackBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      duration: const Duration(seconds: 2),
      content: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: color),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null)
                Icon(
                  icon,
                  color: Colors.white,
                  size: 18,
                ),
              if (icon != null) const HorizontalSpace(size: 12),
              Expanded(
                child: Text(
                  message,
                  style: context.textTheme.bodyLarge!.copyWith(color: Colors.white),
                ),
              ),
            ],
          )),
    );
  }

  static void showErrorSnackBar(
      {required String message, IconData? icon, required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(
        _snackBarContent(context: context, message: message, icon: icon, color: Colors.redAccent));
  }

  static showSuccessSnackBar(
      {required String message, IconData? icon, required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(_snackBarContent(
        context: context,
        message: message,
        icon: icon,
        color: ProviderScope.containerOf(context)
            .read(themeNotifierProvider)
            .currentAppColor
            .primaryColor));
  }

  static removeSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
  }
}
