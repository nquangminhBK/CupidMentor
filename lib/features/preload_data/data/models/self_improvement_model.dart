import 'package:cupid_mentor/core/core_object/localization_content.dart';
import 'package:cupid_mentor/features/preload_data/data/models/content_with_description_model.dart';
import 'package:cupid_mentor/features/preload_data/data/models/content_with_image_model.dart';
import 'package:cupid_mentor/features/preload_data/domain/entities/content_with_image.dart';
import 'package:equatable/equatable.dart';

class SelfImprovementEntityModel extends Equatable {
  ContentWithImageModel category;
  List<ContentWithDescriptionModel> tips;

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
