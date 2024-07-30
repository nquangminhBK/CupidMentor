import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState.initialized() = HomeInitializedState;

  const factory HomeState.showIntroductionPopup() = HomeShowIntroductionPopupState;
}
