// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localization_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocalizationContentImpl _$$LocalizationContentImplFromJson(
        Map<String, dynamic> json) =>
    _$LocalizationContentImpl(
      id: json['id'] as String?,
      content: (json['content'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry($enumDecode(_$LocalizationEnumEnumMap, k), e as String),
      ),
    );

Map<String, dynamic> _$$LocalizationContentImplToJson(
        _$LocalizationContentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content
          .map((k, e) => MapEntry(_$LocalizationEnumEnumMap[k]!, e)),
    };

const _$LocalizationEnumEnumMap = {
  LocalizationEnum.english: 'english',
  LocalizationEnum.vietnamese: 'vietnamese',
  LocalizationEnum.japanese: 'japanese',
};
