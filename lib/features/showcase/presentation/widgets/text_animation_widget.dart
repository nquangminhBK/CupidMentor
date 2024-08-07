import 'package:cupid_mentor/core/assets/assets.gen.dart';
import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/widgets/gradient_text.dart';
import 'package:cupid_mentor/core/widgets/showup_animation.dart';
import 'package:cupid_mentor/features/showcase/presentation/manager/showcase_notifier.dart';
import 'package:cupid_mentor/features/showcase/presentation/manager/showcase_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TextAnimationWidget extends ConsumerStatefulWidget {
  const TextAnimationWidget({super.key});

  @override
  ConsumerState<TextAnimationWidget> createState() => _TextAnimationWidgetState();
}

class _TextAnimationWidgetState extends ConsumerState<TextAnimationWidget>
    with TickerProviderStateMixin {
  late AnimationController _step1AllTextController;
  late Animation<Offset> _step1AllTextAnimation;
  double _step1AllTextOpacity = 1;
  double _step2AllTextOpacity = 1;
  late AnimationController _step2TitleController;
  late Animation<Offset> _step2TitleAnimation;
  late AnimationController _step2DescController;
  late Animation<Offset> _step2DescAnimation;
  late AnimationController _step2AllTextController;
  late Animation<Offset> _step2AllTextAnimation;
  late AnimationController _step3TitleController;
  late Animation<Offset> _step3TitleAnimation;
  late AnimationController _step3DescController;
  late Animation<Offset> _step3DescAnimation;

  @override
  void dispose() {
    _step1AllTextController.dispose();
    _step2TitleController.dispose();
    _step2DescController.dispose();
    _step2AllTextController.dispose();
    _step3TitleController.dispose();
    _step3DescController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _step1AllTextController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    final step1TextBgCurve =
        CurvedAnimation(curve: Curves.decelerate, parent: _step1AllTextController);
    if (mounted) {
      _step1AllTextAnimation =
          Tween<Offset>(begin: Offset.zero, end: const Offset(-0.5, 0)).animate(step1TextBgCurve);
    }

    _step2TitleController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    final step2TitleCurve =
        CurvedAnimation(curve: Curves.decelerate, parent: _step2TitleController);
    if (mounted) {
      _step2TitleAnimation =
          Tween<Offset>(begin: const Offset(1.5, 0), end: Offset.zero).animate(step2TitleCurve);
    }

    _step2DescController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 520));
    final step2DescCurve = CurvedAnimation(curve: Curves.decelerate, parent: _step2DescController);
    if (mounted) {
      _step2DescAnimation =
          Tween<Offset>(begin: const Offset(1.5, 0), end: Offset.zero).animate(step2DescCurve);
    }

    _step2AllTextController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    final step2TextBgCurve =
        CurvedAnimation(curve: Curves.decelerate, parent: _step2AllTextController);
    if (mounted) {
      _step2AllTextAnimation =
          Tween<Offset>(begin: Offset.zero, end: const Offset(-0.5, 0)).animate(step2TextBgCurve);
    }

    _step3TitleController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    final step3TitleCurve =
        CurvedAnimation(curve: Curves.decelerate, parent: _step3TitleController);
    if (mounted) {
      _step3TitleAnimation =
          Tween<Offset>(begin: const Offset(1.5, 0), end: Offset.zero).animate(step3TitleCurve);
    }

    _step3DescController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 520));
    final step3DescCurve = CurvedAnimation(curve: Curves.decelerate, parent: _step3DescController);
    if (mounted) {
      _step3DescAnimation =
          Tween<Offset>(begin: const Offset(1.5, 0), end: Offset.zero).animate(step3DescCurve);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(showcaseNotifierProvider, (previous, next) {
      if (next is ShowCaseGoToStep2State) {
        _step1AllTextController.forward();
        setState(() {
          _step1AllTextOpacity = 0.0;
        });
        Future.delayed(const Duration(milliseconds: 300), () {
          _step2TitleController.forward();
          Future.delayed(const Duration(milliseconds: 100), () {
            _step2DescController.forward();
          });
        });
      }
      if (next is ShowCaseGoToStep3State) {
        _step2AllTextController.forward();
        setState(() {
          _step2AllTextOpacity = 0.0;
        });
        Future.delayed(const Duration(milliseconds: 300), () {
          _step3TitleController.forward();
          Future.delayed(const Duration(milliseconds: 100), () {
            _step3DescController.forward();
          });
        });
      }
    });
    return Stack(
      children: [
        AnimatedOpacity(
          opacity: _step1AllTextOpacity,
          curve: Curves.decelerate,
          duration: const Duration(milliseconds: 500),
          child: SlideTransition(
            position: _step1AllTextAnimation,
            child: Column(
              children: [
                SizedBox(
                  height: 86,
                  child: ShowUpAnimation(
                    delay: 100,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Assets.svg.profileProwessBgText
                              .svg(fit: BoxFit.fitWidth, width: double.infinity),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: ref.currentTheme == ThemeMode.dark
                                ? Text(
                                    'Profile Prowess',
                                    style: context.textTheme.titleLarge?.copyWith(
                                      fontSize: 24,
                                    ),
                                  )
                                : GradientText(
                                    'Profile Prowess',
                                    style: context.textTheme.titleLarge?.copyWith(
                                      fontSize: 24,
                                    ),
                                    gradient: ref.currentAppColor.mainGradient,
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ShowUpAnimation(
                  delay: 200,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
                    child: Text(
                      context.l10n.profileProwessDescription,
                      style: context.textTheme.bodyLarge,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        AnimatedOpacity(
          opacity: _step2AllTextOpacity,
          curve: Curves.decelerate,
          duration: const Duration(milliseconds: 500),
          child: SlideTransition(
            position: _step2AllTextAnimation,
            child: Column(
              children: [
                SizedBox(
                  height: 86,
                  child: SlideTransition(
                    position: _step2TitleAnimation,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Assets.svg.selfEnhancementBgText
                              .svg(fit: BoxFit.fitWidth, width: double.infinity),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: ref.currentTheme == ThemeMode.dark
                                ? Text(
                                    'Self-Enhancement Insights',
                                    style: context.textTheme.titleLarge?.copyWith(
                                      fontSize: 24,
                                    ),
                                  )
                                : GradientText(
                                    'Self-Enhancement Insights',
                                    style: context.textTheme.titleLarge?.copyWith(
                                      fontSize: 24,
                                    ),
                                    gradient: ref.currentAppColor.mainGradient,
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SlideTransition(
                  position: _step2DescAnimation,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
                    child: Text(
                      context.l10n.selfEnhancementDescription,
                      style: context.textTheme.bodyLarge,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Column(
          children: [
            SizedBox(
              height: 86,
              child: SlideTransition(
                position: _step3TitleAnimation,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Assets.svg.datingDelightBgText
                          .svg(fit: BoxFit.fitWidth, width: double.infinity),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: ref.currentTheme == ThemeMode.dark
                            ? Text(
                                'Dating Delights',
                                style: context.textTheme.titleLarge?.copyWith(
                                  fontSize: 24,
                                ),
                              )
                            : GradientText(
                                'Dating Delights',
                                style: context.textTheme.titleLarge?.copyWith(
                                  fontSize: 24,
                                ),
                                gradient: ref.currentAppColor.mainGradient,
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SlideTransition(
              position: _step3DescAnimation,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
                child: Text(
                  context.l10n.datingDelightDescription,
                  style: context.textTheme.bodyLarge,
                ),
              ),
            ),
          ],
        ),
        const Positioned(
          right: -500,
          child: SizedBox(),
        ),
      ],
    );
  }
}
