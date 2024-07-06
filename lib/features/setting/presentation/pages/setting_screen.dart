import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/widgets/animated_button.dart';
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
          appBar: AppBar(
            titleSpacing: 0,
            title: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Setting',
                style: context.textTheme.titleLarge!.copyWith(fontSize: 20),
              ),
            ),
            backgroundColor: context.theme.scaffoldBackgroundColor,
            elevation: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
            child: Column(
              children: [
                const ProfileSection(),
                ItemSetting(
                  icon: Icons.remove_red_eye_outlined,
                  title: 'Theme',
                  onTap: () {},
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
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
