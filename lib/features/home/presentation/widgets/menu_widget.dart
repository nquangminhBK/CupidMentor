import 'package:cupid_mentor/core/assets/assets.gen.dart';
import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/widgets/animated_button.dart';
import 'package:cupid_mentor/core/widgets/horizontal_space.dart';
import 'package:cupid_mentor/core/widgets/vertical_space.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuWidget extends ConsumerWidget {
  const MenuWidget(
      {super.key,
      required this.isLeftToRight,
      required this.image,
      required this.title,
      required this.description,
      required this.buttonText,
      required this.onTap});

  final bool isLeftToRight;
  final Widget image;
  final String title;
  final String description;
  final String buttonText;
  final Function onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.white.withOpacity(0.05)),
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.all(12),
      width: double.infinity,
      child: Row(
        children: isLeftToRight
            ? [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title,
                        style: context.textTheme.labelLarge!.copyWith(fontSize: 16),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        description,
                        style: context.textTheme.labelLarge!.copyWith(fontSize: 12),
                        textAlign: TextAlign.start,
                      ),
                      const VerticalSpace(size: 12),
                      Container(
                        margin: const EdgeInsets.only(right: 45),
                        height: 44,
                        child: AnimatedButton(
                            onPress: onTap,
                            child: Container(
                                height: 44,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white.withOpacity(0.20),
                                ),
                                child: Center(
                                  child: Text(
                                    buttonText,
                                    textAlign: TextAlign.center,
                                    style: context.textTheme.titleMedium,
                                  ),
                                ))),
                      ),
                    ],
                  ),
                ),
                Expanded(child: image),
              ]
            : [
                Expanded(child: image),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title,
                        style: context.textTheme.labelLarge!.copyWith(fontSize: 16),
                        textAlign: TextAlign.end,
                      ),
                      Text(
                        description,
                        style: context.textTheme.labelLarge!.copyWith(fontSize: 12),
                        textAlign: TextAlign.end,
                      ),
                      const VerticalSpace(size: 12),
                      Container(
                        margin: const EdgeInsets.only(left: 45),
                        height: 44,
                        child: AnimatedButton(
                            onPress: onTap,
                            child: Container(
                                height: 44,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white.withOpacity(0.20),
                                ),
                                child: Center(
                                  child: Text(
                                    buttonText,
                                    textAlign: TextAlign.center,
                                    style: context.textTheme.titleMedium,
                                  ),
                                ))),
                      ),
                    ],
                  ),
                )
              ],
      ),
    );
  }
}
