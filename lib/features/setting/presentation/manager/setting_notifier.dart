import 'package:cupid_mentor/core/usecases/usecase.dart';
import 'package:cupid_mentor/features/auth/domain/entities/user_info.dart';
import 'package:cupid_mentor/features/auth/domain/use_cases/signout.dart';
import 'package:cupid_mentor/features/setting/domain/use_cases/delete_user.dart';
import 'package:cupid_mentor/features/setting/domain/use_cases/get_user_info.dart';
import 'package:cupid_mentor/features/setting/presentation/manager/setting_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'setting_notifier.g.dart';

@riverpod
class SettingNotifier extends _$SettingNotifier {
  @override
  SettingState build() {
    return SettingState.initial();
  }

  GetUserInfo get getUserInfo => ref.read(getUserInfoUseCaseProvider);

  LogoutUseCase get logOut => ref.read(logoutUseCaseProvider);

  DeleteUser get deleteUser => ref.read(deleteUserUseCaseProvider);

  Future<void> getData() async {
    final userResponse = await getUserInfo(NoParams());
    final userInfo = userResponse.getOrElse(() => null);
    state = state.copyWith(userInfo: userInfo ?? LoggedInUserInfo.empty());
  }

  Future<bool> signOut() async {
    final response = await logOut(NoParams());
    return response.getOrElse(() => false);
  }

  Future<bool> deleteAccount() async {
    final response = await deleteUser(NoParams());
    return response.getOrElse(() => false);
  }
}
