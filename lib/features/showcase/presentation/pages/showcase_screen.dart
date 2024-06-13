import 'package:cupid_mentor/core/widgets/vertical_space.dart';
import 'package:cupid_mentor/features/showcase/presentation/pages/dating_delights_page.dart';
import 'package:cupid_mentor/features/showcase/presentation/pages/profile_prowess_page.dart';
import 'package:cupid_mentor/features/showcase/presentation/pages/self_enhancement_page.dart';
import 'package:cupid_mentor/features/showcase/presentation/widgets/navigate_button.dart';
import 'package:cupid_mentor/core/widgets/page_indicator.dart';
import 'package:cupid_mentor/features/showcase/presentation/widgets/skip_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShowcaseScreen extends ConsumerStatefulWidget {
  const ShowcaseScreen({super.key});

  @override
  ConsumerState<ShowcaseScreen> createState() => _ShowcasePageState();
}

class _ShowcasePageState extends ConsumerState<ShowcaseScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              SkipButton(
                visible: currentIndex != 2,
              ),
              Expanded(
                child: PageView(
                  children: [
                    ProfileProwessPage(),
                    SelfEnhancementPage(),
                    DatingDelightPage(),
                  ],
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
              ),
              const VerticalSpace(size: 17),
              PageIndicator(
                totalCount: 3,
                currentIndex: currentIndex,
              ),
              const VerticalSpace(size: 22),
              NavigateButton(
                showBackButton: currentIndex != 0,
                showLastButton: currentIndex == 2,
              ),
              const VerticalSpace(size: 10),
            ],
          ),
        ),
      ),
    );
  }
}
