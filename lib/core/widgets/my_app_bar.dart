import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/widgets/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyAppBar {
  static PreferredSizeWidget myAppBar({
    String? title,
    required WidgetRef ref,
    required BuildContext context,
    bool? hasBackIcon,
    Widget? titleWidget,
    Map<IconData, Function()>? actionButton,
  }) =>
      AppBar(
        titleSpacing: 0,
        iconTheme: IconThemeData(
          color: ref.currentAppColor.textColor,
          size: 18,
        ),
        title: titleWidget ??
            Align(
              alignment: Alignment.centerLeft,
              child: (hasBackIcon ?? true)
                  ? Text(
                      title ?? '',
                      style: context.textTheme.headlineSmall!.copyWith(fontSize: 18),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        title ?? '',
                        style: context.textTheme.headlineSmall!.copyWith(
                          fontSize: 18,
                        ),
                      ),
                    ),
            ),
        backgroundColor: context.theme.scaffoldBackgroundColor,
        elevation: 0,
        automaticallyImplyLeading: hasBackIcon ?? true,
        actions: actionButton?.keys
            .map(
              (icon) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: AnimatedButton(
                  onPress: () {
                    actionButton[icon]?.call();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: ref.currentAppColor.buttonBackgroundColor,
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Icon(
                      icon,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      );
}
