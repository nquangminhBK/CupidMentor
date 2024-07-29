import 'package:cupid_mentor/core/constants/love_language.dart';
import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/widgets/base_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DialogLoveLanguageConcept extends ConsumerWidget {
  const DialogLoveLanguageConcept({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BaseDialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.loveLanguagesDialogTitle,
            style: context.textTheme.titleSmall!.copyWith(fontSize: 20),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            LoveLanguage.overallInfo.value(context),
            style: context.textTheme.bodyLarge,
          ),
          const SizedBox(
            height: 10,
          ),
          ...LoveLanguage.loveLanguages.keys.map(
            (key) => Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 10),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '${LoveLanguage.loveLanguages[key]?.$1.value(context)}: ',
                      style: context.textTheme.titleSmall,
                    ),
                    TextSpan(
                      text: '${LoveLanguage.loveLanguages[key]?.$2.value(context)}',
                      style: context.textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            LoveLanguage.reasonOfConcept.value(context),
            style: context.textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
