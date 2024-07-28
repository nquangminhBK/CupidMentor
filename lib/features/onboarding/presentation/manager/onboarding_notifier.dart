import 'package:cupid_mentor/core/constants/datetime.dart';
import 'package:cupid_mentor/core/constants/gender.dart';
import 'package:cupid_mentor/core/constants/relationship_type.dart';
import 'package:cupid_mentor/core/errors/ui_failures.dart';
import 'package:cupid_mentor/core/errors/ui_success.dart';
import 'package:cupid_mentor/core/extensions/datetime_extension.dart';
import 'package:cupid_mentor/core/usecases/usecase.dart';
import 'package:cupid_mentor/features/auth/domain/entities/partner_info.dart';
import 'package:cupid_mentor/features/auth/domain/entities/user_info.dart';
import 'package:cupid_mentor/features/onboarding/domain/use_cases/get_current_user.dart';
import 'package:cupid_mentor/features/onboarding/domain/use_cases/save_user_info.dart';
import 'package:cupid_mentor/features/onboarding/presentation/manager/onboarding_state.dart';
import 'package:cupid_mentor/features/setting/domain/use_cases/get_user_info.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/errors/api_failure.dart';

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

  Future<void> _initializeEmptyUserInfo(Either<Failure, User> response) async {
    response.fold((failed) {
      state = state.copyWith(
        userInfo: LoggedInUserInfo.empty(),
      );
    }, (googleUser) {
      state = state.copyWith(
        userInfo: LoggedInUserInfo.empty().copyWith(
          name: googleUser.displayName ?? '',
          avatar: googleUser.photoURL ?? '',
        ),
      );
    });
  }

  Future<void> initializeUserInfo() async {
    final response = await Future.wait([getUserInfo(NoParams()), getCurrentUser(NoParams())]);
    response[0].fold((failed) {
      _initializeEmptyUserInfo(response[1] as Either<Failure, User>);
    }, (user) {
      if (user != null) {
        state = state.copyWith(
          userInfo: (user as LoggedInUserInfo),
        );
      } else {
        _initializeEmptyUserInfo(response[1] as Either<Failure, User>);
      }
    });
  }

  Future<void> goNextPage(int currentPage, bool isOnboarding) async {
    state = state.copyWith(errorOrSuccess: null, canGoNext: false);
    if (isOnboarding) {
      switch (currentPage) {
        case 0:
          if (state.userInfo.name.isEmpty) {
            state = state.copyWith(
              canGoNext: false,
              errorOrSuccess: Left(OnboardingMissingNameError()),
            );
            return;
          }
          if (state.userInfo.gender == null) {
            state = state.copyWith(
              canGoNext: false,
              errorOrSuccess: Left(OnboardingMissingGenderError()),
            );
            return;
          }
          if (state.userInfo.birthday.isSameDate(DateTimeConst.empty())) {
            state = state.copyWith(
              canGoNext: false,
              errorOrSuccess: Left(OnboardingMissingBirthdayError()),
            );
            return;
          }
          if (state.userInfo.job.isEmpty) {
            state =
                state.copyWith(canGoNext: false, errorOrSuccess: Left(OnboardingMissingJobError()));
            return;
          }
        case 1:
          if (state.userInfo.personalities.isEmpty) {
            state = state.copyWith(
              canGoNext: false,
              errorOrSuccess: Left(
                OnboardingMissingPersonalitiesError(),
              ),
            );
            return;
          }
        case 2:
          if (state.userInfo.hobbies.isEmpty) {
            state = state.copyWith(
              canGoNext: false,
              errorOrSuccess: Left(OnboardingMissingHobbiesError()),
            );
            return;
          }
        case 3:
          if (state.userInfo.loveLanguages.isEmpty) {
            state = state.copyWith(
              canGoNext: false,
              errorOrSuccess: Left(OnboardingMissingLoveLanguageError()),
            );
            return;
          }
      }
    } else {
      switch (currentPage) {
        case 0:
          if (state.userInfo.hasPartner == false) {
            state = state.copyWith(
              canGoNext: false,
              errorOrSuccess: Left(OnboardingMissingRelationshipTypeError()),
            );
            return;
          }
        case 1:
          if (state.userInfo.partnerInfo?.gender == null) {
            state = state.copyWith(
              canGoNext: false,
              errorOrSuccess: Left(OnboardingMissingPartnerGenderError()),
            );
            return;
          }
      }
    }

    state = state.copyWith(errorOrSuccess: null, canGoNext: true);
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
      errorOrSuccess: null,
      canGoNext: false,
    );
  }

  void updatePartnerBasicInfo({String? name, Gender? gender, DateTime? birthDay, String? job}) {
    final currentPartnerInfo = state.userInfo.partnerInfo ?? PartnerInfo.empty();
    final currentUserInfo = state.userInfo;
    final updatedPartnerInfo = currentPartnerInfo.copyWith(
      name: name ?? currentPartnerInfo.name,
      birthday: birthDay ?? currentPartnerInfo.birthday,
      job: job ?? currentPartnerInfo.job,
      gender: gender ?? currentPartnerInfo.gender,
    );
    state = state.copyWith(
      userInfo: currentUserInfo.copyWith(
        partnerInfo: updatedPartnerInfo,
      ),
      errorOrSuccess: null,
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
      errorOrSuccess: null,
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
    state =
        state.copyWith(userInfo: currentUserInfo.copyWith(hobbies: hobbies), errorOrSuccess: null);
  }

  void updatePartnerHobbies(String hobby, bool isRemove) {
    final currentPartnerInfo = state.userInfo.partnerInfo ?? PartnerInfo.empty();
    final currentUserInfo = state.userInfo;
    final hobbies = List<String>.from(currentPartnerInfo.hobbies);
    if (isRemove) {
      hobbies.remove(hobby);
    } else {
      hobbies.add(hobby);
    }
    final updatedPartnerInfo = currentPartnerInfo.copyWith(
      hobbies: hobbies,
    );
    state = state.copyWith(
      userInfo: currentUserInfo.copyWith(partnerInfo: updatedPartnerInfo),
      errorOrSuccess: null,
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
      errorOrSuccess: null,
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
      errorOrSuccess: null,
    );
  }

  void updateRelationshipStatus(bool status) {
    final currentUserInfo = state.userInfo;
    if (!status) {
      state = state.copyWith(
        userInfo: currentUserInfo.copyWith(hasPartner: status, relationship: ''),
        errorOrSuccess: null,
      );
    } else {
      state = state.copyWith(
        userInfo: currentUserInfo.copyWith(hasPartner: status),
        errorOrSuccess: null,
      );
    }
  }

  void updateRelationship(RelationshipType type) {
    final currentUserInfo = state.userInfo;

    state = state.copyWith(
      userInfo: currentUserInfo.copyWith(relationship: type.value, hasPartner: true),
      errorOrSuccess: null,
    );
  }

  Future<void> saveUser() async {
    final result = await saveUserInfo(SaveUserInfoParam(userInfo: state.userInfo));
    result.fold((failed) {
      state = state.copyWith(errorOrSuccess: Left(OnboardingSaveInfoFailedError()));
    }, (right) {
      state = state.copyWith(errorOrSuccess: Right(OnboardingSaveInfoSuccess()));
    });
  }
}
