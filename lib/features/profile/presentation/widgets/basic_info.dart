import 'package:cupid_mentor/core/constants/gender.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/utils/datetime_utils.dart';
import 'package:cupid_mentor/core/widgets/vertical_space.dart';
import 'package:cupid_mentor/features/auth/domain/entities/user_info.dart';
import 'package:cupid_mentor/features/profile/presentation/widgets/item_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BasicInfoWidget extends ConsumerWidget {
  const BasicInfoWidget(
      {super.key,
      required this.name,
      required this.job,
      required this.gender,
      required this.birthday,
      required this.onTapEditBasicInfo});

  final String name;
  final String job;
  final Gender gender;
  final DateTime birthday;
  final Function() onTapEditBasicInfo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const VerticalSpace(size: 10),
        ItemInfo(
          title: 'Basic info',
          value:
              '$name\n${gender.displayText.value(context)}, ${DateTimeUtils.convertToString(birthday)}',
          onTap: onTapEditBasicInfo,
        ),
        const VerticalSpace(size: 16),
        ItemInfo(
          title: 'Job',
          value: job,
          onTap: onTapEditBasicInfo,
        ),
        const VerticalSpace(size: 16),
        Container(
          width: double.infinity,
          height: 0.5,
          color: ref.currentAppColor.textColor,
        ),
      ],
    );
  }
}
