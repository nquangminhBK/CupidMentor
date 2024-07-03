import 'package:cupid_mentor/core/assets/assets.gen.dart';
import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/navigation/navigation_service.dart';
import 'package:cupid_mentor/core/navigation/routes.dart';
import 'package:cupid_mentor/core/widgets/animated_button.dart';
import 'package:cupid_mentor/core/widgets/horizontal_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatNowWidget extends ConsumerWidget {
  const ChatNowWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              child: SizedBox(
                width: double.infinity,
                height: 150,
                child: Assets.svg.backgroundChatNow.svg(fit: BoxFit.cover),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 150,
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12, top: 12),
                        child: Text(
                          'Struggling to craft the perfect responses? Don’t worry, we’re here for you!!!',
                          style: context.textTheme.labelLarge!
                              .copyWith(fontSize: 14, color: ref.currentAppColor.textColor),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 12, right: 12),
                        height: 44,
                        child: AnimatedButton(
                          onPress: () => NavigationService.instance.push(AppRoutes.tipReplying),
                          child: Container(
                            width: double.infinity,
                            height: 44,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white.withOpacity(0.20),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Chat now',
                                  textAlign: TextAlign.center,
                                  style: context.textTheme.titleMedium!
                                      .copyWith(color: ref.currentAppColor.textColor),
                                ),
                                const HorizontalSpace(size: 8),
                                Icon(
                                  Icons.chat_outlined,
                                  color: ref.currentAppColor.textColor,
                                  size: 15,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
