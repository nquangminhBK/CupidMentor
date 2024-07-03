import 'package:cupid_mentor/core/constants/datetime.dart';
import 'package:cupid_mentor/core/constants/gender.dart';
import 'package:cupid_mentor/core/constants/personalities.dart';
import 'package:cupid_mentor/core/constants/relationship_type.dart';
import 'package:cupid_mentor/core/extensions/datetime_extension.dart';
import 'package:cupid_mentor/core/usecases/usecase.dart';
import 'package:cupid_mentor/features/auth/domain/entities/user_info.dart';
import 'package:cupid_mentor/features/onboarding/domain/use_cases/get_current_user.dart';
import 'package:cupid_mentor/features/onboarding/presentation/manager/onboarding_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'onboarding_notifier.g.dart';

@Riverpod(keepAlive: true)
class OnboardingNotifier extends _$OnboardingNotifier {
  @override
  OnboardingState build() {
    return OnboardingState.initial();
  }

  GetCurrentUser get getCurrentUser => ref.read(getCurrentUserUseCaseProvider);

  Future<void> initializeUserInfo() async {
    final currentUser = await getCurrentUser(NoParams());
    currentUser.fold((failed) {}, (user) {
      state = state.copyWith(
          userInfo: LoggedInUserInfo.empty().copyWith(
        name: user.displayName ?? "",
        avatar: user.photoURL ?? "",
      ));
    });
  }

  void goNextPage(int currentPage) async {
    state = state.copyWith(errorMessage: "", canGoNext: false);
    switch (currentPage) {
      case 0:
        if (state.userInfo.name.isEmpty) {
          state = state.copyWith(canGoNext: false, errorMessage: 'Please input your name!');
          return;
        }
        if (state.userInfo.gender == Gender.none) {
          state = state.copyWith(canGoNext: false, errorMessage: 'Please select your gender!');
          return;
        }
        if (state.userInfo.birthday.isSameDate(DateTimeConst.empty())) {
          state = state.copyWith(canGoNext: false, errorMessage: 'Please input your birthday!');
          return;
        }
        if (state.userInfo.job.isEmpty) {
          state = state.copyWith(canGoNext: false, errorMessage: 'Please input your job!');
          return;
        }
      case 1:
        if (state.userInfo.personalities.isEmpty) {
          state = state.copyWith(
              canGoNext: false, errorMessage: 'Please select some work to describe the real you!');
          return;
        }
      case 2:
        if (state.userInfo.hobbies.isEmpty) {
          state = state.copyWith(
              canGoNext: false,
              errorMessage:
                  'Please select some hobbies, The more we know about you, the easier it will be for us to give advice!');
          return;
        }
      case 3:
        if (state.userInfo.loveLanguages.isEmpty) {
          state = state.copyWith(
              canGoNext: false,
              errorMessage:
                  'Please tell us about your love language, The more we know about you, the easier it will be for us to give advice!');
          return;
        }
    }
    state = state.copyWith(errorMessage: "", canGoNext: true);
  }

  void updateBasicInfo({String? name, Gender? gender, DateTime? birthDay, String? job}) {
    final currentUserInfo = state.userInfo;
    state = state.copyWith(
        userInfo: currentUserInfo.copyWith(
            name: name ?? currentUserInfo.name,
            birthday: birthDay ?? currentUserInfo.birthday,
            job: job ?? currentUserInfo.job,
            gender: gender ?? currentUserInfo.gender),
        errorMessage: "",
        canGoNext: false);
  }

  void updatePersonalities(String personality, bool isRemove) {
    final currentUserInfo = state.userInfo;
    List<String> personalities = List<String>.from(currentUserInfo.personalities);
    if (isRemove) {
      personalities.remove(personality);
    } else {
      personalities.add(personality);
    }
    state = state.copyWith(
        userInfo: currentUserInfo.copyWith(personalities: personalities), errorMessage: "");
  }

  void updateHobbies(String hobby, bool isRemove) {
    final currentUserInfo = state.userInfo;
    List<String> hobbies = List<String>.from(currentUserInfo.hobbies);
    if (isRemove) {
      hobbies.remove(hobby);
    } else {
      hobbies.add(hobby);
    }
    state = state.copyWith(userInfo: currentUserInfo.copyWith(hobbies: hobbies), errorMessage: "");
  }

  void updateLoveLanguages(String loveLanguage, bool isRemove) {
    final currentUserInfo = state.userInfo;
    List<String> loveLanguages = List<String>.from(currentUserInfo.loveLanguages);
    if (isRemove) {
      loveLanguages.remove(loveLanguage);
    } else {
      loveLanguages.add(loveLanguage);
    }
    state = state.copyWith(
        userInfo: currentUserInfo.copyWith(loveLanguages: loveLanguages), errorMessage: "");
  }

  void reorderLoveLanguages(int oldIndex, int newIndex) {
    final currentUserInfo = state.userInfo;
    List<String> loveLanguages = List<String>.from(currentUserInfo.loveLanguages);
    if (oldIndex < newIndex) {
      newIndex--;
    }
    final String item = loveLanguages.removeAt(oldIndex);
    loveLanguages.insert(newIndex, item);
    state = state.copyWith(
        userInfo: currentUserInfo.copyWith(loveLanguages: loveLanguages), errorMessage: "");
  }

  void updateRelationshipStatus(bool status) {
    final currentUserInfo = state.userInfo;
    if (!status) {
      state = state.copyWith(
          userInfo: currentUserInfo.copyWith(hasCrush: status, crushType: ""), errorMessage: "");
    } else {
      state =
          state.copyWith(userInfo: currentUserInfo.copyWith(hasCrush: status), errorMessage: "");
    }
  }

  void updateCrushType(RelationshipType type) {
    final currentUserInfo = state.userInfo;

    state =
        state.copyWith(userInfo: currentUserInfo.copyWith(crushType: type.value), errorMessage: "");
  }
}
