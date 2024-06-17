import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/navigation/navigation_service.dart';
import 'package:cupid_mentor/core/widgets/animated_button.dart';
import 'package:cupid_mentor/core/widgets/horizontal_space.dart';
import 'package:cupid_mentor/core/widgets/vertical_space.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyDateTimePicker extends ConsumerStatefulWidget {
  const MyDateTimePicker(
      {required this.title, required this.updateDateTime, this.initialDate, super.key});

  final String title;
  final Function updateDateTime;
  final DateTime? initialDate;

  static Future<void> showDatePicker(
      {required BuildContext context,
      required WidgetRef ref,
      required String title,
      required Function updateDateTime,
      DateTime? initialDate,
      CupertinoDatePickerMode? mode}) {
    return showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
              height: 330,
              margin: const EdgeInsets.only(left: 10, right: 10, bottom: 24),
              decoration: BoxDecoration(
                color: ref.currentAppColor.screenBackgroundColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: MyDateTimePicker(
                initialDate: initialDate,
                title: title,
                updateDateTime: updateDateTime,
              ),
            ));
  }

  @override
  ConsumerState<MyDateTimePicker> createState() => _MyDateTimePickerState();
}

class _MyDateTimePickerState extends ConsumerState<MyDateTimePicker> {
  DateTime selectedDateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return CupertinoTheme(
        data: CupertinoThemeData(
          textTheme: CupertinoTextThemeData(
              dateTimePickerTextStyle: context.textTheme.bodyLarge!.copyWith(
                  fontSize: 18,
                  color: ref.currentTheme == ThemeMode.dark ? Colors.white : Colors.black)),
          brightness: ref.currentTheme == ThemeMode.light ? Brightness.light : Brightness.dark,
        ),
        child: Column(
          children: [
            const VerticalSpace(
              size: 10,
            ),
            Row(
              children: [
                const HorizontalSpace(
                  size: 24,
                ),
                Text(widget.title,
                    style: context.textTheme.bodyLarge!.copyWith(
                        color: ref.currentTheme == ThemeMode.dark ? Colors.white : Colors.black)),
                const Spacer(),
                AnimatedButton(
                  scaleSize: 0.9,
                  color: Colors.transparent,
                  onPress: () {
                    widget.updateDateTime(selectedDateTime);
                    NavigationService.instance.pop();
                  },
                  child: Container(
                    width: 70,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: ref.currentAppColor.buttonBackgroundColor,
                    ),
                    child: Center(
                        child: Text(
                      'Save',
                      style: context.textTheme.bodyLarge,
                    )),
                  ),
                ),
                const HorizontalSpace(
                  size: 24,
                ),
              ],
            ),
            SizedBox(
              height: 260,
              child: CupertinoDatePicker(
                initialDateTime: widget.initialDate ?? DateTime.now(),
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: (DateTime newDate) {
                  setState(() => selectedDateTime = newDate);
                  widget.updateDateTime(selectedDateTime);
                },
              ),
            ),
          ],
        ));
  }
}
