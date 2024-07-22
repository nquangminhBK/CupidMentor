import 'package:cupid_mentor/core/constants/datetime.dart';
import 'package:cupid_mentor/core/constants/gender.dart';
import 'package:cupid_mentor/core/constants/hobbies.dart';
import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/widgets/my_app_bar.dart';
import 'package:cupid_mentor/features/auth/domain/entities/crush_info.dart';
import 'package:cupid_mentor/features/profile/presentation/manager/profile_notifier.dart';
import 'package:cupid_mentor/features/profile/presentation/widgets/basic_info.dart';
import 'package:cupid_mentor/features/profile/presentation/widgets/hobbies.dart';
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
    if (ref.read(profileNotifierProvider).userInfo.name.isEmpty) {
      ref.read(profileNotifierProvider.notifier).getData();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final crushInfo = ref.watch(profileNotifierProvider).userInfo.crushInfo;
    print('$crushInfo ${ref.watch(profileNotifierProvider)}');
    return Container(
      color: context.theme.scaffoldBackgroundColor,
      child: SafeArea(
        child: Scaffold(
          appBar: MyAppBar.myAppBar(
            title: context.l10n.partnerInfo,
            ref: ref,
            context: context,
          ),
          body: Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
              child: Column(
                children: [
                  BasicInfoWidget(
                    name: crushInfo?.name ?? '',
                    job: crushInfo?.job ?? '',
                    birthday: crushInfo?.birthday ?? DateTimeConst.empty(),
                    gender: crushInfo?.gender ?? Gender.none,
                    onTapEditBasicInfo: () {
                      print("minh check 1");
                    },
                  ),
                  HobbiesWidget(
                    hobbies: crushInfo?.hobbies ?? [],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
