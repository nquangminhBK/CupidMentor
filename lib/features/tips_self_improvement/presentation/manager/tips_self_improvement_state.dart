import 'package:cupid_mentor/core/core_entity/content_response.dart';
import 'package:cupid_mentor/core/errors/ui_failures.dart';
import 'package:cupid_mentor/core/errors/ui_success.dart';
import 'package:cupid_mentor/features/auth/domain/entities/user_info.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tips_self_improvement_state.freezed.dart';

@freezed
abstract class TipsSelfImprovementState with _$TipsSelfImprovementState {
  const TipsSelfImprovementState._();

  const factory TipsSelfImprovementState({
    required Map<String, List<ContentResponse>> content,
    required LoggedInUserInfo userInfo,
    required Either<UIError, UISuccess>? errorOrSuccess,
  }) = _TipsSelfImprovementState;

  factory TipsSelfImprovementState.initial() => TipsSelfImprovementState(
      content: {}, userInfo: LoggedInUserInfo.empty(), errorOrSuccess: null);
}
