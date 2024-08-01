import 'package:cupid_mentor/features/preload_data/domain/entities/content_with_description.dart';
import 'package:cupid_mentor/features/preload_data/domain/entities/content_with_image.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'self_improvement_entity.freezed.dart';

@freezed
class SelfImprovementEntity with _$SelfImprovementEntity {
  const SelfImprovementEntity._();

  const factory SelfImprovementEntity({
    required ContentWithImage category,
    required List<ContentWithDescription> tips,
  }) = _SelfImprovementEntity;

  factory SelfImprovementEntity.empty() =>
      SelfImprovementEntity(category: ContentWithImage.empty(), tips: []);
}
