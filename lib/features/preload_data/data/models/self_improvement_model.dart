import 'package:cupid_mentor/features/preload_data/data/models/content_with_description_model.dart';
import 'package:cupid_mentor/features/preload_data/data/models/content_with_image_model.dart';
import 'package:cupid_mentor/features/preload_data/domain/entities/self_improvement_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'self_improvement_model.freezed.dart';
part 'self_improvement_model.g.dart';

@freezed
class SelfImprovementModel with _$SelfImprovementModel {
  const SelfImprovementModel._();

  const factory SelfImprovementModel({
    required ContentWithImageModel category,
    required List<ContentWithDescriptionModel> tips,
  }) = _SelfImprovementModel;

  factory SelfImprovementModel.fromJson(Map<String, dynamic> json) =>
      _$SelfImprovementModelFromJson(json);

  SelfImprovementEntity get toEntity {
    return SelfImprovementEntity(
      category: category.toEntity,
      tips: tips.map((e) => e.toEntity).toList(),
    );
  }
}
