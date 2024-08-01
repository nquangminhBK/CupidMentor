import 'package:cupid_mentor/core/core_object/localization_content.dart';
import 'package:cupid_mentor/core/usecases/usecase.dart';
import 'package:cupid_mentor/features/preload_data/domain/entities/content_with_description.dart';
import 'package:cupid_mentor/features/preload_data/domain/entities/content_with_image.dart';
import 'package:cupid_mentor/features/preload_data/domain/entities/self_improvement_entity.dart';
import 'package:cupid_mentor/features/preload_data/domain/use_cases/get_about_us.dart';
import 'package:cupid_mentor/features/preload_data/domain/use_cases/get_hobbies.dart';
import 'package:cupid_mentor/features/preload_data/domain/use_cases/get_love_language_concepts.dart';
import 'package:cupid_mentor/features/preload_data/domain/use_cases/get_love_language_overall_info.dart';
import 'package:cupid_mentor/features/preload_data/domain/use_cases/get_love_languages.dart';
import 'package:cupid_mentor/features/preload_data/domain/use_cases/get_personalities.dart';
import 'package:cupid_mentor/features/preload_data/domain/use_cases/get_privacy_policy.dart';
import 'package:cupid_mentor/features/preload_data/domain/use_cases/get_self_improvement.dart';
import 'package:cupid_mentor/features/preload_data/domain/use_cases/get_special_occasions.dart';
import 'package:cupid_mentor/features/preload_data/domain/use_cases/get_term_of_service.dart';
import 'package:cupid_mentor/features/preload_data/domain/use_cases/initialize.dart';
import 'package:cupid_mentor/features/preload_data/presentation/manager/preload_data_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'preload_data_notifier.g.dart';

@Riverpod(keepAlive: true)
class PreloadDataNotifier extends _$PreloadDataNotifier {
  @override
  PreloadDataState build() {
    return PreloadDataState.initial();
  }

  GetAboutUs get getAboutUs => ref.read(getAboutUsProvider);

  GetHobbies get getHobbies => ref.read(getHobbiesProvider);

  GetLoveLanguageConcepts get getLoveLanguagesConcepts => ref.read(getLoveLanguageConceptsProvider);

  GetLoveLanguageOverallInfo get getLoveLanguageOverallInfo =>
      ref.read(getLoveLanguageOverallInfoProvider);

  GetLoveLanguages get getLoveLanguages => ref.read(getLoveLanguagesProvider);

  GetPersonalities get getPersonalities => ref.read(getPersonalitiesProvider);

  GetSelfImprovements get getSelfImprovements => ref.read(getSelfImprovementsProvider);

  GetSpecialOccasions get getSpecialOccasions => ref.read(getSpecialOccasionsProvider);

  GetTermOfService get getTermOfService => ref.read(getTermOfServiceProvider);

  GetPrivacyPolicy get getPrivacyPolicy => ref.read(getPrivacyPolicyProvider);

  InitializeRemoteConfig get initializeRemoteConfig => ref.read(initializeRemoteConfigProvider);

  Future<void> initializeAndFetchRemoteConfig() async {
    await initializeRemoteConfig(NoParams());
    state = state.copyWith(isInitializing: true);
  }

  Future<void> preloadData() async {
    final response = await Future.wait([
      getAboutUs(NoParams()),
      getHobbies(NoParams()),
      getLoveLanguagesConcepts(NoParams()),
      getLoveLanguageOverallInfo(NoParams()),
      getLoveLanguages(NoParams()),
      getPersonalities(NoParams()),
      getSelfImprovements(NoParams()),
      getSpecialOccasions(NoParams()),
      getTermOfService(NoParams()),
      getPrivacyPolicy(NoParams()),
    ]);
    response[0].fold((failed) {}, (data) {
      state = state.copyWith(aboutUs: data as LocalizationContent);
    });
    response[1].fold((failed) {}, (data) {
      state = state.copyWith(hobbies: data as List<LocalizationContent>);
    });
    response[2].fold((failed) {}, (data) {
      state = state.copyWith(loveLanguageConcepts: data as LocalizationContent);
    });
    response[3].fold((failed) {}, (data) {
      state = state.copyWith(loveLanguageOverallInfo: data as LocalizationContent);
    });
    response[4].fold((failed) {}, (data) {
      state = state.copyWith(loveLanguages: data as List<ContentWithDescription>);
    });
    response[5].fold((failed) {}, (data) {
      state = state.copyWith(personalities: data as List<LocalizationContent>);
    });
    response[6].fold((failed) {}, (data) {
      state = state.copyWith(selfImprovements: data as List<SelfImprovementEntity>);
    });
    response[7].fold((failed) {}, (data) {
      state = state.copyWith(specialOccasions: data as List<ContentWithImage>);
    });
    response[8].fold((failed) {}, (data) {
      state = state.copyWith(termOfService: data as LocalizationContent);
    });
    response[9].fold((failed) {}, (data) {
      state = state.copyWith(privacyPolicy: data as LocalizationContent);
    });
  }
}
