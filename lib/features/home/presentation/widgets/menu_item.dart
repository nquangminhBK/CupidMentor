import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/widgets/animated_button.dart';
import 'package:cupid_mentor/core/widgets/vertical_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuItem extends ConsumerWidget {
  const MenuItem({
    super.key,
    required this.isLeftToRight,
    required this.image,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.onTap,
    this.onTapInfo,
  });

  final bool isLeftToRight;
  final Widget image;
  final String title;
  final String description;
  final String buttonText;
  final Function onTap;
  final Function? onTapInfo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: ref.currentAppColor.homeMenuColor,
      ),
      width: double.infinity,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: isLeftToRight
                  ? [
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              title,
                              style: context.textTheme.headlineMedium!.copyWith(
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            Text(
                              description,
                              style: context.textTheme.labelLarge!.copyWith(
                                fontSize: 14,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            const VerticalSpace(size: 12),
                            Container(
                              margin: const EdgeInsets.only(right: 45),
                              height: 44,
                              width: 170,
                              child: AnimatedButton(
                                onPress: onTap,
                                borderRadius: BorderRadius.circular(8),
                                color: ref.currentAppColor.primaryColor,
                                child: Center(
                                  child: Text(
                                    buttonText,
                                    textAlign: TextAlign.center,
                                    style: context.textTheme.titleMedium!
                                        .copyWith(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(flex: 2, child: image),
                    ]
                  : [
                      Expanded(
                        flex: 2,
                        child: image,
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              title,
                              style: context.textTheme.headlineMedium!.copyWith(
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.end,
                            ),
                            Text(
                              description,
                              style: context.textTheme.labelLarge!.copyWith(
                                fontSize: 14,
                              ),
                              textAlign: TextAlign.end,
                            ),
                            const VerticalSpace(size: 12),
                            Container(
                              margin: const EdgeInsets.only(left: 45),
                              height: 44,
                              width: 170,
                              child: AnimatedButton(
                                onPress: onTap,
                                borderRadius: BorderRadius.circular(8),
                                color: ref.currentAppColor.primaryColor,
                                child: Center(
                                  child: Text(
                                    buttonText,
                                    textAlign: TextAlign.center,
                                    style: context.textTheme.titleMedium!
                                        .copyWith(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
            ),
          ),
          if (onTapInfo != null)
            Align(
              alignment: isLeftToRight ? Alignment.topRight : Alignment.topLeft,
              child: SizedBox(
                width: 30,
                height: 30,
                child: AnimatedButton(
                  onPress: () => onTapInfo?.call(),
                  child: Icon(
                    Icons.more_horiz_rounded,
                    color: ref.currentAppColor.textColor,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
