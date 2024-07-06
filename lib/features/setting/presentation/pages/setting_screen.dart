import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/themes_colors/themes_provider.dart';
import 'package:cupid_mentor/core/widgets/my_app_bar.dart';
import 'package:cupid_mentor/core/widgets/reset_all_app.dart';
import 'package:cupid_mentor/features/setting/presentation/manager/setting_notifier.dart';
import 'package:cupid_mentor/features/setting/presentation/pages/widgets/item_setting.dart';
import 'package:cupid_mentor/features/setting/presentation/pages/widgets/profile_section.dart';
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
          appBar: MyAppBar.myAppBar(title: 'Setting', ref: ref, context: context),
          body: Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
            child: Column(
              children: [
                const ProfileSection(),
                ItemSetting(
                  icon: Icons.remove_red_eye_outlined,
                  title: 'Theme',
                  onTap: () async {
                    await ref.watch(themeNotifierProvider.notifier).switchTheme();
                  },
                ),
                ItemSetting(
                  icon: Icons.language,
                  title: 'Language',
                  onTap: () {},
                ),
                ItemSetting(
                  icon: Icons.help_outline_rounded,
                  title: 'Help center',
                  onTap: () {},
                ),
                ItemSetting(
                  icon: Icons.info_outline_rounded,
                  title: 'About the author',
                  onTap: () {},
                ),
                ItemSetting(
                  icon: Icons.logout,
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
