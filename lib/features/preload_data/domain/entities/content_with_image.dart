import 'package:cupid_mentor/core/core_object/localization_content.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'content_with_image.freezed.dart';

@freezed
class ContentWithImage with _$ContentWithImage {
  const ContentWithImage._();

  const factory ContentWithImage({
    required String id,
    required LocalizationContent title,
    required String image,
  }) = _ContentWithImage;

  factory ContentWithImage.empty() => ContentWithImage(
        id: '',
        title: LocalizationContent.empty(),
        image: '',
      );
}
