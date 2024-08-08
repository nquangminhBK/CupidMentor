import 'package:cupid_mentor/core/core_object/localization_content.dart';
import 'package:cupid_mentor/features/preload_data/domain/entities/content_with_description.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'content_with_description_model.freezed.dart';
part 'content_with_description_model.g.dart';

@freezed
class ContentWithDescriptionModel with _$ContentWithDescriptionModel {
  const ContentWithDescriptionModel._();

  const factory ContentWithDescriptionModel({
    required String id,
    required LocalizationContent title,
    required LocalizationContent description,
  }) = _ContentWithDescriptionModel;

  factory ContentWithDescriptionModel.fromJson(Map<String, dynamic> json) =>
      _$ContentWithDescriptionModelFromJson(json);

  ContentWithDescription get toEntity {
    return ContentWithDescription(
      id: id,
      title: title,
      description: description,
    );
  }
}
