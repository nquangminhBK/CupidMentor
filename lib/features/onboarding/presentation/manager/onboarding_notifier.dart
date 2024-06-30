import 'package:cupid_mentor/core/constants/gender.dart';
import 'package:cupid_mentor/core/usecases/usecase.dart';
import 'package:cupid_mentor/features/auth/domain/entities/user_info.dart';
import 'package:cupid_mentor/features/onboarding/domain/use_cases/get_current_user.dart';
import 'package:cupid_mentor/features/onboarding/presentation/manager/onboarding_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'onboarding_notifier.g.dart';

@riverpod
class OnboardingNotifier extends _$OnboardingNotifier {
  @override
  OnboardingState build() {
    return const OnboardingState.initialized();
  }

  GetCurrentUser get getCurrentUser => ref.read(getCurrentUserUseCaseProvider);

  Future<void> initializeUserInfo() async {
    final currentUser = await getCurrentUser(NoParams());
    currentUser.fold((failed) {}, (user) {
      state = OnboardingState.infoUpdated(
          userInfo: LoggedInUserInfo.empty().copyWith(
        gender: Gender.other,
        name: user.displayName ?? "",
        avatar: user.photoURL ?? "",
      ));
    });
  }
}
