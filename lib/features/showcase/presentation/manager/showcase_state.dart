import 'package:freezed_annotation/freezed_annotation.dart';

part 'showcase_state.freezed.dart';

@freezed
abstract class ShowCaseState with _$ShowCaseState {
  const factory ShowCaseState.initialized() = ShowCaseInitializedState;

  const factory ShowCaseState.goToStep1() = ShowCaseGoToStep1State;

  const factory ShowCaseState.goToStep2() = ShowCaseGoToStep2State;

  const factory ShowCaseState.goToStep3() = ShowCaseGoToStep3State;
}
