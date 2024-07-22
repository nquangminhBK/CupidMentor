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
    return IntrinsicHeight(
      child: Row(
        children: [
          const HorizontalSpace(size: 24),
          Expanded(
            child: ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 50),
              child: AnimatedButton(
                onPress: () {
                  NavigationService.instance.push(AppRoutes.profile);
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: ref.currentAppColor.buttonBackgroundColor,
                  ),
                  child: Center(
                    child: Text(
                      context.l10n.yourInfo,
                      textAlign: TextAlign.center,
                      style: context.textTheme.titleMedium,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const HorizontalSpace(size: 16),
          Expanded(
            child: ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 50),
              child: AnimatedButton(
                onPress: () {
                  NavigationService.instance.push(AppRoutes.crushProfile);
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: ref.currentAppColor.buttonBackgroundColor,
                  ),
                  child: Center(
                    child: Text(
                      context.l10n.partnerInfo,
                      textAlign: TextAlign.center,
                      style: context.textTheme.titleMedium,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const HorizontalSpace(size: 24),
        ],
      ),
    );
  }
}
