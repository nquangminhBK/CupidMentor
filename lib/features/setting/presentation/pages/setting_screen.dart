import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/widgets/my_app_bar.dart';
import 'package:cupid_mentor/core/widgets/reset_all_app.dart';
import 'package:cupid_mentor/features/localization/presentation/manager/localization_notifier.dart';
import 'package:cupid_mentor/features/setting/presentation/manager/setting_notifier.dart';
import 'package:cupid_mentor/features/setting/presentation/widgets/dialog_change_language.dart';
import 'package:cupid_mentor/features/setting/presentation/widgets/item_setting.dart';
import 'package:cupid_mentor/features/setting/presentation/widgets/profile_section.dart';
import 'package:cupid_mentor/features/setting/presentation/widgets/theme_setting.dart';
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
          appBar: MyAppBar.myAppBar(title: context.l10n.setting, ref: ref, context: context),
          body: Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
            child: Column(
              children: [
                const ProfileSection(),
                const ThemeSetting(),
                ItemSetting(
                  leftIcon: Icons.language,
                  rightWidget: Text(
                    ref.watch(localizationNotifierProvider).lang.displayText,
                    style: context.textTheme.titleMedium,
                  ),
                  title: context.l10n.language,
                  onTap: () async {
                    await showDialog(
                      context: context,
                      builder: (context) {
                        return const DialogChangeLanguage();
                      },
                    );
                  },
                ),
                ItemSetting(
                  leftIcon: Icons.help_outline_rounded,
                  title: context.l10n.helpCenter,
                  onTap: () {},
                ),
                ItemSetting(
                  leftIcon: Icons.info_outline_rounded,
                  title: context.l10n.aboutTheAuthor,
                  onTap: () {},
                ),
                ItemSetting(
                  leftIcon: Icons.logout,
                  title: context.l10n.logout,
                  onTap: () async {
                    final result = await ref.read(settingNotifierProvider.notifier).signOut();
                    if (result && context.mounted) {
                      ResetAllApp.restartApp(context);
                    }
                  },
                ),
                ItemSetting(
                  leftIcon: Icons.logout,
                  title: 'Delete account',
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
