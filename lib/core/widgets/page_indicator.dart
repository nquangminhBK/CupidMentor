import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator(
      {super.key,
      this.dotSize,
      this.currentDotSize,
      required this.totalCount,
      required this.currentIndex,
      this.dotColor,
      this.currentDotColor});

  final Size? dotSize;
  final Size? currentDotSize;
  final Color? dotColor;
  final Color? currentDotColor;
  final int totalCount;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [for (var i = 0; i < totalCount; i++) i]
          .map((e) => Dot(
                isCurrent: e == currentIndex,
                dotColor: dotColor,
                dotSize: dotSize,
                currentDotColor: currentDotColor,
                currentDotSize: currentDotSize,
              ))
          .toList(),
    );
  }
}

class Dot extends ConsumerWidget {
  const Dot(
      {super.key,
      required this.isCurrent,
      this.dotSize,
      this.currentDotSize,
      this.dotColor,
      this.currentDotColor});

  final bool isCurrent;
  final Size? dotSize;
  final Size? currentDotSize;
  final Color? dotColor;
  final Color? currentDotColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnimatedContainer(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: isCurrent ? (currentDotSize?.width ?? 40) : (dotSize?.width ?? 10),
      height: isCurrent ? (currentDotSize?.height ?? 10) : (dotSize?.height ?? 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            isCurrent ? (currentDotSize?.width ?? 40) / 2 : (dotSize?.width ?? 10) / 2,
          ),
          color: isCurrent
              ? currentDotColor ?? ref.currentAppColor.primaryColor
              : dotColor ?? ref.currentAppColor.buttonBackgroundColor),
      duration: const Duration(milliseconds: 200),
    );
  }
}
