import 'package:cupid_mentor/core/constants/datetime.dart';
import 'package:cupid_mentor/core/constants/gender.dart';
import 'package:cupid_mentor/core/utils/datetime_utils.dart';
import 'package:cupid_mentor/features/auth/data/models/crush_info_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'crush_info.freezed.dart';

@freezed
class CrushInfo with _$CrushInfo {
  const CrushInfo._();

  const factory CrushInfo({
    required Gender gender,
    required String name,
    required DateTime birthday,
    required String job,
    required List<String> hobbies,
  }) = _CrushInfo;

  factory CrushInfo.empty() => CrushInfo(
        gender: Gender.none,
        name: '',
        birthday: DateTimeConst.empty(),
        job: '',
        hobbies: [],
      );

  CrushInfoModel get toModel {
    return CrushInfoModel(
      genderRaw: gender.value,
      name: name,
      birthdayRaw: DateTimeUtils.convertToString(birthday),
      job: job,
      hobbies: hobbies,
    );
  }
}
