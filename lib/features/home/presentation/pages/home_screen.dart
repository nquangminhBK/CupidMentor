import 'package:cupid_mentor/core/assets/assets.gen.dart';
import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/navigation/navigation_service.dart';
import 'package:cupid_mentor/core/navigation/routes.dart';
import 'package:cupid_mentor/core/widgets/animated_button.dart';
import 'package:cupid_mentor/core/widgets/vertical_space.dart';
import 'package:cupid_mentor/features/home/presentation/widgets/chat_now_widget.dart';
import 'package:cupid_mentor/features/home/presentation/widgets/menu_widget.dart';
import 'package:cupid_mentor/features/home/presentation/widgets/profile_widget.dart';
import 'package:flutter/cupertino.dart';
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
          appBar: AppBar(
            titleSpacing: 0,
            title: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  "Good morning Mia 🌤",
                  style: context.textTheme.titleLarge!
                      .copyWith(fontSize: 20, color: ref.currentAppColor.textColor),
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: AnimatedButton(
                    onPress: () {},
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey.withOpacity(0.5)),
                        padding: const EdgeInsets.all(4),
                        child: const Icon(
                          Icons.person_outline_rounded,
                          color: Colors.grey,
                        ))),
              )
            ],
            automaticallyImplyLeading: false,
            backgroundColor: context.theme.scaffoldBackgroundColor,
            elevation: 0,
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
                        "Covering self-improvement, crafting an engaging bio, body language, etc.",
                    buttonText: "Explore Tips",
                    onTap: () => NavigationService.instance.push(AppRoutes.tipSelfImprovement),
                    image: Assets.png.tipMenuImage.image(width: 140, height: 140),
                  ),
                  const VerticalSpace(size: 16),
                  MenuWidget(
                    isLeftToRight: false,
                    title: 'The Ideal Gifts',
                    description:
                        "Offering suitable gifts for special occasions like Christmas, Birthdays, etc.",
                    buttonText: "See All Gifts",
                    onTap: () => NavigationService.instance.push(AppRoutes.tipGift),
                    image: Assets.png.giftMenuImage.image(width: 140, height: 140),
                  ),
                  const VerticalSpace(size: 16),
                  MenuWidget(
                    isLeftToRight: true,
                    title: 'The Perfect Date Spots',
                    description:
                        "Suggesting interesting date spots based on your and partner's preferences.",
                    buttonText: "View All Spots",
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
}
