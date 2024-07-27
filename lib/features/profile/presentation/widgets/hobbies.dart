import 'package:collection/collection.dart';
import 'package:cupid_mentor/core/constants/hobbies.dart';
import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/widgets/animated_button.dart';
import 'package:cupid_mentor/core/widgets/custom_tag.dart';
import 'package:cupid_mentor/core/widgets/vertical_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HobbiesWidget extends ConsumerWidget {
  const HobbiesWidget({super.key, required this.hobbies, required this.onTapEdit});

  final List<String> hobbies;
  final Function() onTapEdit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const VerticalSpace(size: 16),
        Row(
          children: [
            Text(
              context.l10n.hobbies,
              style: context.textTheme.headlineSmall!.copyWith(fontSize: 16),
            ),
            const Spacer(),
            AnimatedButton(
              onPress: onTapEdit,
              child: Text(
                context.l10n.edit,
                style: context.textTheme.bodyLarge,
              ),
            ),
          ],
        ),
        const VerticalSpace(size: 16),
        hobbies.isNotEmpty
            ? SizedBox(
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
              )
            : Center(
                child: Text(
                  context.l10n.noData,
                  style: context.textTheme.bodyLarge,
                ),
              ),
        const VerticalSpace(size: 16),
        if (hobbies.isNotEmpty)
          Container(
            width: double.infinity,
            height: 0.5,
            color: ref.currentAppColor.textColor,
          ),
      ],
    );
  }
}
