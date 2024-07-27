import 'package:cupid_mentor/core/constants/datetime.dart';
import 'package:cupid_mentor/core/constants/gender.dart';
import 'package:cupid_mentor/core/utils/datetime_utils.dart';
import 'package:cupid_mentor/features/auth/data/models/partner_info_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'partner_info.freezed.dart';

@freezed
class PartnerInfo with _$PartnerInfo {
  const PartnerInfo._();

  const factory PartnerInfo({
    required Gender gender,
    required String name,
    required DateTime birthday,
    required String job,
    required List<String> hobbies,
  }) = _PartnerInfo;

  factory PartnerInfo.empty() => PartnerInfo(
        gender: Gender.none,
        name: '',
        birthday: DateTimeConst.empty(),
        job: '',
        hobbies: [],
      );

  PartnerInfoModel get toModel {
    return PartnerInfoModel(
      genderRaw: gender.value,
      name: name,
      birthdayRaw: DateTimeUtils.convertToString(birthday),
      job: job,
      hobbies: hobbies,
    );
  }
}
