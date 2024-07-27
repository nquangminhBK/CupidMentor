import 'package:cupid_mentor/core/constants/gender.dart';
import 'package:cupid_mentor/core/utils/datetime_utils.dart';
import 'package:cupid_mentor/features/auth/domain/entities/partner_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'partner_info_model.freezed.dart';
part 'partner_info_model.g.dart';

@freezed
class PartnerInfoModel with _$PartnerInfoModel {
  const PartnerInfoModel._();

  const factory PartnerInfoModel({
    @JsonKey(name: 'gender') required String genderRaw,
    required String name,
    @JsonKey(name: 'birthday') required String birthdayRaw,
    required String job,
    required List<String> hobbies,
  }) = _PartnerInfoModel;

  factory PartnerInfoModel.fromJson(Map<String, dynamic> json) => _$PartnerInfoModelFromJson(json);

  PartnerInfo get toEntity {
    return PartnerInfo(
      gender: Gender.tryParse(genderRaw) ?? Gender.none,
      name: name,
      birthday: DateTimeUtils.convertToDateTime(birthdayRaw),
      job: job,
      hobbies: hobbies,
    );
  }
}
