import 'package:cupid_mentor/core/constants/datetime.dart';
import 'package:cupid_mentor/core/constants/gender.dart';
import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/utils/datetime_utils.dart';
import 'package:cupid_mentor/core/widgets/vertical_space.dart';
import 'package:cupid_mentor/features/profile/presentation/widgets/item_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BasicInfoWidget extends ConsumerWidget {
  const BasicInfoWidget({
    super.key,
    required this.name,
    required this.job,
    required this.gender,
    required this.birthday,
    required this.onTapEditBasicInfo,
  });

  final String name;
  final String job;
  final Gender? gender;
  final DateTime birthday;
  final Function() onTapEditBasicInfo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String getBasicInfoDisplay() {
      if (name.isEmpty && gender == null && birthday == DateTimeConst.empty()) {
        return context.l10n.noData;
      }

      final genderDisplay = gender != null ? gender!.displayText.value(context) : '';
      final birthdayDisplay =
          birthday != DateTimeConst.empty() ? DateTimeUtils.convertToString(birthday) : '';
      final nameDisplay = name.isNotEmpty ? name : '';

      var result = nameDisplay;
      if (genderDisplay.isNotEmpty || birthdayDisplay.isNotEmpty) {
        result = '$nameDisplay\n${[
          genderDisplay,
          birthdayDisplay,
        ].where((e) => e.isNotEmpty).join(', ')}';
      }
      return result.trim();
    }

    return Column(
      children: [
        const VerticalSpace(size: 10),
        ItemInfo(
          title: context.l10n.basicInfo,
          value: getBasicInfoDisplay(),
          onTap: onTapEditBasicInfo,
        ),
        if (job.isNotEmpty) const VerticalSpace(size: 16),
        if (job.isNotEmpty)
          ItemInfo(
            title: context.l10n.job,
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
