import 'package:cupid_mentor/core/core_entity/content_response.dart';
import 'package:cupid_mentor/features/auth/domain/entities/user_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tips_self_improvement_state.freezed.dart';

@freezed
abstract class TipsSelfImprovementState with _$TipsSelfImprovementState {
  const TipsSelfImprovementState._();

  const factory TipsSelfImprovementState({
    required Map<String, List<ContentResponse>> content,
    required LoggedInUserInfo userInfo,
    String? error,
  }) = _TipsSelfImprovementState;

  factory TipsSelfImprovementState.initial() =>
      TipsSelfImprovementState(content: {}, userInfo: LoggedInUserInfo.empty());
}
