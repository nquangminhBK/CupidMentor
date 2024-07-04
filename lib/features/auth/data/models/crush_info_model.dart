import 'package:cupid_mentor/core/constants/gender.dart';
import 'package:cupid_mentor/core/utils/datetime_utils.dart';
import 'package:cupid_mentor/features/auth/domain/entities/crush_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'crush_info_model.freezed.dart';
part 'crush_info_model.g.dart';

@freezed
class CrushInfoModel with _$CrushInfoModel {
  const CrushInfoModel._();

  const factory CrushInfoModel({
    @JsonKey(name: 'gender') required String genderRaw,
    required String name,
    @JsonKey(name: 'birthday') required String birthdayRaw,
    required String job,
    required List<String> hobbies,
  }) = _CrushInfoModel;

  factory CrushInfoModel.fromJson(Map<String, dynamic> json) => _$CrushInfoModelFromJson(json);

  CrushInfo get toEntity {
    return CrushInfo(
      gender: Gender.tryParse(genderRaw) ?? Gender.none,
      name: name,
      birthday: DateTimeUtils.convertToDateTime(birthdayRaw),
      job: job,
      hobbies: hobbies,
    );
  }
}
