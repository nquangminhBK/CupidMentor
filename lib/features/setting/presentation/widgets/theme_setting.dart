import 'package:cupid_mentor/core/assets/assets.gen.dart';
import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/themes_colors/themes_provider.dart';
import 'package:cupid_mentor/features/setting/presentation/widgets/item_setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeSetting extends ConsumerStatefulWidget {
  const ThemeSetting({super.key});

  @override
  ConsumerState<ThemeSetting> createState() => _ThemeSettingState();
}

class _ThemeSettingState extends ConsumerState<ThemeSetting> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeNotifierProvider).currentTheme;
    if (themeMode == ThemeMode.dark) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    return ItemSetting(
      leftIcon: Icons.remove_red_eye_outlined,
      rightWidget: Row(
        children: [
          Assets.lottie.darkLightMode.lottie(controller: _controller, repeat: false),
          Text(
            themeMode == ThemeMode.dark ? context.l10n.dark : context.l10n.light,
            style: context.textTheme.titleMedium,
          ),
        ],
      ),
      title: context.l10n.theme,
      onTap: () async {
        await ref.read(themeNotifierProvider.notifier).switchTheme();
      },
    );
  }
}
