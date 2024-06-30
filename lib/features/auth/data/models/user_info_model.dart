// ignore_for_file: annotate_overrides, overridden_fields
import 'package:cupid_mentor/core/constants/gender.dart';
import 'package:cupid_mentor/features/auth/domain/entities/user_info.dart';

import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_info_model.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class LoggedInUserInfoModel extends LoggedInUserInfo {
  @JsonKey(name: 'gender')
  final String genderRaw;
  final String name;
  final String avatar;
  @JsonKey(name: 'birthday')
  final String birthdayRaw;
  final String job;
  final List<String> personalities;
  final List<String> hobbies;
  final List<String> loveLanguages;

  LoggedInUserInfoModel(
      {required this.genderRaw,
      required this.name,
      required this.avatar,
      required this.birthdayRaw,
      required this.job,
      required this.personalities,
      required this.hobbies,
      required this.loveLanguages})
      : super(
          gender: Gender.tryParse(genderRaw) ?? Gender.male,
          name: name,
          avatar: avatar,
          birthday: DateFormat.yMd().parse(birthdayRaw),
          job: job,
          personalities: personalities,
          hobbies: hobbies,
          loveLanguages: loveLanguages,
        );

  factory LoggedInUserInfoModel.fromJson(Map<String, dynamic> json) =>
      _$LoggedInUserInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoggedInUserInfoModelToJson(this);
}
