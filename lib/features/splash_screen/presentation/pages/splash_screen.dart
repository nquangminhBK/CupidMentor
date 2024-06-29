import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: ref.currentAppColor.screenBackgroundColor,
      child: SafeArea(
        child: Center(
          child: Container(),
        ),
      ),
    );
  }
}
