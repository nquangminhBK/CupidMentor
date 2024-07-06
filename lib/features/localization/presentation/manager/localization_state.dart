import 'package:cupid_mentor/core/constants/localization_const.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'localization_state.freezed.dart';

@freezed
abstract class LocalizationState with _$LocalizationState {
  const LocalizationState._();

  const factory LocalizationState({required LocalizationEnum lang}) = _LocalizationState;

  factory LocalizationState.initial() => const LocalizationState(lang: LocalizationEnum.english);
}
