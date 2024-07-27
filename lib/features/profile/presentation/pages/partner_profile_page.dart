import 'package:cupid_mentor/core/constants/relationship_type.dart';
import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/navigation/navigation_service.dart';
import 'package:cupid_mentor/core/navigation/routes.dart';
import 'package:cupid_mentor/core/widgets/animated_button.dart';
import 'package:cupid_mentor/core/widgets/dialog_confirm.dart';
import 'package:cupid_mentor/core/widgets/my_app_bar.dart';
import 'package:cupid_mentor/core/widgets/vertical_space.dart';
import 'package:cupid_mentor/features/profile/presentation/manager/profile_notifier.dart';
import 'package:cupid_mentor/features/profile/presentation/widgets/basic_info.dart';
import 'package:cupid_mentor/features/profile/presentation/widgets/hobbies.dart';
import 'package:cupid_mentor/features/profile/presentation/widgets/item_info.dart';
import 'package:cupid_mentor/features/profile/presentation/widgets/update_partner_basic_info_dialog.dart';
import 'package:cupid_mentor/features/profile/presentation/widgets/update_partner_hobbies_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PartnerProfilePage extends ConsumerStatefulWidget {
  const PartnerProfilePage({super.key});

  @override
  ConsumerState<PartnerProfilePage> createState() => _PartnerProfilePageState();
}

class _PartnerProfilePageState extends ConsumerState<PartnerProfilePage> {
  @override
  void initState() {
    if (ref.read(profileNotifierProvider).userInfo == null) {
      ref.read(profileNotifierProvider.notifier).getData();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final partnerInfo = ref.watch(profileNotifierProvider).userInfo?.partnerInfo;
    final relationship = ref.watch(profileNotifierProvider).userInfo?.relationship;
    final notifier = ref.read(profileNotifierProvider.notifier);
    return Container(
      color: context.theme.scaffoldBackgroundColor,
      child: SafeArea(
        child: Scaffold(
          appBar: MyAppBar.myAppBar(
            title: context.l10n.partnerInfo,
            ref: ref,
            context: context,
            actionButton: {
              Icons.delete_outline_rounded: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return DialogConfirm(
                      onPositiveButtonExecute: () {
                        notifier.deletePartnerProfile();
                        NavigationService.instance.pop();
                      },
                      message: 'Are you sure you want to delete this conversation?',
                      titlePositiveButton: 'Yes',
                      title: 'Dialog Confirmation',
                      icon: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: ref.currentAppColor.buttonBackgroundColor,
                        ),
                        child: const Icon(
                          Icons.delete_outline_rounded,
                          color: Colors.red,
                          size: 30,
                        ),
                      ),
                    );
                  },
                );
              },
            },
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
            child: partnerInfo == null
                ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          context.l10n.addPartnerDesc,
                          style: context.textTheme.bodyLarge!.copyWith(height: 2, fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                        const VerticalSpace(size: 24),
                        AnimatedButton(
                          onPress: () {
                            NavigationService.instance.push(AppRoutes.addPartnerProfile);
                          },
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: ref.currentAppColor.primaryColor,
                            ),
                            margin: const EdgeInsets.symmetric(vertical: 4),
                            width: double.infinity,
                            height: 48,
                            child: Center(
                              child: Text(
                                context.l10n.addPartnerInfoBtn,
                                style: context.textTheme.titleMedium!.copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Column(
                    children: [
                      ItemInfo(
                        title: context.l10n.relationship,
                        value: RelationshipType.tryParse(relationship ?? '')
                                ?.displayText
                                .value(context) ??
                            context.l10n.noData,
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return const UpdatePartnerBasicInfoDialog();
                            },
                          );
                        },
                      ),
                      BasicInfoWidget(
                        name: partnerInfo.name,
                        job: partnerInfo.job,
                        birthday: partnerInfo.birthday,
                        gender: partnerInfo.gender,
                        onTapEditBasicInfo: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return const UpdatePartnerBasicInfoDialog();
                            },
                          );
                        },
                      ),
                      HobbiesWidget(
                        hobbies: partnerInfo.hobbies,
                        onTapEdit: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return const UpdatePartnerHobbiesDialog();
                            },
                          );
                        },
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
