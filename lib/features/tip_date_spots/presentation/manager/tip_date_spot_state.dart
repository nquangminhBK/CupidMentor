import 'package:cupid_mentor/core/core_entity/content_response.dart';
import 'package:cupid_mentor/core/errors/ui_failures.dart';
import 'package:cupid_mentor/core/errors/ui_success.dart';
import 'package:cupid_mentor/features/auth/domain/entities/user_info.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tip_date_spot_state.freezed.dart';

@freezed
abstract class TipsDateSpotState with _$TipsDateSpotState {
  const TipsDateSpotState._();

  const factory TipsDateSpotState({
    required Map<String, List<ContentResponse>> content,
    required LoggedInUserInfo userInfo,
    required Either<UIError, UISuccess>? errorOrSuccess,
  }) = _TipsDateSpotState;

  factory TipsDateSpotState.initial() =>
      TipsDateSpotState(content: {}, userInfo: LoggedInUserInfo.empty(), errorOrSuccess: null);
}
