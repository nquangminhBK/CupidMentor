import 'package:cupid_mentor/core/assets/assets.gen.dart';
import 'package:cupid_mentor/core/constants/hobbies.dart';
import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/navigation/navigation_service.dart';
import 'package:cupid_mentor/core/navigation/routes.dart';
import 'package:cupid_mentor/core/widgets/gradient_text.dart';
import 'package:cupid_mentor/core/widgets/horizontal_space.dart';
import 'package:cupid_mentor/core/widgets/my_app_bar.dart';
import 'package:cupid_mentor/core/widgets/vertical_space.dart';
import 'package:cupid_mentor/features/home/presentation/widgets/chat_now_widget.dart';
import 'package:cupid_mentor/features/home/presentation/widgets/menu_widget.dart';
import 'package:cupid_mentor/features/home/presentation/widgets/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: context.theme.scaffoldBackgroundColor,
      child: SafeArea(
        child: Scaffold(
          appBar: MyAppBar.myAppBar(
            titleWidget: Row(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const HorizontalSpace(size: 24),
                    Assets.png.appIcon.image(width: 30, height: 30),
                    GradientText(
                      'Cupid Mentor',
                      style: context.textTheme.titleLarge?.copyWith(
                        fontSize: 20,
                      ),
                      gradient: ref.currentAppColor.mainGradient,
                    ),
                  ],
                ),
              ],
            ),
            ref: ref,
            context: context,
            hasBackIcon: false,
            actionButton: {
              Icons.settings_rounded: () {
                NavigationService.instance.push(AppRoutes.setting);
              },
            },
          ),
          body: SizedBox.expand(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const ProfileWidget(),
                  const VerticalSpace(size: 16),
                  const ChatNowWidget(),
                  const VerticalSpace(size: 16),
                  MenuWidget(
                    isLeftToRight: true,
                    title: context.l10n.tipSelfImprovementTitle,
                    description: context.l10n.tipSelfImprovementDesc,
                    buttonText: context.l10n.tipSelfImprovementButton,
                    onTap: () => NavigationService.instance.push(AppRoutes.tipSelfImprovement),
                    image: ref.currentTheme == ThemeMode.dark
                        ? Assets.png.tipMenuImage.image(width: 140, height: 140)
                        : Assets.png.tipMenuImageLight.image(width: 140, height: 140),
                  ),
                  const VerticalSpace(size: 16),
                  MenuWidget(
                    isLeftToRight: false,
                    title: context.l10n.tipGiftTitle,
                    description: context.l10n.tipGiftDesc,
                    buttonText: context.l10n.tipGiftButton,
                    onTap: () => NavigationService.instance.push(AppRoutes.tipGift),
                    image: ref.currentTheme == ThemeMode.dark
                        ? Assets.png.giftMenuImage.image(width: 140, height: 140)
                        : Assets.png.giftMenuImageLight.image(width: 140, height: 140),
                  ),
                  const VerticalSpace(size: 16),
                  MenuWidget(
                    isLeftToRight: true,
                    title: context.l10n.tipDateSpotTitle,
                    description: context.l10n.tipDateSpotDesc,
                    buttonText: context.l10n.tipDateSpotButton,
                    onTap: () => NavigationService.instance.push(AppRoutes.tipDateSpot),
                    image: ref.currentTheme == ThemeMode.dark
                        ? Assets.png.spotMenuImage.image(width: 140, height: 140)
                        : Assets.png.spotMenuImageLight.image(width: 140, height: 140),
                  ),
                  const VerticalSpace(size: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
