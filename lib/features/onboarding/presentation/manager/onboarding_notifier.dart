import 'package:cupid_mentor/core/constants/datetime.dart';
import 'package:cupid_mentor/core/constants/gender.dart';
import 'package:cupid_mentor/core/constants/relationship_type.dart';
import 'package:cupid_mentor/core/errors/ui_failures.dart';
import 'package:cupid_mentor/core/extensions/datetime_extension.dart';
import 'package:cupid_mentor/core/usecases/usecase.dart';
import 'package:cupid_mentor/features/auth/domain/entities/crush_info.dart';
import 'package:cupid_mentor/features/auth/domain/entities/user_info.dart';
import 'package:cupid_mentor/features/onboarding/domain/use_cases/get_current_user.dart';
import 'package:cupid_mentor/features/onboarding/domain/use_cases/save_user_info.dart';
import 'package:cupid_mentor/features/onboarding/presentation/manager/onboarding_state.dart';
import 'package:cupid_mentor/features/setting/domain/use_cases/get_user_info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'onboarding_notifier.g.dart';

@Riverpod(keepAlive: true)
class OnboardingNotifier extends _$OnboardingNotifier {
  @override
  OnboardingState build() {
    return OnboardingState.initial();
  }

  GetCurrentUser get getCurrentUser => ref.read(getCurrentUserUseCaseProvider);

  GetUserInfo get getUserInfo => ref.read(getUserInfoUseCaseProvider);

  SaveUserInfo get saveUserInfo => ref.read(saveUserInfoUserUseCaseProvider);

  Future<void> initializeUserInfo() async {
    final currentUser = await getUserInfo(NoParams());
    currentUser.fold((failed) {}, (user) {
      state = state.copyWith(
        userInfo: user ?? LoggedInUserInfo.empty(),
      );
    });
  }

  Future<void> goNextPage(int currentPage, bool isOnboarding) async {
    state = state.copyWith(error: null, canGoNext: false);
    if (isOnboarding) {
      switch (currentPage) {
        case 0:
          if (state.userInfo.name.isEmpty) {
            state = state.copyWith(canGoNext: false, error: OnboardingMissingNameError());
            return;
          }
          if (state.userInfo.gender == Gender.none) {
            state = state.copyWith(canGoNext: false, error: OnboardingMissingGenderError());
            return;
          }
          if (state.userInfo.birthday.isSameDate(DateTimeConst.empty())) {
            state = state.copyWith(canGoNext: false, error: OnboardingMissingBirthdayError());
            return;
          }
          if (state.userInfo.job.isEmpty) {
            state = state.copyWith(canGoNext: false, error: OnboardingMissingJobError());
            return;
          }
        case 1:
          if (state.userInfo.personalities.isEmpty) {
            state = state.copyWith(canGoNext: false, error: OnboardingMissingPersonalitiesError());
            return;
          }
        case 2:
          if (state.userInfo.hobbies.isEmpty) {
            state = state.copyWith(canGoNext: false, error: OnboardingMissingHobbiesError());
            return;
          }
        case 3:
          if (state.userInfo.loveLanguages.isEmpty) {
            state = state.copyWith(canGoNext: false, error: OnboardingMissingLoveLanguageError());
            return;
          }
      }
    } else {
      switch (currentPage) {
        case 0:
          if (state.userInfo.hasCrush == false) {
            state =
                state.copyWith(canGoNext: false, error: OnboardingMissingRelationshipTypeError());
            return;
          }
        case 1:
          if (state.userInfo.crushInfo?.gender == null) {
            state = state.copyWith(canGoNext: false, error: OnboardingMissingPartnerGenderError());
            return;
          }
      }
    }

    state = state.copyWith(error: null, canGoNext: true);
  }

  void updateBasicInfo({String? name, Gender? gender, DateTime? birthDay, String? job}) {
    final currentUserInfo = state.userInfo;
    state = state.copyWith(
      userInfo: currentUserInfo.copyWith(
        name: name ?? currentUserInfo.name,
        birthday: birthDay ?? currentUserInfo.birthday,
        job: job ?? currentUserInfo.job,
        gender: gender ?? currentUserInfo.gender,
      ),
      error: null,
      canGoNext: false,
    );
  }

