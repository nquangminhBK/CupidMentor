import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
 
import 'package:cupid_mentor/core/utils/snackbar_service.dart';
import 'package:cupid_mentor/core/widgets/animated_button.dart';
import 'package:cupid_mentor/core/widgets/horizontal_space.dart';
import 'package:cupid_mentor/core/widgets/navigate_button.dart';
import 'package:cupid_mentor/core/widgets/progress_bar.dart';
import 'package:cupid_mentor/core/widgets/vertical_space.dart';
import 'package:cupid_mentor/features/onboarding/presentation/manager/onboarding_notifier.dart';
import 'package:cupid_mentor/features/onboarding/presentation/pages/input_partner_basic_info_page.dart';
import 'package:cupid_mentor/features/onboarding/presentation/pages/input_partner_hobbies_page.dart';
import 'package:cupid_mentor/features/onboarding/presentation/pages/input_relationship_status_page.dart';
import 'package:cupid_mentor/features/profile/presentation/manager/profile_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPartnerScreen extends ConsumerStatefulWidget {
  const AddPartnerScreen({super.key});

  @override
  ConsumerState<AddPartnerScreen> createState() => _AddPartnerScreenState();
}

class _AddPartnerScreenState extends ConsumerState<AddPartnerScreen> {
  @override
  void initState() {
    ref.read(onboardingNotifierProvider.notifier).initializeUserInfo();
    super.initState();
  }

  int currentPage = 0;
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    ref.listen(onboardingNotifierProvider, (previous, next) {
      if (next.errorOrSuccess != null) {
        next.errorOrSuccess!.fold((error) {
          SnackBarService.instance.showErrorSnackBar(
            message: error.getDisplayMessage(context),
            context: context,
          );
        }, (success) async {
          Navigator.of(context).pop();
          await ref.read(profileNotifierProvider.notifier).getData();
        });
      }
      if (!(previous?.canGoNext ?? false) && next.canGoNext) {
        pageController.animateToPage(
          currentPage + 1,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
        setState(() {
          currentPage = currentPage + 1;
        });
      }
    });

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Row(
                children: [
                  AnimatedButton(
                    onPress: () {
                      Navigator.of(context).pop();
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(12),
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 20,
                      ),
                    ),
                  ),
                  const HorizontalSpace(size: 12),
                  Expanded(
                    child: ProgressBar(
                      totalStep: 3,
                      currentStep: currentPage,
                      width: context.screenSize.width - 100,
                      color: currentPage > 0
                          ? ref.currentAppColor.secondaryColor
                          : ref.currentAppColor.primaryColor,
                    ),
                  ),
                  SizedBox(
                    width: 70,
                    child: Center(
                      child: Text(
                        '${currentPage + 1}/3',
                        style: context.textTheme.titleSmall,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: pageController,
                  children: const [
                    InputRelationshipStatusPage(
                      isOnboarding: false,
                    ),
                    InputPartnerBasicInfoPage(),
                    InputPartnerHobbiesPage(),
                  ],
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                ),
              ),
              NavigateButton(
                showBackButton: currentPage != 0,
                showLastButton: currentPage == 10,
                onPressBack: () {
                  pageController.animateToPage(
                    currentPage - 1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                  setState(() {
                    currentPage = currentPage - 1;
                  });
                },
                onPressNext: () async {
                  if (currentPage == 2) {
                    await ref.read(onboardingNotifierProvider.notifier).saveUser();
                  } else {
                    await ref
                        .read(onboardingNotifierProvider.notifier)
                        .goNextPage(currentPage, false);
                  }
                },
                onPressLastButton: () {},
                lastButtonTitle: '',
              ),
              const VerticalSpace(size: 10),
            ],
          ),
        ),
      ),
    );
  }
}
