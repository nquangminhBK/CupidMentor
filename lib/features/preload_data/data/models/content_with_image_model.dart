import 'package:cupid_mentor/core/core_object/localization_content.dart';
import 'package:cupid_mentor/features/preload_data/domain/entities/content_with_description.dart';
import 'package:cupid_mentor/features/preload_data/domain/entities/content_with_image.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'content_with_image_model.freezed.dart';

part 'content_with_image_model.g.dart';

@freezed
class ContentWithImageModel with _$ContentWithImageModel {
  const ContentWithImageModel._();

  const factory ContentWithImageModel({
    required String id,
    required LocalizationContent title,
    required String image,
  }) = _ContentWithImageModel;

  factory ContentWithImageModel.fromJson(Map<String, dynamic> json) =>
      _$ContentWithImageModelFromJson(json);

  ContentWithImage get toEntity {
    return ContentWithImage(
      id: id,
      title: title,
      image: image,
    );
  }
}
