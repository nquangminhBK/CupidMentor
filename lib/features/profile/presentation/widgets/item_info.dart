import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/widgets/animated_button.dart';
import 'package:cupid_mentor/core/widgets/horizontal_space.dart';
import 'package:flutter/material.dart';

class ItemInfo extends StatelessWidget {
  const ItemInfo({super.key, required this.title, required this.value, required this.onTap});

  final String title;
  final String value;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
      onPress: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: context.textTheme.headlineSmall!.copyWith(fontSize: 16),
          ),
          const Spacer(),
          Text(
            value,
            style: context.textTheme.titleSmall,
            textAlign: TextAlign.end,
          ),
          const HorizontalSpace(size: 8),
          const Padding(
            padding: EdgeInsets.only(top: 3),
            child: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 18,
            ),
          ),
        ],
      ),
    );
  }
}
