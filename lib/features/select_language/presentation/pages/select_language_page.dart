import 'package:cupid_mentor/core/assets/assets.gen.dart';
import 'package:cupid_mentor/core/constants/localization_const.dart';
import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/widgets/animated_button.dart';
import 'package:cupid_mentor/core/widgets/dialog_confirm.dart';
import 'package:cupid_mentor/core/widgets/reset_all_app.dart';
import 'package:cupid_mentor/core/widgets/showup_animation.dart';
import 'package:cupid_mentor/core/widgets/vertical_space.dart';
import 'package:cupid_mentor/features/select_language/presentation/manager/localization_notifier.dart';
import 'package:cupid_mentor/features/select_language/presentation/widgets/item_language.dart';
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
    (String, String, String, String) getContent() {
      // the moment we change the language, the content need to be updated too,
      // but because at that time, we didnt perform the change yet, so have to get like this
      if (currentLanguage == null || currentLanguage == LocalizationEnum.english) {
        return (
          'Continue',
          'Cancel',
          'Start',
          "You've just picked English, you can change the language after, in the Setting page"
        );
      }
      if (currentLanguage == LocalizationEnum.vietnamese) {
        return (
          'Tiếp tục',
          'Hủy',
          'Bắt đầu',
          'Bạn đã chọn Tiếng Việt, bạn có thể thay đổi ngôn ngữ sau, trong phần Cài Đặt.'
        );
      }
      return ('続ける', 'キャンセル', '始める', '日本語を選択しましたが、後で設定ページで言語を変更できます。');
    }

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ShowUpAnimation(
                child: Column(
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
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              ShowUpAnimation(
                delay: 100,
                child: ItemLanguage(
                  isSelected: currentLanguage == LocalizationEnum.english,
                  title: LocalizationEnum.english.displayText,
                  icon: Assets.png.english.image(width: 60, height: 60),
                  onTap: () => setState(() {
                    currentLanguage = LocalizationEnum.english;
                  }),
                ),
              ),
              const VerticalSpace(size: 16),
              ShowUpAnimation(
                delay: 200,
                child: ItemLanguage(
                  isSelected: currentLanguage == LocalizationEnum.japanese,
                  title: LocalizationEnum.japanese.displayText,
                  icon: Assets.png.japanese.image(width: 60, height: 60),
                  onTap: () => setState(() {
                    currentLanguage = LocalizationEnum.japanese;
                  }),
                ),
              ),
              const VerticalSpace(size: 16),
              ShowUpAnimation(
                delay: 300,
                child: ItemLanguage(
                  isSelected: currentLanguage == LocalizationEnum.vietnamese,
                  title: LocalizationEnum.vietnamese.displayText,
                  icon: Assets.png.vietnamese.image(width: 60, height: 60),
                  onTap: () => setState(() {
                    currentLanguage = LocalizationEnum.vietnamese;
                  }),
                ),
              ),
              const VerticalSpace(size: 24),
              ShowUpAnimation(
                delay: 300,
                child: AnimatedButton(
                  enable: currentLanguage != null,
                  onPress: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return DialogConfirm(
                          onPositiveButtonExecute: () async {
                            await localizationNotifier.updateLanguage(currentLanguage!);
                            if (context.mounted) ResetAllApp.restartApp(context);
                          },
                          message: getContent().$4,
                          titleNegativeButton: getContent().$2,
                          titlePositiveButton: getContent().$3,
                        );
                      },
                    );
                  },
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color:
                          currentLanguage == null ? Colors.grey : ref.currentAppColor.primaryColor,
                    ),
                    width: double.infinity,
                    height: 48,
                    child: Center(
                      child: Text(
                        getContent().$1,
                        style: context.textTheme.titleMedium!.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
