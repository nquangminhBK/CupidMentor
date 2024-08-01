import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cupid_mentor/core/core_object/localization_content.dart';
import 'package:cupid_mentor/core/errors/api_failure.dart';
import 'package:cupid_mentor/core/utils/mixin/connectivity_mixin.dart';
import 'package:cupid_mentor/features/preload_data/data/data_sources/preload_datasource.dart';
import 'package:cupid_mentor/features/preload_data/domain/entities/content_with_description.dart';
import 'package:cupid_mentor/features/preload_data/domain/entities/content_with_image.dart';
import 'package:cupid_mentor/features/preload_data/domain/entities/self_improvement_entity.dart';
import 'package:cupid_mentor/features/preload_data/domain/repositories/preload_data_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class PreloadDataRepositoryImpl with ConnectivityMixin implements PreloadDataRepository {
  final PreloadDatasource datasource;
  @override
  final Connectivity connectivity;

  const PreloadDataRepositoryImpl({required this.datasource, required this.connectivity});

  @override
  Future<Either<Failure, LocalizationContent>> getAboutUs() async {
    if (await isInConnection()) {
      try {
        final result = await datasource.getAboutUs();

        return Right(result);
      } catch (e, _) {
        debugPrint(e.toString());
        return Left(Failure(e.toString()));
      }
    }
    return const Left(NoConnection());
  }

  @override
  Future<Either<Failure, List<LocalizationContent>>> getHobbies() async {
    if (await isInConnection()) {
      try {
        final result = await datasource.getHobbies();

        return Right(result);
      } catch (e, _) {
        debugPrint(e.toString());
        return Left(Failure(e.toString()));
      }
    }
    return const Left(NoConnection());
  }

  @override
  Future<Either<Failure, List<ContentWithDescription>>> getLoveLanguages() async {
    if (await isInConnection()) {
      try {
        final result = await datasource.getLoveLanguages();

        return Right(result.map((e) => e.toEntity).toList());
      } catch (e, _) {
        debugPrint(e.toString());
        return Left(Failure(e.toString()));
      }
    }
    return const Left(NoConnection());
  }

  @override
  Future<Either<Failure, LocalizationContent>> getLoveLanguagesConcepts() async {
    if (await isInConnection()) {
      try {
        final result = await datasource.getLoveLanguagesConcepts();

        return Right(result);
      } catch (e, _) {
        debugPrint(e.toString());
        return Left(Failure(e.toString()));
      }
    }
    return const Left(NoConnection());
  }

  @override
  Future<Either<Failure, LocalizationContent>> getLoveLanguagesOverallInfo() async {
    if (await isInConnection()) {
      try {
        final result = await datasource.getLoveLanguagesOverallInfo();

        return Right(result);
      } catch (e, _) {
        debugPrint(e.toString());
        return Left(Failure(e.toString()));
      }
    }
    return const Left(NoConnection());
  }

  @override
  Future<Either<Failure, List<LocalizationContent>>> getPersonalities() async {
    if (await isInConnection()) {
      try {
        final result = await datasource.getPersonalities();

        return Right(result);
      } catch (e, _) {
        debugPrint(e.toString());
        return Left(Failure(e.toString()));
      }
    }
    return const Left(NoConnection());
  }

  @override
  Future<Either<Failure, LocalizationContent>> getPrivacyPolicy() async {
    if (await isInConnection()) {
      try {
        final result = await datasource.getPrivacyPolicy();

        return Right(result);
      } catch (e, _) {
        debugPrint(e.toString());
        return Left(Failure(e.toString()));
      }
    }
    return const Left(NoConnection());
  }

  @override
  Future<Either<Failure, List<SelfImprovementEntity>>> getSelfImprovements() async {
    if (await isInConnection()) {
      try {
        final result = await datasource.getSelfImprovements();

        return Right(result.map((e) => e.toEntity).toList());
      } catch (e, _) {
        debugPrint(e.toString());
        return Left(Failure(e.toString()));
      }
    }
    return const Left(NoConnection());
  }

  @override
  Future<Either<Failure, List<ContentWithImage>>> getSpecialOccasions() async {
    if (await isInConnection()) {
      try {
        final result = await datasource.getSpecialOccasions();

        return Right(result.map((e) => e.toEntity).toList());
      } catch (e, _) {
        debugPrint(e.toString());
        return Left(Failure(e.toString()));
      }
    }
    return const Left(NoConnection());
  }

  @override
  Future<Either<Failure, LocalizationContent>> getTermOfService() async {
    if (await isInConnection()) {
      try {
        final result = await datasource.getTermOfService();

        return Right(result);
      } catch (e, _) {
        debugPrint(e.toString());
        return Left(Failure(e.toString()));
      }
    }
    return const Left(NoConnection());
  }

  @override
  Future<Either<Failure, void>> initializeRemoteConfig() async {
    try {
      final result = await datasource.initialize();
      return Right(result);
    } catch (e, _) {
      debugPrint(e.toString());
      return Left(Failure(e.toString()));
    }
  }
}
