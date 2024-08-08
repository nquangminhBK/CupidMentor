import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cupid_mentor/core/core_entity/content_response.dart';
import 'package:cupid_mentor/core/errors/api_failure.dart';
import 'package:cupid_mentor/core/utils/mixin/connectivity_mixin.dart';
import 'package:cupid_mentor/features/tip_date_spots/data/data_sources/tips_date_spot_datasource.dart';
import 'package:cupid_mentor/features/tip_date_spots/domain/repository/tip_date_spot_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class TipsDateSpotRepositoryImpl with ConnectivityMixin implements TipsDateSpotRepository {
  final TipsDateSpotDatasource datasource;

  @override
  final Connectivity connectivity;

  const TipsDateSpotRepositoryImpl({
    required this.connectivity,
    required this.datasource,
  });

  @override
  Future<Either<Failure, bool>> addTipsDateSpot({
    required String occasionId,
    required ContentResponse content,
  }) async {
    if (await isInConnection()) {
      try {
        final result =
            await datasource.addTipsDateSpot(occasionId: occasionId, content: content.toModel);

        return Right(result);
      } catch (e, _) {
        debugPrint(e.toString());
        return Left(Failure(e.toString()));
      }
    }
    return const Left(NoConnection());
  }

  @override
  Future<Either<Failure, List<ContentResponse>>> getListTipsDateSpot({
    required String occasionId,
  }) async {
    if (await isInConnection()) {
      try {
        final result = await datasource.getListTipsDateSpot(occasionId: occasionId);

        return Right(result.map((e) => e.toEntity).toList());
      } catch (e, _) {
        debugPrint(e.toString());
        return Left(Failure(e.toString()));
      }
    }
    return const Left(NoConnection());
  }

  @override
  Future<Either<Failure, bool>> deleteTipDateSpot({
    required String occasionId,
    required String contentId,
  }) async {
    if (await isInConnection()) {
      try {
        final result = await datasource.deleteTipsDateSpot(
          occasionId: occasionId,
          contentId: contentId,
        );

        return Right(result);
      } catch (e, _) {
        debugPrint(e.toString());
        return Left(Failure(e.toString()));
      }
    }
    return const Left(NoConnection());
  }
}
