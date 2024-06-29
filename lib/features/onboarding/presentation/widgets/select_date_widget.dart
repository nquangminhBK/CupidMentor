import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';

import 'package:cupid_mentor/core/widgets/gradient_box_border.dart';
import 'package:cupid_mentor/core/widgets/my_date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class SelectDateWidget extends ConsumerStatefulWidget {
  const SelectDateWidget({super.key, required this.onDateSelected, required this.selectedDate});

  final Function(DateTime) onDateSelected;
  final DateTime? selectedDate;

  @override
  ConsumerState<SelectDateWidget> createState() => _SelectDateWidgetState();
}

class _SelectDateWidgetState extends ConsumerState<SelectDateWidget> {
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
        MyDateTimePicker.showDatePicker(
            context: context,
            ref: ref,
            title: "Select your birthday",
            initialDate: widget.selectedDate ?? DateTime(1980, 1, 1),
            updateDateTime: (selectedDate) {
              widget.onDateSelected(selectedDate);
            }).then((_) {
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
            border:
                isSelected ? GradientBoxBorder(gradient: ref.currentAppColor.mainGradient) : null),
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.selectedDate == null
                ? "Select your birthday"
                : DateFormat.yMMMd().format(widget.selectedDate!),
            style: context.textTheme.bodyLarge!.copyWith(color: ref.currentAppColor.textColor),
          ),
        ),
      ),
    );
  }
}
