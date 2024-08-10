import 'package:cupid_mentor/core/assets/assets.gen.dart';
import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/utils/snackbar_service.dart';
import 'package:cupid_mentor/core/widgets/animated_button.dart';
import 'package:cupid_mentor/core/widgets/gradient_text.dart';
import 'package:cupid_mentor/core/widgets/horizontal_space.dart';
import 'package:cupid_mentor/core/widgets/my_app_bar.dart';
import 'package:cupid_mentor/core/widgets/vertical_space.dart';
import 'package:cupid_mentor/features/preload_data/presentation/manager/preload_data_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutTheAuthorScreen extends ConsumerStatefulWidget {
  const AboutTheAuthorScreen({super.key});

  @override
  ConsumerState<AboutTheAuthorScreen> createState() => _AboutTheAuthorScreenState();
}

class _AboutTheAuthorScreenState extends ConsumerState<AboutTheAuthorScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.scaffoldBackgroundColor,
      child: SafeArea(
        child: Scaffold(
          appBar: MyAppBar.myAppBar(title: context.l10n.aboutUs, ref: ref, context: context),
          body: Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Assets.png.appIcon.image(width: 60, height: 60),
                      GradientText(
                        'Cupid Mentor',
                        style: context.textTheme.headlineSmall?.copyWith(
                          fontSize: 36,
                        ),
                        gradient: ref.currentAppColor.mainGradient,
                      ),
                    ],
                  ),
                  const VerticalSpace(size: 12),
                  Text(
                    ref.preloadData.aboutUs?.value(context) ?? '',
                    style: context.textTheme.bodyLarge!.copyWith(height: 1.5),
                  ),
                  const VerticalSpace(size: 12),
                  Row(
                    children: [
                      Text(
                        '${context.l10n.getInTouch}: ',
                        style: context.textTheme.bodyLarge!.copyWith(height: 1.5),
                      ),
                      const HorizontalSpace(size: 16),
                      AnimatedButton(
                        onPress: () {
                          final contactLinkedin =
                              ref.watch(preloadDataNotifierProvider).contactInfo.linkedIn;
                          try {
                            launchUrl(Uri.parse(contactLinkedin));
                          } catch (e) {
                            debugPrint('$e');
                            SnackBarService.instance.showErrorSnackBar(
                              message: context.l10n.actionFailed,
                              context: context,
                            );
                          }
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: ref.currentAppColor.buttonBackgroundColor,
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Assets.png.linkedin.image(),
                        ),
                      ),
                    ],
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
