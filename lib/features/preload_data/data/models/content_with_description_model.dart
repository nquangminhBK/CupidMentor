import 'package:cupid_mentor/core/core_object/localization_content.dart';
import 'package:cupid_mentor/features/preload_data/domain/entities/content_with_description.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'content_with_description_model.freezed.dart';

part 'content_with_description_model.g.dart';

@freezed
class ContextWithDescriptionModel with _$ContextWithDescriptionModel {
  const ContextWithDescriptionModel._();

  const factory ContextWithDescriptionModel({
    required String id,
    required LocalizationContent title,
    required LocalizationContent description,
  }) = _ContextWithDescriptionModel;

  factory ContextWithDescriptionModel.fromJson(Map<String, dynamic> json) =>
      _$ContextWithDescriptionModelFromJson(json);

  ContextWithDescription get toEntity {
    return ContextWithDescription(
      id: id,
      title: title,
      description: description,
    );
  }
}
