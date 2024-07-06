import 'package:cupid_mentor/core/constants/localization_const.dart';
import 'package:cupid_mentor/core/usecases/usecase.dart';
import 'package:cupid_mentor/features/localization/domain/use_cases/clear_language_data.dart';
import 'package:cupid_mentor/features/localization/domain/use_cases/get_language.dart';
import 'package:cupid_mentor/features/localization/domain/use_cases/set_language.dart';
import 'package:cupid_mentor/features/localization/presentation/manager/localization_state.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'localization_notifier.g.dart';

@riverpod
class LocalizationNotifier extends _$LocalizationNotifier {
  @override
  LocalizationState build() {
    return LocalizationState.initial();
  }

  GetLanguage get getLanguage => ref.read(getLanguageUseCaseProvider);

  SetLanguage get setLanguage => ref.read(setLanguageUseCaseProvider);

  ClearLanguageData get clearLanguageData => ref.read(clearLanguageDataUseCaseProvider);

  Future<void> checkInitialLanguage() async {
    final currentLanguageResponse = await getLanguage(NoParams());
    final currentLanguage = currentLanguageResponse.getOrElse(() => null);
    if (currentLanguage == null) return;
    await updateLanguage(currentLanguage);
  }

  Future<void> updateLanguage(LocalizationEnum lang) async {
    state = state.copyWith(lang: lang);
    await setLanguage(SetLanguageParam(lang: lang));
    await AppLocalizations.delegate.load(Locale.fromSubtags(languageCode: lang.value));
  }
}
