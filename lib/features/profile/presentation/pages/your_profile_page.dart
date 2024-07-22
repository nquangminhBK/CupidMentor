import 'package:cupid_mentor/core/constants/relationship_type.dart';
import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/navigation/navigation_service.dart';
import 'package:cupid_mentor/core/navigation/routes.dart';
import 'package:cupid_mentor/core/widgets/my_app_bar.dart';
import 'package:cupid_mentor/features/profile/presentation/manager/profile_notifier.dart';
import 'package:cupid_mentor/features/profile/presentation/widgets/basic_info.dart';
import 'package:cupid_mentor/features/profile/presentation/widgets/describe_you.dart';
import 'package:cupid_mentor/features/profile/presentation/widgets/hobbies.dart';
import 'package:cupid_mentor/features/profile/presentation/widgets/love_languages.dart';
import 'package:cupid_mentor/features/profile/presentation/widgets/relationship_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    return Container(
      color: context.theme.scaffoldBackgroundColor,
      child: SafeArea(
        child: Scaffold(
          appBar: MyAppBar.myAppBar(
            title: context.l10n.yourInfo,
            ref: ref,
            context: context,
          ),
          body: (state.userInfo.name.isNotEmpty)
              ? Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
                  child: Column(
                    children: [
                      BasicInfoWidget(
                        name: state.userInfo.name,
                        job: state.userInfo.job,
                        birthday: state.userInfo.birthday,
                        gender: state.userInfo.gender,
                        onTapEditBasicInfo: () {
                          print("minh check 1");
                        },
                      ),
                      DescribeYouWidget(
                        personalities: state.userInfo.personalities,
                      ),
                      HobbiesWidget(
                        hobbies: state.userInfo.hobbies,
                      ),
                      LoveLanguagesWidget(
                        loveLanguages: state.userInfo.loveLanguages,
                      ),
                      RelationshipStatus(
                        status: state.userInfo.crushInfo == null
                            ? context.l10n.notHaveYet
                            : '${context.l10n.alreadyHave},\n${RelationshipType.tryParse(state.userInfo.crushType)?.displayText.value(context) ?? ''}',
                        onTapEditPartnerProfile: () {
                          NavigationService.instance.push(AppRoutes.crushProfile);
                        },
                      ),
                    ],
                  ),
                )
              : Container(),
        ),
      ),
    );
  }
}
