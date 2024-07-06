import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/widgets/gradient_outline_input_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyTextField extends ConsumerWidget {
  const MyTextField({
    super.key,
    required this.onChanged,
    required this.hintText,
    this.prefixIcon,
    this.controller,
    this.focusNode,
    this.suffixIcon,
  });

  final Function(String) onChanged;
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (kIsWeb) {
      return SizedBox(
        height: 50,
        child: TextFormField(
          focusNode: focusNode,
          controller: controller,
          autofocus: false,
          textInputAction: TextInputAction.done,
          onChanged: onChanged,
          style: context.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.left,
          cursorColor: ref.currentAppColor.textColor,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            contentPadding: const EdgeInsets.symmetric(horizontal: 14),
            fillColor: ref.currentAppColor.buttonBackgroundColor,
            filled: true,
            hintText: hintText,
            hintStyle: context.textTheme.bodyLarge,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
            focusedBorder: GradientOutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              gradient: ref.currentAppColor.mainGradient,
            ),
          ),
        ),
      );
    }

    return SizedBox(
      height: 50,
      child: TextFormField(
        controller: controller,
        autofocus: false,
        textInputAction: TextInputAction.done,
        onChanged: onChanged,
        style: context.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
        textAlign: TextAlign.left,
        cursorColor: ref.currentAppColor.textColor,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          contentPadding: const EdgeInsets.symmetric(horizontal: 14),
          fillColor: ref.currentAppColor.buttonBackgroundColor,
          filled: true,
          hintText: hintText,
          hintStyle: context.textTheme.bodyLarge,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          focusedBorder: GradientOutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            gradient: ref.currentAppColor.mainGradient,
          ),
        ),
      ),
    );
  }
}
