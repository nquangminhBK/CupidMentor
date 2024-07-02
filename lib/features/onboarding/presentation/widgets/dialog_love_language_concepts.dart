import 'package:cupid_mentor/core/constants/love_language.dart';
import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/navigation/navigation_service.dart';
import 'package:cupid_mentor/core/widgets/icon_close_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DialogLoveLanguageConcept extends ConsumerWidget {
  const DialogLoveLanguageConcept({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: ref.currentAppColor.screenBackgroundColor,
          ),
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "What is the \"Love language\"",
                    style: context.textTheme.titleSmall!
                        .copyWith(color: ref.currentAppColor.textColor, fontSize: 20),
                  ),
                  const Spacer(),
                  IconCloseButton(
                    onPress: () {
                      NavigationService.instance.pop();
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                LoveLanguage.overallInfo,
                style: context.textTheme.bodyLarge!.copyWith(color: ref.currentAppColor.textColor),
              ),
              const SizedBox(
                height: 10,
              ),
              ...LoveLanguage.loveLanguages.keys.map((key) => Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: 10),
                    child: RichText(
                        text: TextSpan(
                      children: [
                        TextSpan(
                          text: '$key: ',
                          style: context.textTheme.titleSmall!
                              .copyWith(color: ref.currentAppColor.textColor),
                        ),
                        TextSpan(
                          text: '${LoveLanguage.loveLanguages[key]}',
                          style: context.textTheme.bodyLarge!
                              .copyWith(color: ref.currentAppColor.textColor),
                        ),
                      ],
                    )),
                  )),
              const SizedBox(
                height: 10,
              ),
              Text(
                LoveLanguage.reasonOfConcept,
                style: context.textTheme.bodyLarge!.copyWith(color: ref.currentAppColor.textColor),
              ),
            ],
          )),
    );
  }
}
