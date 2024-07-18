import 'package:cupid_mentor/core/core_entity/content_response.dart';
import 'package:cupid_mentor/core/utils/datetime_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'content_response_model.freezed.dart';
part 'content_response_model.g.dart';

@freezed
class ContentResponseModel with _$ContentResponseModel {
  const ContentResponseModel._();

  const factory ContentResponseModel({
    required String content,
    required String createdDate,
  }) = _ContentResponseModel;

  factory ContentResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ContentResponseModelFromJson(json);

  ContentResponse get toEntity {
    return ContentResponse(
      createdDate: DateTimeUtils.convertToDateTime(createdDate),
      content: content,
    );
  }
}
