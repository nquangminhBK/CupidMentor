import 'package:cupid_mentor/core/core_object/localization_content.dart';
import 'package:cupid_mentor/features/preload_data/domain/entities/contact_info.dart';
import 'package:cupid_mentor/features/preload_data/domain/entities/content_with_description.dart';
import 'package:cupid_mentor/features/preload_data/domain/entities/content_with_image.dart';
import 'package:cupid_mentor/features/preload_data/domain/entities/self_improvement_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'preload_data_state.freezed.dart';

@freezed
abstract class PreloadDataState with _$PreloadDataState {
  const PreloadDataState._();

  const factory PreloadDataState({
    bool? isInitializing,
    LocalizationContent? aboutUs,
    required List<LocalizationContent> hobbies,
    LocalizationContent? loveLanguageConcepts,
    LocalizationContent? loveLanguageOverallInfo,
    required List<ContentWithDescription> loveLanguages,
    required List<LocalizationContent> personalities,
    LocalizationContent? privacyPolicy,
    LocalizationContent? termOfService,
    required List<SelfImprovementEntity> selfImprovements,
    required List<ContentWithImage> specialOccasions,
    required ContactInfo contactInfo,
  }) = _PreloadDataState;

  factory PreloadDataState.initial() => PreloadDataState(
        hobbies: [],
        loveLanguages: [],
        personalities: [],
        selfImprovements: [],
        specialOccasions: [],
        contactInfo: ContactInfo.empty(),
      );
}
