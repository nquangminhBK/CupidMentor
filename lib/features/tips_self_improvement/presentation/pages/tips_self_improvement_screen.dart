import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/utils/snackbar_service.dart';
import 'package:cupid_mentor/core/widgets/my_app_bar.dart';
import 'package:cupid_mentor/features/tips_self_improvement/presentation/manager/tips_self_improvement_notifier.dart';
import 'package:cupid_mentor/features/tips_self_improvement/presentation/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TipsSelfImprovementScreen extends ConsumerWidget {
  const TipsSelfImprovementScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(tipsSelfImprovementNotifierProvider, (previous, next) {
      if (next.errorOrSuccess != null) {
        next.errorOrSuccess!.fold(
          (error) {
            SnackBarService.instance.showErrorSnackBar(
              message: error.getDisplayMessage(context),
              context: context,
              icon: Icons.warning_amber_rounded,
            );
          },
          (success) {},
        );
      }
    });
    return Container(
      color: context.theme.scaffoldBackgroundColor,
      child: SafeArea(
        child: Scaffold(
          appBar: MyAppBar.myAppBar(
            title: '${context.l10n.tipSelfImprovementTitle}  💡',
            ref: ref,
            context: context,
          ),
          body: ListView.builder(
            itemBuilder: (context, index) {
              return CategoryItem(
                selfImprovementEntity: ref.preloadData.selfImprovements[index],
                isLeftToRight: index % 2 == 0,
              );
            },
            itemCount: ref.preloadData.selfImprovements.length,
          ),
        ),
      ),
    );
  }
}
