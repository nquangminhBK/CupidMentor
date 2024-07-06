import 'package:cupid_mentor/features/auth/domain/entities/user_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting_state.freezed.dart';

@freezed
abstract class SettingState with _$SettingState {
  const SettingState._();

  const factory SettingState({
    required LoggedInUserInfo userInfo,
  }) = _SettingState;

  factory SettingState.initial() => SettingState(
        userInfo: LoggedInUserInfo.empty(),
      );
}
