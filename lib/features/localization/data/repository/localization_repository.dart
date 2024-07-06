import 'package:cupid_mentor/core/constants/localization_const.dart';
import 'package:cupid_mentor/core/errors/failure.dart';
import 'package:cupid_mentor/features/localization/data/data_sources/localization_datasource.dart';
import 'package:cupid_mentor/features/localization/domain/repository/localization_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class LocalizationRepositoryImpl implements LocalizationRepository {
  final LocalizationDatasource datasource;

  const LocalizationRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Either<Failure, bool>> clearLanguageData() async {
    try {
      final result = await datasource.clearLanguageData();

      return Right(result);
    } catch (e, _) {
      debugPrint(e.toString());
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, LocalizationEnum?>> getLanguage() async {
    try {
      final result = await datasource.getLanguage();

      return Right(result);
    } catch (e, _) {
      debugPrint(e.toString());
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> setLanguage(LocalizationEnum language) async {
    try {
      final result = await datasource.setLanguage(language);

      return Right(result);
    } catch (e, _) {
      debugPrint(e.toString());
      return Left(Failure(e.toString()));
    }
  }
}
