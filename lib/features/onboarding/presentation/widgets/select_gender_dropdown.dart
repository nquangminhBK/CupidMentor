import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/widgets/gradient_box_border.dart';
import 'package:cupid_mentor/core/widgets/horizontal_space.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectGenderDropdown extends ConsumerStatefulWidget {
  SelectGenderDropdown({super.key});

  @override
  ConsumerState<SelectGenderDropdown> createState() => _SelectGenderDropdownState();
}

class _SelectGenderDropdownState extends ConsumerState<SelectGenderDropdown>
    with SingleTickerProviderStateMixin {
  final List<String> items = [
    'Male',
    'Female',
    'Other',
  ];

  String? selectedValue;
  bool isFocus = false;
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenSize.width,
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
            onMenuStateChange: (isOpen) {
              setState(() {
                isFocus = isOpen;
              });
              if (isOpen) {
                controller.forward();
              } else {
                controller.reverse();
              }
            },
            isExpanded: true,
            hint: Row(
              children: [
                Expanded(
                  child: Text(
                    'Choose your gender',
                    style: context.textTheme.bodyLarge,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            items: items
                .map((String item) => DropdownMenuItem<String>(
                    value: item,
                    child: Row(
                      children: [
                        Text(
                          item,
                          style: context.textTheme.bodyLarge,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    )))
                .toList(),
            value: selectedValue,
            onChanged: (value) {
              setState(() {
                selectedValue = value;
              });
            },
            buttonStyleData: ButtonStyleData(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: isFocus
                      ? const GradientBoxBorder(
                          gradient: LinearGradient(
                          colors: [
                            Color(0xff642ca9),
                            Color(0xffff36ab),
                          ],
                        ))
                      : Border.all(color: Colors.transparent),
                  color: ref.currentAppColor.buttonBackgroundColor),
            ),
            iconStyleData: IconStyleData(
              icon: AnimatedIcon(
                icon: AnimatedIcons.menu_close,
                progress: animation,
              ),
              iconSize: 14,
              iconEnabledColor: Colors.white,
              iconDisabledColor: Colors.grey,
            ),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 200,
              width: context.screenSize.width - 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
              ),
              offset: const Offset(0, -6),
            ),
            menuItemStyleData: MenuItemStyleData(selectedMenuItemBuilder: (context, child) {
              return Container(
                color: ref.currentAppColor.buttonBackgroundColor,
                child: Row(
                  children: [
                    child,
                    const Spacer(),
                    const Icon(
                      Icons.check_rounded,
                      color: Colors.white,
                      size: 20,
                    ),
                    const HorizontalSpace(size: 14)
                  ],
                ),
              );
            })),
      ),
    );
  }
}
