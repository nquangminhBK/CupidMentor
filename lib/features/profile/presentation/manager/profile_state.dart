import 'package:cupid_mentor/features/auth/domain/entities/user_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.freezed.dart';

@freezed
abstract class ProfileState with _$ProfileState {
  const ProfileState._();

  const factory ProfileState({required LoggedInUserInfo userInfo, String? error, bool? isLoading}) =
      _ProfileState;

  factory ProfileState.initial() => ProfileState(userInfo: LoggedInUserInfo.empty());
}
