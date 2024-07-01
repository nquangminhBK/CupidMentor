import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/widgets/gradient_outline_input_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyTextField extends ConsumerStatefulWidget {
  const MyTextField(
      {super.key,
      required this.onChanged,
      required this.hintText,
      this.initialText,
      this.prefixIcon,
      this.suffixIcon});

  final Function(String) onChanged;
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? initialText;

  @override
  ConsumerState<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends ConsumerState<MyTextField> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return SizedBox(
        height: 50,
        child: TextFormField(
          initialValue: widget.initialText,
          autofocus: false,
          textInputAction: TextInputAction.done,
          onChanged: widget.onChanged,
          style: context.textTheme.bodyLarge!
              .copyWith(color: ref.currentAppColor.textColor, fontWeight: FontWeight.bold),
          textAlign: TextAlign.left,
          cursorColor: Colors.white,
          decoration: InputDecoration(
            suffixIcon: widget.suffixIcon,
            prefixIcon: widget.prefixIcon,
            contentPadding: const EdgeInsets.symmetric(horizontal: 14),
            fillColor: ref.currentAppColor.buttonBackgroundColor,
            filled: true,
            hintText: widget.hintText,
            hintStyle: context.textTheme.bodyLarge!.copyWith(color: ref.currentAppColor.textColor),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
            focusedBorder: GradientOutlineInputBorder(
                borderRadius: BorderRadius.circular(8), gradient: ref.currentAppColor.mainGradient),
          ),
        ),
      );
    }
    if (widget.initialText?.isNotEmpty ?? false) {
      controller.value = TextEditingValue(text: widget.initialText ?? "");
    }
    return SizedBox(
      height: 50,
      child: TextFormField(
        controller: controller,
        autofocus: false,
        textInputAction: TextInputAction.done,
        onChanged: widget.onChanged,
        style: context.textTheme.bodyLarge!
            .copyWith(color: ref.currentAppColor.textColor, fontWeight: FontWeight.bold),
        textAlign: TextAlign.left,
        cursorColor: Colors.white,
        decoration: InputDecoration(
          suffixIcon: widget.suffixIcon,
          prefixIcon: widget.prefixIcon,
          contentPadding: const EdgeInsets.symmetric(horizontal: 14),
          fillColor: ref.currentAppColor.buttonBackgroundColor,
          filled: true,
          hintText: widget.hintText,
          hintStyle: context.textTheme.bodyLarge!.copyWith(color: ref.currentAppColor.textColor),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          focusedBorder: GradientOutlineInputBorder(
              borderRadius: BorderRadius.circular(8), gradient: ref.currentAppColor.mainGradient),
        ),
      ),
    );
  }
}
