import 'package:cupid_mentor/core/assets/assets.gen.dart';
import 'package:cupid_mentor/core/constants/localization_const.dart';
import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/navigation/navigation_service.dart';
import 'package:cupid_mentor/core/widgets/animated_button.dart';
import 'package:cupid_mentor/core/widgets/icon_close_button.dart';
import 'package:cupid_mentor/core/widgets/reset_all_app.dart';
import 'package:cupid_mentor/core/widgets/vertical_space.dart';
import 'package:cupid_mentor/features/localization/presentation/manager/localization_notifier.dart';
import 'package:cupid_mentor/features/localization/presentation/widgets/item_language.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DialogChangeLanguage extends ConsumerStatefulWidget {
  const DialogChangeLanguage({super.key});

  @override
  ConsumerState<DialogChangeLanguage> createState() => _DialogChangeLanguageState();
}

class _DialogChangeLanguageState extends ConsumerState<DialogChangeLanguage> {
  LocalizationEnum? currentLanguage;

  @override
  void initState() {
    currentLanguage = ref.read(localizationNotifierProvider).lang;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final localizationNotifier = ref.read(localizationNotifierProvider.notifier);
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ref.currentAppColor.screenBackgroundColor,
        ),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(horizontal: 24),
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Change language',
                  style: context.textTheme.titleSmall!.copyWith(fontSize: 20),
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
            ItemLanguage(
              isSelected: currentLanguage == LocalizationEnum.english,
              title: LocalizationEnum.english.displayText,
              icon: Assets.png.english.image(width: 60, height: 60),
              onTap: () => setState(() {
                currentLanguage = LocalizationEnum.english;
              }),
            ),
            const VerticalSpace(size: 16),
            ItemLanguage(
              isSelected: currentLanguage == LocalizationEnum.japanese,
              title: LocalizationEnum.japanese.displayText,
              icon: Assets.png.japanese.image(width: 60, height: 60),
              onTap: () => setState(() {
                currentLanguage = LocalizationEnum.japanese;
              }),
            ),
            const VerticalSpace(size: 16),
            ItemLanguage(
              isSelected: currentLanguage == LocalizationEnum.vietnamese,
              title: LocalizationEnum.vietnamese.displayText,
              icon: Assets.png.vietnamese.image(width: 60, height: 60),
              onTap: () => setState(() {
                currentLanguage = LocalizationEnum.vietnamese;
              }),
            ),
            const VerticalSpace(size: 24),
            AnimatedButton(
              enable: currentLanguage != null,
              onPress: () async{
                if (currentLanguage == ref.read(localizationNotifierProvider).lang) {
                  NavigationService.instance.pop();
                  return;
                }
                await localizationNotifier.updateLanguage(currentLanguage!);
                if (context.mounted) ResetAllApp.restartApp(context);
              },
              borderRadius: BorderRadius.circular(8),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: currentLanguage == null ? Colors.grey : ref.currentAppColor.primaryColor,
                ),
                margin: const EdgeInsets.symmetric(vertical: 4),
                width: double.infinity,
                height: 48,
                child: Center(
                  child: Text(
                    'Change',
                    style: context.textTheme.titleMedium!.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
