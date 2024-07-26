import 'package:cupid_mentor/core/constants/datetime.dart';
import 'package:cupid_mentor/core/constants/gender.dart';
import 'package:cupid_mentor/core/utils/datetime_utils.dart';
import 'package:cupid_mentor/features/auth/data/models/user_info_model.dart';
import 'package:cupid_mentor/features/auth/domain/entities/crush_info.dart';
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
    required bool hasCrush,
    required String crushType,
    required CrushInfo? crushInfo,
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
        crushType: '',
        hasCrush: false,
        crushInfo: null,
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
      crushType: crushType,
      hasCrush: hasCrush,
      crushInfoModel: crushInfo?.toModel,
    );
  }
}
