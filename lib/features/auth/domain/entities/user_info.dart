import 'package:cupid_mentor/core/constants/datetime.dart';
import 'package:cupid_mentor/core/constants/gender.dart';
import 'package:cupid_mentor/core/utils/datetime_utils.dart';
import 'package:cupid_mentor/features/auth/data/models/user_info_model.dart';
import 'package:cupid_mentor/features/auth/domain/entities/partner_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info.freezed.dart';

@freezed
class LoggedInUserInfo with _$LoggedInUserInfo {
  const LoggedInUserInfo._();

  const factory LoggedInUserInfo({
    required Gender gender,
    required String name,
    required String avatar,
    required DateTime birthday,
    required String job,
    required List<String> personalities,
    required List<String> hobbies,
    required List<String> loveLanguages,
    required bool hasPartner,
    required String relationship,
    required PartnerInfo? partnerInfo,
  }) = _LoggedInUserInfo;

  factory LoggedInUserInfo.empty() => LoggedInUserInfo(
        gender: Gender.none,
        name: '',
        avatar: '',
        birthday: DateTimeConst.empty(),
        job: '',
        personalities: [],
        hobbies: [],
        loveLanguages: [],
        relationship: '',
        hasPartner: false,
        partnerInfo: null,
      );

  LoggedInUserInfoModel get toModel {
    return LoggedInUserInfoModel(
      genderRaw: gender.value,
      name: name,
      avatar: avatar,
      birthdayRaw: DateTimeUtils.convertToString(birthday),
      job: job,
      personalities: personalities,
      hobbies: hobbies,
      loveLanguages: loveLanguages,
      relationship: relationship,
      hasPartner: hasPartner,
      partnerInfoModel: partnerInfo?.toModel,
    );
  }
}
