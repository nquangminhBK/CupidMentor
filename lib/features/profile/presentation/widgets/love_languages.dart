import 'package:cupid_mentor/core/constants/love_language.dart';
import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/widgets/animated_button.dart';
import 'package:cupid_mentor/core/widgets/custom_tag.dart';
import 'package:cupid_mentor/core/widgets/vertical_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoveLanguagesWidget extends ConsumerWidget {
  const LoveLanguagesWidget({super.key, required this.loveLanguages, required this.onTapEdit});

  final List<String> loveLanguages;
  final Function() onTapEdit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const VerticalSpace(size: 16),
        Row(
          children: [
            Text(
              context.l10n.loveLanguages,
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
        SizedBox(
          width: double.infinity,
          child: Wrap(
            spacing: 12,
            runSpacing: 12,
            children: loveLanguages
                .map(
                  (e) => CustomTag(
                    title:
                        '${loveLanguages.indexOf(e) + 1} • ${LoveLanguage.loveLanguages[e]?.$1.value(context) ?? ''}',
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
