import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cupid_mentor/core/core_entity/content_response.dart';
import 'package:cupid_mentor/core/errors/api_failure.dart';
import 'package:cupid_mentor/core/utils/mixin/connectivity_mixin.dart';
import 'package:cupid_mentor/features/tips_gift/data/data_sources/tips_gift_datasource.dart';
import 'package:cupid_mentor/features/tips_gift/domain/repository/tips_gift_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class TipsGiftRepositoryImpl with ConnectivityMixin implements TipsGiftRepository {
  final TipsGiftDatasource datasource;

  @override
  final Connectivity connectivity;

  const TipsGiftRepositoryImpl({
    required this.connectivity,
    required this.datasource,
  });

  @override
  Future<Either<Failure, bool>> addTipsGift({
    required String occasionId,
    required ContentResponse content,
  }) async {
    if (await isInConnection()) {
      try {
        final result =
            await datasource.addTipsGift(occasionId: occasionId, content: content.toModel);

        return Right(result);
      } catch (e, _) {
        debugPrint(e.toString());
        return Left(Failure(e.toString()));
      }
    }
    return const Left(NoConnection());
  }

  @override
  Future<Either<Failure, List<ContentResponse>>> getListTipsGift({
    required String occasionId,
  }) async {
    if (await isInConnection()) {
      try {
        final result = await datasource.getListTipsGift(occasionId: occasionId);

        return Right(result.map((e) => e.toEntity).toList());
      } catch (e, _) {
        debugPrint(e.toString());
        return Left(Failure(e.toString()));
      }
    }
    return const Left(NoConnection());
  }

  @override
  Future<Either<Failure, bool>> deleteTipGift({
    required String occasionId,
    required String contentId,
  }) async {
    if (await isInConnection()) {
      try {
        final result = await datasource.deleteTipGift(
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
