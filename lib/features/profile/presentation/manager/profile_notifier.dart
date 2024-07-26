import 'package:cupid_mentor/core/constants/gender.dart';
import 'package:cupid_mentor/core/constants/relationship_type.dart';
import 'package:cupid_mentor/core/usecases/usecase.dart';
import 'package:cupid_mentor/features/auth/domain/entities/crush_info.dart';
import 'package:cupid_mentor/features/onboarding/domain/use_cases/save_user_info.dart';
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

  SaveUserInfo get saveUserInfo => ref.read(saveUserInfoUserUseCaseProvider);

  Future<void> getData() async {
    final response = await getUserInfo(NoParams());
    response.fold((error) {
      state = state.copyWith(isLoading: false, error: error.message);
    }, (userInfo) {
      if (userInfo != null) {
        state = state.copyWith(isLoading: false, userInfo: userInfo, tempUserInfo: userInfo);
      }
    });
  }

  Future<bool> updateUserInfo() async {
    if (state.tempUserInfo == null) return false;
    state = state.copyWith(
      isLoading: false,
      userInfo: state.tempUserInfo,
    );
    final result = await saveUserInfo(SaveUserInfoParam(userInfo: state.tempUserInfo!));
    return result.getOrElse(() => false);
  }

  void updateHobbies(String hobby, bool isRemove) {
    final currentUserInfo = state.tempUserInfo;
    final hobbies = List<String>.from(currentUserInfo?.hobbies ?? []);
    if (isRemove) {
      hobbies.remove(hobby);
    } else {
      hobbies.add(hobby);
    }
    state = state.copyWith(tempUserInfo: currentUserInfo?.copyWith(hobbies: hobbies), error: null);
  }

  void updateCrushHobbies(String hobby, bool isRemove) {
    final currentCrushInfo = state.tempUserInfo?.crushInfo ?? CrushInfo.empty();
    final currentUserInfo = state.tempUserInfo;
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
      tempUserInfo: currentUserInfo?.copyWith(crushInfo: updatedCrushInfo),
      error: '',
    );
  }

  void updatePersonalities(String personality, bool isRemove) {
    final currentUserInfo = state.tempUserInfo;
    final personalities = List<String>.from(currentUserInfo?.personalities ?? []);
    if (isRemove) {
      personalities.remove(personality);
    } else {
      personalities.add(personality);
    }
    state = state.copyWith(
      tempUserInfo: currentUserInfo?.copyWith(personalities: personalities),
      error: null,
    );
  }

  Future<void> deletePartnerProfile() async {
    if (state.userInfo == null) return;
    await saveUserInfo(
      SaveUserInfoParam(
        userInfo: state.userInfo!.copyWith(hasCrush: false, crushInfo: null, crushType: ''),
      ),
    );
    state = state.copyWith(
      isLoading: false,
      userInfo: state.userInfo!.copyWith(hasCrush: false, crushInfo: null, crushType: ''),
      tempUserInfo: state.userInfo!.copyWith(hasCrush: false, crushInfo: null, crushType: ''),
    );
  }

  void updateLoveLanguages(String loveLanguage, bool isRemove) {
    final currentUserInfo = state.tempUserInfo;
    final loveLanguages = List<String>.from(currentUserInfo?.loveLanguages ?? []);
    if (isRemove) {
      loveLanguages.remove(loveLanguage);
    } else {
      loveLanguages.add(loveLanguage);
    }
    state = state.copyWith(
      tempUserInfo: currentUserInfo?.copyWith(loveLanguages: loveLanguages),
      error: null,
    );
  }

  void reorderLoveLanguages(int oldIndex, int newIndex) {
    final currentUserInfo = state.tempUserInfo;
    final loveLanguages = List<String>.from(currentUserInfo?.loveLanguages ?? []);
    if (oldIndex < newIndex) {
      newIndex--;
    }
    final item = loveLanguages.removeAt(oldIndex);
    loveLanguages.insert(newIndex, item);
    state = state.copyWith(
      tempUserInfo: currentUserInfo?.copyWith(loveLanguages: loveLanguages),
      error: null,
    );
  }

  void updateCrushType(RelationshipType type) {
    final currentUserInfo = state.tempUserInfo;

    state =
        state.copyWith(tempUserInfo: currentUserInfo?.copyWith(crushType: type.value), error: null);
  }

  void updateBasicInfo({String? name, Gender? gender, DateTime? birthDay, String? job}) {
    final currentUserInfo = state.tempUserInfo;
    state = state.copyWith(
      tempUserInfo: currentUserInfo?.copyWith(
        name: name ?? currentUserInfo.name,
        birthday: birthDay ?? currentUserInfo.birthday,
        job: job ?? currentUserInfo.job,
        gender: gender ?? currentUserInfo.gender,
      ),
      error: null,
    );
  }

  void updateCrushBasicInfo({String? name, Gender? gender, DateTime? birthDay, String? job}) {
    final currentCrushInfo = state.tempUserInfo?.crushInfo ?? CrushInfo.empty();
    final currentUserInfo = state.tempUserInfo;
    final updatedCrushInfo = currentCrushInfo.copyWith(
      name: name ?? currentCrushInfo.name,
      birthday: birthDay ?? currentCrushInfo.birthday,
      job: job ?? currentCrushInfo.job,
      gender: gender ?? currentCrushInfo.gender,
    );
    state = state.copyWith(
      tempUserInfo: currentUserInfo?.copyWith(
        crushInfo: updatedCrushInfo,
      ),
      error: '',
    );
  }
}
