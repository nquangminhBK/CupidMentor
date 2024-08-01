// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_with_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContentWithImageModelImpl _$$ContentWithImageModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ContentWithImageModelImpl(
      id: json['id'] as String,
      title:
          LocalizationContent.fromJson(json['title'] as Map<String, dynamic>),
      image: json['image'] as String,
    );

Map<String, dynamic> _$$ContentWithImageModelImplToJson(
        _$ContentWithImageModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
    };
