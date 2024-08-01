import 'package:cupid_mentor/core/core_object/localization_content.dart';
import 'package:cupid_mentor/core/errors/api_failure.dart';
import 'package:cupid_mentor/features/preload_data/domain/entities/content_with_description.dart';
import 'package:cupid_mentor/features/preload_data/domain/entities/content_with_image.dart';
import 'package:cupid_mentor/features/preload_data/domain/entities/self_improvement_entity.dart';
import 'package:dartz/dartz.dart';

abstract class PreloadDataRepository {
  Future<Either<Failure, List<LocalizationContent>>> getHobbies();

  Future<Either<Failure, List<LocalizationContent>>> getPersonalities();

  Future<Either<Failure, LocalizationContent>> getLoveLanguagesConcepts();

  Future<Either<Failure, LocalizationContent>> getLoveLanguagesOverallInfo();

  Future<Either<Failure, List<ContentWithDescription>>> getLoveLanguages();

  Future<Either<Failure, LocalizationContent>> getAboutUs();

  Future<Either<Failure, LocalizationContent>> getTermOfService();

  Future<Either<Failure, LocalizationContent>> getPrivacyPolicy();

  Future<Either<Failure, List<SelfImprovementEntity>>> getSelfImprovements();

  Future<Either<Failure, List<ContentWithImage>>> getSpecialOccasions();

  Future<Either<Failure, void>> initializeRemoteConfig();
}
