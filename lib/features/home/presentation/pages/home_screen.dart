import 'package:cupid_mentor/core/assets/assets.gen.dart';
import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/navigation/routes.dart';
import 'package:cupid_mentor/core/widgets/base_dialog.dart';
import 'package:cupid_mentor/core/widgets/gradient_text.dart';
import 'package:cupid_mentor/core/widgets/horizontal_space.dart';
import 'package:cupid_mentor/core/widgets/my_app_bar.dart';
import 'package:cupid_mentor/core/widgets/showup_animation.dart';
import 'package:cupid_mentor/core/widgets/vertical_space.dart';
import 'package:cupid_mentor/features/home/presentation/manager/home_notifier.dart';
import 'package:cupid_mentor/features/home/presentation/manager/home_state.dart';
import 'package:cupid_mentor/features/home/presentation/widgets/chat_now_widget.dart';
import 'package:cupid_mentor/features/home/presentation/widgets/dialog_introduction_overall.dart';
import 'package:cupid_mentor/features/home/presentation/widgets/menu_item.dart';
import 'package:cupid_mentor/features/home/presentation/widgets/profile_widget.dart';
import 'package:cupid_mentor/features/home/presentation/widgets/tip_date_spot_introduce_widget.dart';
import 'package:cupid_mentor/features/home/presentation/widgets/tip_gift_introduce_widget.dart';
import 'package:cupid_mentor/features/home/presentation/widgets/tip_self_improvement_introduce_widget.dart';
import 'package:cupid_mentor/features/preload_data/presentation/manager/preload_data_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    ref.read(homeNotifierProvider.notifier).checkNeedShowIntroductionPopup();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (ref.watch(preloadDataNotifierProvider).aboutUs != null) {}
    ref.listen(homeNotifierProvider, (previous, next) {
      if (next is HomeShowIntroductionPopupState) {
        showDialog(
          context: context,
          builder: (_) {
            return const BaseDialog(child: DialogIntroduceOverall());
          },
        );
      }
    });
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
                      style: context.textTheme.headlineSmall?.copyWith(
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
                context.push('/${AppRoutes.home}/${AppRoutes.setting}');
              },
            },
          ),
          body: SizedBox.expand(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const ShowUpAnimation(delay: 100, child: ProfileWidget()),
                    const VerticalSpace(size: 16),
                    const ShowUpAnimation(delay: 200, child: ChatNowWidget()),
                    const VerticalSpace(size: 16),
                    ShowUpAnimation(
                      delay: 300,
                      child: MenuItem(
                        isLeftToRight: true,
                        title: context.l10n.tipSelfImprovementTitle,
                        description: context.l10n.tipSelfImprovementDesc,
                        buttonText: context.l10n.tipSelfImprovementButton,
                        onTap: () =>
                            context.push('/${AppRoutes.home}/${AppRoutes.tipSelfImprovement}'),
                        image: ref.currentTheme == ThemeMode.dark
                            ? Assets.png.tipMenuImage.image(width: 140, height: 140)
                            : Assets.png.tipMenuImageLight.image(width: 140, height: 140),
                        onTapInfo: () {
                          showDialog(
                            context: context,
                            builder: (_) {
                              return const BaseDialog(child: TipSelfImprovementIntroduceWidget());
                            },
                          );
                        },
                      ),
                    ),
                    const VerticalSpace(size: 16),
                    ShowUpAnimation(
                      delay: 400,
                      child: MenuItem(
                        isLeftToRight: false,
                        title: context.l10n.tipGiftTitle,
                        description: context.l10n.tipGiftDesc,
                        buttonText: context.l10n.tipGiftButton,
                        onTap: () => context.push('/${AppRoutes.home}/${AppRoutes.tipGift}'),
                        image: ref.currentTheme == ThemeMode.dark
                            ? Assets.png.giftMenuImage.image(width: 140, height: 140)
                            : Assets.png.giftMenuImageLight.image(width: 140, height: 140),
                        onTapInfo: () {
                          showDialog(
                            context: context,
                            builder: (_) {
                              return const BaseDialog(child: TipGiftIntroduceWidget());
                            },
                          );
                        },
                      ),
                    ),
                    const VerticalSpace(size: 16),
                    ShowUpAnimation(
                      delay: 500,
                      child: MenuItem(
                        isLeftToRight: true,
                        title: context.l10n.tipDateSpotTitle,
                        description: context.l10n.tipDateSpotDesc,
                        buttonText: context.l10n.tipDateSpotButton,
                        onTap: () => context.push('/${AppRoutes.home}/${AppRoutes.tipDateSpot}'),
                        image: ref.currentTheme == ThemeMode.dark
                            ? Assets.png.spotMenuImage.image(width: 140, height: 140)
                            : Assets.png.spotMenuImageLight.image(width: 140, height: 140),
                        onTapInfo: () {
                          showDialog(
                            context: context,
                            builder: (_) {
                              return const BaseDialog(child: TipDateSpotIntroduceWidget());
                            },
                          );
                        },
                      ),
                    ),
                    const VerticalSpace(size: 24),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
