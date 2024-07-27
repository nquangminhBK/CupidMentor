// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partner_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PartnerInfoModelImpl _$$PartnerInfoModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PartnerInfoModelImpl(
      genderRaw: json['gender'] as String,
      name: json['name'] as String,
      birthdayRaw: json['birthday'] as String,
      job: json['job'] as String,
      hobbies:
          (json['hobbies'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$PartnerInfoModelImplToJson(
        _$PartnerInfoModelImpl instance) =>
    <String, dynamic>{
      'gender': instance.genderRaw,
      'name': instance.name,
      'birthday': instance.birthdayRaw,
      'job': instance.job,
      'hobbies': instance.hobbies,
    };
