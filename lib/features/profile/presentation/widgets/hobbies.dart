import 'package:collection/collection.dart';
import 'package:cupid_mentor/core/constants/hobbies.dart';
import 'package:cupid_mentor/core/constants/personalities.dart';
import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/widgets/custom_tag.dart';
import 'package:cupid_mentor/core/widgets/vertical_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HobbiesWidget extends ConsumerWidget {
  const HobbiesWidget({super.key, required this.hobbies});

  final List<String> hobbies;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const VerticalSpace(size: 16),
        Row(
          children: [
            Text(
              'Hobbies',
              style: context.textTheme.headlineSmall!.copyWith(fontSize: 16),
            ),
            const Spacer(),
            const Text('Edit'),
          ],
        ),
        const VerticalSpace(size: 16),
        SizedBox(
          width: double.infinity,
          child: Wrap(
            spacing: 12,
            runSpacing: 12,
            children: hobbies
                .map(
                  (e) => CustomTag(
                    title: Hobbies.hobbies
                            .firstWhereOrNull((personality) => personality.id == e)
                            ?.value(context) ??
                        '',
                    isSelected: false,
                    onTap: () {},
                  ),
                )
                .toList(),
          ),
        ),
        const VerticalSpace(size: 16),
        Container(
          width: double.infinity,
          height: 0.5,
          color: ref.currentAppColor.textColor,
        ),
      ],
    );
  }
}
