import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/widgets/base_dialog.dart';
import 'package:cupid_mentor/features/preload_data/presentation/manager/preload_data_notifier.dart';
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
            ref.read(preloadDataNotifierProvider).loveLanguageOverallInfo?.value(context) ?? '',
            style: context.textTheme.bodyLarge,
          ),
          const SizedBox(
            height: 10,
          ),
          ...ref.read(preloadDataNotifierProvider).loveLanguages.map(
                (loveLanguage) => Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 10),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '${loveLanguage.title.value(context)}: ',
                          style: context.textTheme.titleSmall,
                        ),
                        TextSpan(
                          text: loveLanguage.description.value(context),
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
            ref.read(preloadDataNotifierProvider).loveLanguageConcepts?.value(context) ?? '',
            style: context.textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
