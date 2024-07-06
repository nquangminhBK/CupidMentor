import 'package:cupid_mentor/core/assets/assets.gen.dart';
import 'package:cupid_mentor/core/constants/localization_const.dart';
import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/utils/snackbar_utils.dart';
import 'package:cupid_mentor/core/widgets/animated_button.dart';
import 'package:cupid_mentor/core/widgets/vertical_space.dart';
import 'package:cupid_mentor/features/localization/presentation/manager/localization_notifier.dart';
import 'package:cupid_mentor/features/localization/presentation/widgets/dialog_confirm_language.dart';
import 'package:cupid_mentor/features/localization/presentation/widgets/item_language.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectLanguagePage extends ConsumerStatefulWidget {
  const SelectLanguagePage({super.key});

  @override
  ConsumerState<SelectLanguagePage> createState() => _SelectLanguagePageState();
}

class _SelectLanguagePageState extends ConsumerState<SelectLanguagePage> {
  LocalizationEnum? currentLanguage;

  @override
  Widget build(BuildContext context) {
    final localizationNotifier = ref.read(localizationNotifierProvider.notifier);
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Pick your language',
                    style: context.textTheme.titleLarge!.copyWith(
                      color: ref.currentAppColor.textColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    '言語を選んでください',
                    style: context.textTheme.titleLarge!.copyWith(
                      color: ref.currentAppColor.textColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Chọn ngôn ngữ',
                    style: context.textTheme.titleLarge!.copyWith(
                      color: ref.currentAppColor.textColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ItemLanguage(
                    isSelected: currentLanguage == LocalizationEnum.english,
                    title: 'English',
                    icon: Assets.png.english.image(width: 60, height: 60),
                    onTap: () => setState(() {
                      currentLanguage = LocalizationEnum.english;
                    }),
                  ),
                  const VerticalSpace(size: 16),
                  ItemLanguage(
                    isSelected: currentLanguage == LocalizationEnum.japanese,
                    title: '日本語',
                    icon: Assets.png.japanese.image(width: 60, height: 60),
                    onTap: () => setState(() {
                      currentLanguage = LocalizationEnum.japanese;
                    }),
                  ),
                  const VerticalSpace(size: 16),
                  ItemLanguage(
                    isSelected: currentLanguage == LocalizationEnum.vietnamese,
                    title: 'Tiếng Việt',
                    icon: Assets.png.vietnamese.image(width: 60, height: 60),
                    onTap: () => setState(() {
                      currentLanguage = LocalizationEnum.vietnamese;
                    }),
                  ),
                  const VerticalSpace(size: 24),
                  AnimatedButton(
                    enable: currentLanguage != null,
                    onPress: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return DialogConfirm(
                            onPositiveButtonExecute: () async {
                              localizationNotifier.updateLanguage(currentLanguage!);
                            },
                            message:
                                "You've just picked English, you can change the language after, in the Setting page",
                            titlePositiveButton: 'Start',
                          );
                        },
                      );
                    },
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: currentLanguage == null
                            ? Colors.grey
                            : ref.currentAppColor.primaryColor,
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                      width: double.infinity,
                      height: 48,
                      child: Center(
                        child: Text(
                          'Continue',
                          style: context.textTheme.titleMedium!.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
