import 'package:cupid_mentor/core/constants/relationship_type.dart';
import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/navigation/navigation_service.dart';
import 'package:cupid_mentor/core/widgets/animated_button.dart';
import 'package:cupid_mentor/core/widgets/gradient_box_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectRelationshipType extends ConsumerStatefulWidget {
  const SelectRelationshipType({
    super.key,
    required this.onTypeSelected,
    required this.selectedType,
    required this.hint,
  });

  final Function(RelationshipType type) onTypeSelected;
  final RelationshipType? selectedType;
  final String hint;

  @override
  ConsumerState<SelectRelationshipType> createState() => _SelectRelationshipTypeState();
}

class _SelectRelationshipTypeState extends ConsumerState<SelectRelationshipType> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      onTap: () {
        setState(() {
          isSelected = true;
        });
        showModalBottomSheet(
          useRootNavigator: true,
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (context) => BottomSheetSelectRelationshipType(
            initialValue: widget.selectedType ?? RelationshipType.crush,
            onTap: widget.onTypeSelected,
          ),
        ).then((_) {
          setState(() {
            isSelected = false;
          });
        });
      },
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: ref.currentAppColor.buttonBackgroundColor,
          borderRadius: BorderRadius.circular(8),
          border: isSelected ? GradientBoxBorder(gradient: ref.currentAppColor.mainGradient) : null,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.selectedType == null
                ? widget.hint
                : widget.selectedType!.displayText.value(context),
            style: context.textTheme.bodyLarge,
          ),
        ),
      ),
    );
  }
}

class BottomSheetSelectRelationshipType extends ConsumerWidget {
  const BottomSheetSelectRelationshipType({
    super.key,
    required this.initialValue,
    required this.onTap,
  });

  final RelationshipType initialValue;
  final Function(RelationshipType) onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 24),
      decoration: BoxDecoration(
        color: ref.currentAppColor.cardColorWithoutOpacity,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: RelationshipType.values
            .map(
              (type) => AnimatedButton(
                onPress: () {
                  onTap(type);
                  NavigationService.instance.pop();
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: initialValue == type
                        ? ref.currentAppColor.buttonBackgroundColor
                        : ref.currentAppColor.cardColorWithoutOpacity,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      type.displayText.value(context),
                      style: context.textTheme.bodyLarge,
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
