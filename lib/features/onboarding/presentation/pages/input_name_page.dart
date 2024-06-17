import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/widgets/gradient_outline_input_border.dart';
import 'package:cupid_mentor/core/widgets/my_date_time_picker.dart';
import 'package:cupid_mentor/core/widgets/vertical_space.dart';
import 'package:cupid_mentor/features/onboarding/presentation/widgets/select_date_widget.dart';
import 'package:cupid_mentor/features/onboarding/presentation/widgets/select_gender_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InputNamePage extends ConsumerStatefulWidget {
  const InputNamePage({super.key});

  @override
  ConsumerState<InputNamePage> createState() => _InputNamePageState();
}

class _InputNamePageState extends ConsumerState<InputNamePage> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "We're thrilled to have you here. What should we call you?",
              style: context.textTheme.titleLarge!.copyWith(fontSize: 30),
            ),
            const VerticalSpace(size: 24),
            Text(
              "The more detailed your answers, the better Cupid Mentor can give personalized suggestions for you. Let's dive in!!!",
              style: context.textTheme.titleMedium,
            ),
            const VerticalSpace(size: 24),
            Text(
              "Your name is",
              style: context.textTheme.titleLarge,
            ),
            const VerticalSpace(size: 6),
            SizedBox(
              height: 50,
              child: TextField(
                autofocus: false,
                textInputAction: TextInputAction.done,
                onChanged: (text) {},
                style: context.textTheme.bodyLarge!
                    .copyWith(color: ref.currentAppColor.textColor, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 14),
                  fillColor: ref.currentAppColor.buttonBackgroundColor,
                  filled: true,
                  hintText: "Enter your name",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: GradientOutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xff642ca9),
                          Color(0xffff36ab),
                        ],
                      )),
                ),
              ),
            ),
            const VerticalSpace(size: 24),
            Text(
              "Your gender is",
              style: context.textTheme.titleLarge,
            ),
            const VerticalSpace(size: 6),
            SelectGenderDropdown(),
            const VerticalSpace(size: 24),
            Text(
              "And your birthday is",
              style: context.textTheme.titleLarge,
            ),
            const VerticalSpace(size: 6),
            SelectDateWidget(
              onDateSelected: (selectedDate) {
                setState(() {
                  this.selectedDate = selectedDate;
                });
              },
              selectedDate: selectedDate,
            ),
            // InkWell(
            //   onTap: (){
            //     MyDateTimePicker.showDatePicker(context: context, ref: ref, title: "title", updateDateTime: (){});
            //   },
            //   child:    Text(
            //     "And your birthday is",
            //     style: context.textTheme.titleLarge,
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
