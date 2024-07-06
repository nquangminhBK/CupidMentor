import 'package:cupid_mentor/core/constants/self_improvement.dart';
import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/widgets/my_app_bar.dart';
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
          appBar: MyAppBar.myAppBar(title: 'Some Tips For You  💡', ref: ref, context: context),
          body: ListView.builder(
            itemBuilder: (context, index) {
              return TipsSelfImprovementItem(item: SelfImprovement.selfImprovements[index]);
            },
            itemCount: SelfImprovement.selfImprovements.length,
          ),
        ),
      ),
    );
  }
}
