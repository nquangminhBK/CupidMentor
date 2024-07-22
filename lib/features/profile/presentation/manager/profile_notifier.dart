import 'package:cupid_mentor/core/usecases/usecase.dart';
import 'package:cupid_mentor/features/profile/presentation/manager/profile_state.dart';
import 'package:cupid_mentor/features/setting/domain/use_cases/get_user_info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_notifier.g.dart';

@riverpod
class ProfileNotifier extends _$ProfileNotifier {
  @override
  ProfileState build() {
    return ProfileState.initial().copyWith(isLoading: true);
  }

  GetUserInfo get getUserInfo => ref.read(getUserInfoUseCaseProvider);

  Future<void> getData() async {
    final response = await getUserInfo(NoParams());
    response.fold((error) {
      state = state.copyWith(isLoading: false, error: error.message);
    }, (userInfo) {
      if (userInfo != null) {
        state = state.copyWith(isLoading: false, userInfo: userInfo);
      }
    });
  }
}
