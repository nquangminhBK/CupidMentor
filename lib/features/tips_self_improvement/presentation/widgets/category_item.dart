import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/widgets/could_image.dart';
import 'package:cupid_mentor/features/preload_data/domain/entities/self_improvement_entity.dart';
import 'package:cupid_mentor/features/tips_self_improvement/presentation/widgets/tips_self_improvement_items.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryItem extends ConsumerStatefulWidget {
  const CategoryItem({
    super.key,
    required this.selfImprovementEntity,
    required this.isLeftToRight,
  });

  final SelfImprovementEntity selfImprovementEntity;
  final bool isLeftToRight;

  @override
  ConsumerState<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends ConsumerState<CategoryItem> {
  ExpandableController expandableController = ExpandableController();

  @override
  void dispose() {
    expandableController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: ref.currentAppColor.homeMenuColor,
      ),
      margin: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
      width: double.infinity,
      child: ExpandableNotifier(
        child: ExpandablePanel(
          theme: ExpandableThemeData(
            headerAlignment: ExpandablePanelHeaderAlignment.center,
            iconColor: ref.currentAppColor.textColor,
            inkWellBorderRadius: BorderRadius.circular(8),
            useInkWell: true,
            iconPlacement: widget.isLeftToRight
                ? ExpandablePanelIconPlacement.left
                : ExpandablePanelIconPlacement.right,
            iconSize: 30,
          ),
          controller: expandableController,
          header: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: widget.isLeftToRight
                ? [
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          widget.selfImprovementEntity.category.title.value(context),
                          style: context.textTheme.headlineMedium!.copyWith(
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: CouldImage(
                          width: 80,
                          height: 80,
                          imageName: widget.selfImprovementEntity.category.image,
                        ),
                      ),
                    ),
                  ]
                : [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: CouldImage(
                          width: 80,
                          height: 80,
                          imageName: widget.selfImprovementEntity.category.image,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          widget.selfImprovementEntity.category.title.value(context),
                          style: context.textTheme.headlineMedium!.copyWith(
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ),
                  ],
          ),
          collapsed: Container(),
          expanded: Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  width: double.infinity,
                  height: 0.5,
                  color: ref.currentAppColor.textColor,
                ),
                ...widget.selfImprovementEntity.tips.map((e) => TipsSelfImprovementItem(item: e)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
