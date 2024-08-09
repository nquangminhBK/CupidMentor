import 'package:cupid_mentor/core/constants/relationship_type.dart';
import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/navigation/routes.dart';
import 'package:cupid_mentor/core/utils/snackbar_service.dart';
import 'package:cupid_mentor/core/widgets/my_app_bar.dart';
import 'package:cupid_mentor/core/widgets/showup_animation.dart';
import 'package:cupid_mentor/features/profile/presentation/manager/profile_notifier.dart';
import 'package:cupid_mentor/features/profile/presentation/widgets/basic_info.dart';
import 'package:cupid_mentor/features/profile/presentation/widgets/describe_you.dart';
import 'package:cupid_mentor/features/profile/presentation/widgets/hobbies.dart';
import 'package:cupid_mentor/features/profile/presentation/widgets/love_languages.dart';
import 'package:cupid_mentor/features/profile/presentation/widgets/relationship_status.dart';
import 'package:cupid_mentor/features/profile/presentation/widgets/update_basic_info_dialog.dart';
import 'package:cupid_mentor/features/profile/presentation/widgets/update_hobbies_dialog.dart';
import 'package:cupid_mentor/features/profile/presentation/widgets/update_love_languages_dialog.dart';
import 'package:cupid_mentor/features/profile/presentation/widgets/update_personalities_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class YourProfilePages extends ConsumerStatefulWidget {
  const YourProfilePages({super.key});

  @override
  ConsumerState<YourProfilePages> createState() => _YourProfilePagesState();
}

class _YourProfilePagesState extends ConsumerState<YourProfilePages> {
  @override
  void initState() {
    if (mounted) {
      ref.read(profileNotifierProvider.notifier).getData();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(profileNotifierProvider);
    ref.listen(profileNotifierProvider, (previous, next) {
      if (next.error != null) {
        SnackBarService.instance.showErrorSnackBar(
          message: next.error!.getDisplayMessage(context),
          context: context,
        );
      }
    });
    return Container(
      color: context.theme.scaffoldBackgroundColor,
      child: SafeArea(
        child: Scaffold(
          appBar: MyAppBar.myAppBar(
            title: context.l10n.yourInfo,
            ref: ref,
            context: context,
          ),
          body: (state.userInfo != null)
              ? Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
                  child: Column(
                    children: [
                      ShowUpAnimation(
                        delay: 50,
                        child: BasicInfoWidget(
                          name: state.userInfo!.name,
                          job: state.userInfo!.job,
                          birthday: state.userInfo!.birthday,
                          gender: state.userInfo!.gender,
                          onTapEditBasicInfo: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return const UpdateYourBasicInfoDialog();
                              },
                            );
                          },
                        ),
                      ),
                      ShowUpAnimation(
                        delay: 100,
                        child: DescribeYouWidget(
                          personalities: state.userInfo!.personalities,
                          onTapEdit: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return const UpdatePersonalitiesDialog();
                              },
                            );
                          },
                        ),
                      ),
                      ShowUpAnimation(
                        delay: 200,
                        child: HobbiesWidget(
                          hobbies: state.userInfo!.hobbies,
                          onTapEdit: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return const UpdateHobbiesDialog();
                              },
                            );
                          },
                        ),
                      ),
                      ShowUpAnimation(
                        delay: 300,
                        child: LoveLanguagesWidget(
                          loveLanguages: state.userInfo!.loveLanguages,
                          onTapEdit: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return const UpdateLoveLanguagesDialog();
                              },
                            );
                          },
                        ),
                      ),
                      ShowUpAnimation(
                        delay: 400,
                        child: RelationshipStatus(
                          status: state.userInfo!.hasPartner
                              ? '${context.l10n.alreadyHave},\n${RelationshipType.tryParse(state.userInfo!.relationship)?.displayText.value(context) ?? ''}'
                              : context.l10n.notHaveYet,
                          onTapEditPartnerProfile: () {
                            context.push('/${AppRoutes.home}/${AppRoutes.partnerProfile}');
                          },
                        ),
                      ),
                    ],
                  ),
                )
              : const SizedBox(),
        ),
      ),
    );
  }
}
