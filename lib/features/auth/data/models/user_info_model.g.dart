// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoggedInUserInfoModelImpl _$$LoggedInUserInfoModelImplFromJson(
        Map<String, dynamic> json) =>
    _$LoggedInUserInfoModelImpl(
      genderRaw: json['gender'] as String,
      name: json['name'] as String,
      avatar: json['avatar'] as String,
      birthdayRaw: json['birthday'] as String,
      job: json['job'] as String,
      personalities: (json['personalities'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      hobbies:
          (json['hobbies'] as List<dynamic>).map((e) => e as String).toList(),
      loveLanguages: (json['loveLanguages'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$LoggedInUserInfoModelImplToJson(
        _$LoggedInUserInfoModelImpl instance) =>
    <String, dynamic>{
      'gender': instance.genderRaw,
      'name': instance.name,
      'avatar': instance.avatar,
      'birthday': instance.birthdayRaw,
      'job': instance.job,
      'personalities': instance.personalities,
      'hobbies': instance.hobbies,
      'loveLanguages': instance.loveLanguages,
    };
