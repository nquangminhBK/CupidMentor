import 'package:cupid_mentor/core/core_model/content_response_model.dart';
import 'package:cupid_mentor/core/utils/datetime_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'content_response.freezed.dart';

@freezed
class ContentResponse with _$ContentResponse {
  const ContentResponse._();

  const factory ContentResponse({
    required String content,
    required DateTime createdDate,
    required String id,
  }) = _ContentResponse;

  factory ContentResponse.empty() =>
      ContentResponse(content: '', createdDate: DateTime.now(), id: '');

  ContentResponseModel get toModel {
    return ContentResponseModel(
      content: content,
      createdDate: DateTimeUtils.convertToString(createdDate),
      id: id,
    );
  }
}
