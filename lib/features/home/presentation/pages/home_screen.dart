import 'package:cupid_mentor/core/assets/assets.gen.dart';
import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/navigation/navigation_service.dart';
import 'package:cupid_mentor/core/navigation/routes.dart';
import 'package:cupid_mentor/core/widgets/animated_button.dart';
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
  Widget build(BuildContext context, WidgetRef ref) => Container(
        color: context.theme.scaffoldBackgroundColor,
        child: SafeArea(
          child: Scaffold(
            appBar: MyAppBar.myAppBar(
              title: 'Good morning Mia 🌤',
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
                      title: 'Some Tips For You',
                      description:
                          'Covering self-improvement, crafting an engaging bio, body language, etc.',
                      buttonText: 'Explore Tips',
                      onTap: () => NavigationService.instance.push(AppRoutes.tipSelfImprovement),
                      image: Assets.png.tipMenuImage.image(width: 140, height: 140),
                    ),
                    const VerticalSpace(size: 16),
                    MenuWidget(
                      isLeftToRight: false,
                      title: 'The Ideal Gifts',
                      description:
                          'Offering suitable gifts for special occasions like Christmas, Birthdays, etc.',
                      buttonText: 'See All Gifts',
                      onTap: () => NavigationService.instance.push(AppRoutes.tipGift),
                      image: Assets.png.giftMenuImage.image(width: 140, height: 140),
                    ),
                    const VerticalSpace(size: 16),
                    MenuWidget(
                      isLeftToRight: true,
                      title: 'The Perfect Date Spots',
                      description:
                          "Suggesting interesting date spots based on your and partner's preferences.",
                      buttonText: 'View All Spots',
                      onTap: () => NavigationService.instance.push(AppRoutes.tipDateSpot),
                      image: Assets.png.spotMenuImage.image(width: 140, height: 140),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
