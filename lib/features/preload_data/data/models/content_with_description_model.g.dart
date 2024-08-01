// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_with_description_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContentWithDescriptionModelImpl _$$ContentWithDescriptionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ContentWithDescriptionModelImpl(
      id: json['id'] as String,
      title:
          LocalizationContent.fromJson(json['title'] as Map<String, dynamic>),
      description: LocalizationContent.fromJson(
          json['description'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ContentWithDescriptionModelImplToJson(
        _$ContentWithDescriptionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
    };
