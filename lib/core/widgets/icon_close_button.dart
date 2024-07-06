import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/widgets/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IconCloseButton extends ConsumerWidget {
  const IconCloseButton({this.icon, required this.onPress, this.color, super.key});

  final IconData? icon;
  final Function onPress;
  final Color? color;

  @override
  Widget build(BuildContext context, WidgetRef ref) => SizedBox(
        width: 40,
        height: 40,
        child: AnimatedButton(
          scaleSize: 0.9,
          color: Colors.transparent,
          onPress: () {
            onPress();
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: color ?? ref.currentAppColor.buttonBackgroundColor,
            ),
            child: Center(
              child: Icon(
                icon ?? Icons.close_rounded,
                color: ref.currentAppColor.textColor,
              ),
            ),
          ),
        ),
      );
}
