// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'self_improvement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SelfImprovementModelImpl _$$SelfImprovementModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SelfImprovementModelImpl(
      category: ContentWithImageModel.fromJson(
          json['category'] as Map<String, dynamic>),
      tips: (json['tips'] as List<dynamic>)
          .map((e) =>
              ContentWithDescriptionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SelfImprovementModelImplToJson(
        _$SelfImprovementModelImpl instance) =>
    <String, dynamic>{
      'category': instance.category,
      'tips': instance.tips,
    };
