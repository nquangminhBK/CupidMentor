import 'package:cupid_mentor/core/constants/gender.dart';
import 'package:cupid_mentor/core/utils/datetime_utils.dart';
import 'package:cupid_mentor/features/auth/data/models/partner_info_model.dart';
import 'package:cupid_mentor/features/auth/domain/entities/user_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info_model.freezed.dart';
part 'user_info_model.g.dart';

@freezed
class LoggedInUserInfoModel with _$LoggedInUserInfoModel {
  const LoggedInUserInfoModel._();

  @JsonSerializable(explicitToJson: true)
  const factory LoggedInUserInfoModel({
    @JsonKey(name: 'gender') required String? genderRaw,
    required String name,
    required String avatar,
    @JsonKey(name: 'birthday') required String birthdayRaw,
    required String job,
    required List<String> personalities,
    required List<String> hobbies,
    required List<String> loveLanguages,
    required bool hasPartner,
    required String relationship,
    @JsonKey(name: 'partner') required PartnerInfoModel? partnerInfoModel,
  }) = _LoggedInUserInfoModel;

  factory LoggedInUserInfoModel.fromJson(Map<String, dynamic> json) =>
      _$LoggedInUserInfoModelFromJson(json);

  LoggedInUserInfo get toEntity {
    return LoggedInUserInfo(
      gender: Gender.tryParse(genderRaw ?? ''),
      name: name,
      avatar: avatar,
      birthday: DateTimeUtils.convertToDateTime(birthdayRaw),
      job: job,
      personalities: personalities,
      hobbies: hobbies,
      loveLanguages: loveLanguages,
      relationship: relationship,
      hasPartner: hasPartner,
      partnerInfo: partnerInfoModel?.toEntity,
    );
  }
}
