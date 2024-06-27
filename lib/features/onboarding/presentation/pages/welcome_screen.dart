import 'package:cupid_mentor/core/assets/assets.gen.dart';
import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/widgets/animated_button.dart';
import 'package:cupid_mentor/core/widgets/vertical_space.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WelcomeScreen extends ConsumerWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: Column(
            children: [
              Expanded(child: Assets.png.profileProwessImage.image()),
              Text(
                "Welcome, Mia",
                style: context.textTheme.titleLarge!.copyWith(fontSize: 30),
                textAlign: TextAlign.center,
              ),
              const VerticalSpace(size: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Text(
                  "Get ready with us to discover all the amazing features we have in store for you!",
                  style: context.textTheme.bodyLarge!.copyWith(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
              const VerticalSpace(size: 56),
              AnimatedButton(
                  onPress: () {},
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: ref.currentAppColor.primaryColor,
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                    width: double.infinity,
                    height: 48,
                    child: Center(
                      child: Text(
                        "Okay, let's start",
                        style: context.textTheme.titleMedium,
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
