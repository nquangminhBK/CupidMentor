import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/navigation/navigation_service.dart';
import 'package:cupid_mentor/core/navigation/routes.dart';
import 'package:cupid_mentor/core/widgets/animated_button.dart';
import 'package:cupid_mentor/core/widgets/horizontal_space.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileWidget extends ConsumerWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        const HorizontalSpace(size: 24),
        Expanded(
          child: AnimatedButton(
              onPress: () {
                NavigationService.instance.push(AppRoutes.onboarding);
              },
              child: Container(
                width: double.infinity,
                height: 44,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: ref.currentAppColor.buttonBackgroundColor),
                child: Center(
                  child: Text(
                    "Your info 😊",
                    textAlign: TextAlign.center,
                    style: context.textTheme.titleMedium!
                        .copyWith(color: ref.currentAppColor.textColor),
                  ),
                ),
              )),
        ),
        const HorizontalSpace(size: 16),
        Expanded(
          child: AnimatedButton(
              onPress: () {
                NavigationService.instance.push(AppRoutes.onboarding);
              },
              child: Container(
                width: double.infinity,
                height: 44,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: ref.currentAppColor.buttonBackgroundColor),
                child: Center(
                  child: Text(
                    "Partner's Info 💜",
                    textAlign: TextAlign.center,
                    style: context.textTheme.titleMedium!
                        .copyWith(color: ref.currentAppColor.textColor),
                  ),
                ),
              )),
        ),
        const HorizontalSpace(size: 24),
      ],
    );
  }
}
