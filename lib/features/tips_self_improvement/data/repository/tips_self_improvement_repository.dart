import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cupid_mentor/core/core_entity/content_response.dart';
import 'package:cupid_mentor/core/errors/failure.dart';
import 'package:cupid_mentor/core/utils/mixin/connectivity_mixin.dart';
import 'package:cupid_mentor/features/tips_self_improvement/data/data_sources/tips_self_improvement_datasource.dart';
import 'package:cupid_mentor/features/tips_self_improvement/domain/repository/tips_self_improvement_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class TipsSelfImprovementRepositoryImpl
    with ConnectivityMixin
    implements TipsSelfImprovementRepository {
  final TipsSelfImprovementDatasource datasource;

  @override
  final Connectivity connectivity;

  const TipsSelfImprovementRepositoryImpl({
    required this.datasource,
    required this.connectivity,
  });

  @override
  Future<Either<Failure, bool>> addTipsSelfImprovement({
    required String selfImprovementId,
    required ContentResponse content,
  }) async {
    if (await isInConnection()) {
      try {
        final result = await datasource.addTipsSelfImprovement(
          selfImprovementId: selfImprovementId,
          content: content.toModel,
        );

        return Right(result);
      } catch (e, _) {
        debugPrint(e.toString());
        return Left(Failure(e.toString()));
      }
    }
    return const Left(NoConnection());
  }

  @override
  Future<Either<Failure, List<ContentResponse>>> getListTipsSelfImprovement({
    required String selfImprovementId,
  }) async {
    if (await isInConnection()) {
      try {
        final result =
            await datasource.getListTipsSelfImprovement(selfImprovementId: selfImprovementId);

        return Right(result.map((e) => e.toEntity).toList());
      } catch (e, _) {
        debugPrint(e.toString());
        return Left(Failure(e.toString()));
      }
    }
    return const Left(NoConnection());
  }
}
