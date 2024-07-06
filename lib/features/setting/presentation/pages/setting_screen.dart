import 'package:cupid_mentor/core/constants/localization_const.dart';
import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/widgets/my_app_bar.dart';
import 'package:cupid_mentor/core/widgets/reset_all_app.dart';
import 'package:cupid_mentor/features/localization/presentation/manager/localization_notifier.dart';
import 'package:cupid_mentor/features/setting/presentation/manager/setting_notifier.dart';
import 'package:cupid_mentor/features/setting/presentation/pages/widgets/item_setting.dart';
import 'package:cupid_mentor/features/setting/presentation/pages/widgets/profile_section.dart';
import 'package:cupid_mentor/features/setting/presentation/pages/widgets/theme_setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingScreen extends ConsumerStatefulWidget {
  const SettingScreen({super.key});

  @override
  ConsumerState<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends ConsumerState<SettingScreen> {
  @override
  void initState() {
    ref.read(settingNotifierProvider.notifier).getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.scaffoldBackgroundColor,
      child: SafeArea(
        child: Scaffold(
          appBar: MyAppBar.myAppBar(title: context.l10n.helloWorld, ref: ref, context: context),
          body: Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
            child: Column(
              children: [
                const ProfileSection(),
                const ThemeSetting(),
                ItemSetting(
                  leftIcon: Icons.language,
                  title: 'Language',
                  onTap: ()async {
                    final currentLang = ref.read(localizationNotifierProvider).lang;
                    if (currentLang == LocalizationEnum.english) {
                      await ref
                          .read(localizationNotifierProvider.notifier)
                          .updateLanguage(LocalizationEnum.japanese);
                    }
                    if (currentLang == LocalizationEnum.japanese) {
                      await ref
                          .read(localizationNotifierProvider.notifier)
                          .updateLanguage(LocalizationEnum.vietnamese);
                    }
                    if (currentLang == LocalizationEnum.vietnamese) {
                      await ref
                          .read(localizationNotifierProvider.notifier)
                          .updateLanguage(LocalizationEnum.english);
                    }
                    ResetAllApp.restartApp(context);
                  },
                ),
                ItemSetting(
                  leftIcon: Icons.help_outline_rounded,
                  title: 'Help center',
                  onTap: () {},
                ),
                ItemSetting(
                  leftIcon: Icons.info_outline_rounded,
                  title: 'About the author',
                  onTap: () {},
                ),
                ItemSetting(
                  leftIcon: Icons.logout,
                  title: 'Logout',
                  onTap: () async {
                    final result = await ref.read(settingNotifierProvider.notifier).signOut();
                    if (result && context.mounted) {
                      ResetAllApp.restartApp(context);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
