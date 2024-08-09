import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/themes_colors/themes_provider.dart';
import 'package:cupid_mentor/core/widgets/horizontal_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SnackBarService {
  static final SnackBarService service = SnackBarService();

  @visibleForTesting
  static SnackBarService? overrideService;

  static SnackBarService get instance => overrideService ?? service;

  SnackBar _snackBarContent({
    required BuildContext context,
    required String message,
    required Color contentColor,
    required Color bgColor,
    required IconData icon,
  }) {
    return SnackBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      duration: const Duration(seconds: 2),
      content: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: bgColor),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: contentColor,
              size: 18,
            ),
            const HorizontalSpace(size: 12),
            Expanded(
              child: Text(
                message,
                style: context.textTheme.bodyLarge!.copyWith(color: contentColor),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showErrorSnackBar({
    required String message,
    required BuildContext context,
  }) {
    final currentTheme =
        ProviderScope.containerOf(context).read(themeNotifierProvider).currentTheme;
    final bgColor =
        currentTheme == ThemeMode.dark ? const Color(0xff2C2C2E) : const Color(0xffFEF3F2);
    ScaffoldMessenger.of(context).showSnackBar(
      _snackBarContent(
        context: context,
        message: message,
        bgColor: bgColor,
        icon: Icons.warning_amber_rounded,
        contentColor: const Color(0xffF04438),
      ),
    );
  }

  void showSuccessSnackBar({
    required String message,
    required BuildContext context,
  }) {
    final currentTheme =
        ProviderScope.containerOf(context).read(themeNotifierProvider).currentTheme;
    final bgColor =
        currentTheme == ThemeMode.dark ? const Color(0xff2C2C2E) : const Color(0xffECFDF3);
    ScaffoldMessenger.of(context).showSnackBar(
      _snackBarContent(
        context: context,
        message: message,
        bgColor: bgColor,
        icon: Icons.check_rounded,
        contentColor: const Color(0xff039855),
      ),
    );
  }

  void removeSnackBar(BuildContext context) =>
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
}
