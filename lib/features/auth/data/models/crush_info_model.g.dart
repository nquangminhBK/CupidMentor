// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crush_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CrushInfoModelImpl _$$CrushInfoModelImplFromJson(Map<String, dynamic> json) =>
    _$CrushInfoModelImpl(
      genderRaw: json['gender'] as String,
      name: json['name'] as String,
      birthdayRaw: json['birthday'] as String,
      job: json['job'] as String,
      hobbies:
          (json['hobbies'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$CrushInfoModelImplToJson(
        _$CrushInfoModelImpl instance) =>
    <String, dynamic>{
      'gender': instance.genderRaw,
      'name': instance.name,
      'birthday': instance.birthdayRaw,
      'job': instance.job,
      'hobbies': instance.hobbies,
    };
