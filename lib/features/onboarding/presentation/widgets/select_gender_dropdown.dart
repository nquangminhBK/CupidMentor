import 'package:cupid_mentor/core/constants/gender.dart';
import 'package:cupid_mentor/core/constants/screen_size.dart';
import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/widgets/animated_button.dart';
import 'package:cupid_mentor/core/widgets/gradient_box_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectGenderWidget extends ConsumerStatefulWidget {
  const SelectGenderWidget({
    super.key,
    required this.onSelectGender,
    required this.selectedGender,
    required this.hint,
  });

  final Function(Gender?) onSelectGender;
  final Gender? selectedGender;
  final String hint;

  @override
  ConsumerState<SelectGenderWidget> createState() => _SelectGenderWidgetState();
}

class _SelectGenderWidgetState extends ConsumerState<SelectGenderWidget> {
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
          constraints: BoxConstraints(maxWidth: ScreenSize.maxWidth),
          backgroundColor: Colors.transparent,
          builder: (context) => BottomSheetGender(
            initialValue: widget.selectedGender,
            onTap: widget.onSelectGender,
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
            widget.selectedGender == null
                ? widget.hint
                : widget.selectedGender!.displayText.value(context),
            style: context.textTheme.bodyLarge,
          ),
        ),
      ),
    );
  }
}

class BottomSheetGender extends ConsumerWidget {
  const BottomSheetGender({
    super.key,
    required this.initialValue,
    required this.onTap,
  });

  final Gender? initialValue;
  final Function(Gender) onTap;

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
        children: Gender.values
            .map(
              (type) => AnimatedButton(
                onPress: () {
                  onTap(type);
                  Navigator.of(context).pop();
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
