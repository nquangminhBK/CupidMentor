import 'package:cupid_mentor/core/constants/self_improvement.dart';
import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/widgets/animated_button.dart';
import 'package:cupid_mentor/features/tips_self_improvement/presentation/widgets/tips_self_improvement_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TipsSelfImprovementScreen extends ConsumerWidget {
  const TipsSelfImprovementScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        color: context.theme.scaffoldBackgroundColor,
        child: SafeArea(
            child: Scaffold(
          appBar: AppBar(
            titleSpacing: 0,
            title: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Some Tips For You  💡",
                style: context.textTheme.titleLarge!
                    .copyWith(fontSize: 20, color: ref.currentAppColor.textColor),
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
          ),
          body: ListView.builder(
            itemBuilder: (context, index) {
              return TipsSelfImprovementItem(item: SelfImprovement.selfImprovements[index]);
            },
            itemCount: SelfImprovement.selfImprovements.length,
          ),
        )));
  }
}
