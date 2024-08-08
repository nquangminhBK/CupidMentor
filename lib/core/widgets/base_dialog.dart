import 'package:cupid_mentor/core/constants/screen_size.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
 
import 'package:cupid_mentor/core/widgets/icon_close_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BaseDialog extends ConsumerWidget {
  const BaseDialog({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Container(
        constraints: BoxConstraints(maxWidth: ScreenSize.maxWidth),
        width: double.infinity,
        child: Center(
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: ref.currentAppColor.screenBackgroundColor,
                ),
                child: child,
              ),
              Positioned(
                right: 8.0,
                top: 8.0,
                child: IconCloseButton(
                  onPress: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
