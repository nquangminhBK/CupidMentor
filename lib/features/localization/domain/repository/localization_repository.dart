import 'package:cupid_mentor/core/constants/localization_const.dart';
import 'package:cupid_mentor/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class LocalizationRepository {
  Future<Either<Failure, LocalizationEnum>> getLanguage();

  Future<Either<Failure, bool>> setLanguage(LocalizationEnum language);

  Future<Either<Failure, bool>> clearLanguageData();
}