  void updateCrushBasicInfo({String? name, Gender? gender, DateTime? birthDay, String? job}) {
    final currentCrushInfo = state.userInfo.crushInfo ?? CrushInfo.empty();
    final currentUserInfo = state.userInfo;
    final updatedCrushInfo = currentCrushInfo.copyWith(
      name: name ?? currentCrushInfo.name,
      birthday: birthDay ?? currentCrushInfo.birthday,
      job: job ?? currentCrushInfo.job,
      gender: gender ?? currentCrushInfo.gender,
    );
    state = state.copyWith(
      userInfo: currentUserInfo.copyWith(
        crushInfo: updatedCrushInfo,
      ),
      error: null,
      canGoNext: false,
    );
  }

  void updatePersonalities(String personality, bool isRemove) {
    final currentUserInfo = state.userInfo;
    final personalities = List<String>.from(currentUserInfo.personalities);
    if (isRemove) {
      personalities.remove(personality);
    } else {
      personalities.add(personality);
    }
    state = state.copyWith(
      userInfo: currentUserInfo.copyWith(personalities: personalities),
      error: null,
    );
  }

  void updateHobbies(String hobby, bool isRemove) {
    final currentUserInfo = state.userInfo;
    final hobbies = List<String>.from(currentUserInfo.hobbies);
    if (isRemove) {
      hobbies.remove(hobby);
    } else {
      hobbies.add(hobby);
    }
    state = state.copyWith(userInfo: currentUserInfo.copyWith(hobbies: hobbies), error: null);
  }

  void updateCrushHobbies(String hobby, bool isRemove) {
    final currentCrushInfo = state.userInfo.crushInfo ?? CrushInfo.empty();
    final currentUserInfo = state.userInfo;
    final hobbies = List<String>.from(currentCrushInfo.hobbies);
    if (isRemove) {
      hobbies.remove(hobby);
    } else {
      hobbies.add(hobby);
    }
    final updatedCrushInfo = currentCrushInfo.copyWith(
      hobbies: hobbies,
    );
    state = state.copyWith(
      userInfo: currentUserInfo.copyWith(crushInfo: updatedCrushInfo),
      error: null,
    );
  }

  void updateLoveLanguages(String loveLanguage, bool isRemove) {
    final currentUserInfo = state.userInfo;
    final loveLanguages = List<String>.from(currentUserInfo.loveLanguages);
    if (isRemove) {
      loveLanguages.remove(loveLanguage);
    } else {
      loveLanguages.add(loveLanguage);
    }
    state = state.copyWith(
      userInfo: currentUserInfo.copyWith(loveLanguages: loveLanguages),
      error: null,
    );
  }

  void reorderLoveLanguages(int oldIndex, int newIndex) {
    final currentUserInfo = state.userInfo;
    final loveLanguages = List<String>.from(currentUserInfo.loveLanguages);
    if (oldIndex < newIndex) {
      newIndex--;
    }
    final item = loveLanguages.removeAt(oldIndex);
    loveLanguages.insert(newIndex, item);
    state = state.copyWith(
      userInfo: currentUserInfo.copyWith(loveLanguages: loveLanguages),
      error: null,
    );
  }

  void updateRelationshipStatus(bool status) {
    final currentUserInfo = state.userInfo;
    if (!status) {
      state = state.copyWith(
        userInfo: currentUserInfo.copyWith(hasCrush: status, crushType: ''),
        error: null,
      );
    } else {
      state = state.copyWith(userInfo: currentUserInfo.copyWith(hasCrush: status), error: null);
    }
  }

  void updateCrushType(RelationshipType type) {
    final currentUserInfo = state.userInfo;

    state = state.copyWith(
      userInfo: currentUserInfo.copyWith(crushType: type.value, hasCrush: true),
      error: null,
    );
  }

  Future<bool> saveUser() async {
    final result = await saveUserInfo(SaveUserInfoParam(userInfo: state.userInfo));
    return result.getOrElse(() => false);
  }
}
