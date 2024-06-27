import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/widgets/animated_button.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: context.theme.scaffoldBackgroundColor,
        child: SafeArea(
            child: Scaffold(
                appBar: AppBar(
          titleSpacing: 0,
          title: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Setting screen",
              style: context.textTheme.titleLarge!.copyWith(fontSize: 20),
            ),
          ),
          backgroundColor: context.theme.scaffoldBackgroundColor,
          elevation: 0,
          actions: [
            AnimatedButton(
                onPress: () {},
                child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Icon(Icons.info_outline_rounded)))
          ],
        ))));
  }
}
