import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';

import 'package:cupid_mentor/core/navigation/routes.dart';
import 'package:cupid_mentor/core/utils/loading_utils.dart';
import 'package:cupid_mentor/core/widgets/animated_button.dart';
import 'package:cupid_mentor/core/widgets/dialog_confirm.dart';
import 'package:cupid_mentor/core/widgets/my_app_bar.dart';
import 'package:cupid_mentor/core/widgets/reset_all_app.dart';
import 'package:cupid_mentor/features/select_language/presentation/manager/localization_notifier.dart';
import 'package:cupid_mentor/features/setting/presentation/manager/setting_notifier.dart';
import 'package:cupid_mentor/features/setting/presentation/widgets/dialog_change_language.dart';
import 'package:cupid_mentor/features/setting/presentation/widgets/item_setting.dart';
import 'package:cupid_mentor/features/setting/presentation/widgets/profile_section.dart';
import 'package:cupid_mentor/features/setting/presentation/widgets/theme_setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
                  leftIcon: Icons.menu_book_rounded,
                  title: context.l10n.termOfService,
                  onTap: () {
                    context.push('/${AppRoutes.home}/${AppRoutes.termOfService}');
                  },
                ),
                ItemSetting(
                  leftIcon: Icons.privacy_tip_outlined,
                  title: context.l10n.privacyPolicy,
                  onTap: () {
                    context.push('/${AppRoutes.home}/${AppRoutes.privacyPolicy}');
                  },
                ),
                ItemSetting(
                  leftIcon: Icons.info_outline_rounded,
                  title: context.l10n.aboutUs,
                  onTap: () {
                    context.push('/${AppRoutes.home}/${AppRoutes.aboutTheAuthor}');
                  },
                ),
                ItemSetting(
                  leftIcon: Icons.logout,
                  title: context.l10n.logout,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return DialogConfirm(
                          onPositiveButtonExecute: () async {
                            final result =
                                await ref.read(settingNotifierProvider.notifier).signOut();
                            if (result && context.mounted) {
                              ResetAllApp.restartApp(context);
                            }
                          },
                          message: context.l10n.logoutDialogTitle,
                          titlePositiveButton: context.l10n.logout,
                          icon: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: ref.currentAppColor.buttonBackgroundColor,
                            ),
                            child: const Icon(
                              Icons.logout,
                              color: Colors.red,
                              size: 30,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AnimatedButton(
                      onPress: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return DialogConfirm(
                              onPositiveButtonExecute: () async {
                                LoadingUtils.showLoading();
                                final result = await ref
                                    .read(settingNotifierProvider.notifier)
                                    .deleteAccount();
                                if (result) {
                                  await ref.read(settingNotifierProvider.notifier).signOut();
                                  LoadingUtils.hideLoading();
                                  if (context.mounted) ResetAllApp.restartApp(context);
                                }
                                LoadingUtils.hideLoading();
                              },
                              message: context.l10n.deleteAccountDialogTitle,
                              titlePositiveButton: context.l10n.delete,
                              icon: Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: ref.currentAppColor.buttonBackgroundColor,
                                ),
                                child: const Icon(
                                  Icons.delete_outline_rounded,
                                  color: Colors.red,
                                  size: 30,
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Text(
                        context.l10n.deleteAccount,
                        style: context.textTheme.bodyLarge!.copyWith(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
