import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cupid_mentor/core/errors/failure.dart';
import 'package:cupid_mentor/core/utils/mixin/connectivity_mixin.dart';
import 'package:cupid_mentor/features/auth/domain/entities/user_info.dart';
import 'package:cupid_mentor/features/tips_self_improvement/data/data_sources/tips_self_improve_datasource.dart';
import 'package:cupid_mentor/features/tips_self_improvement/domain/repository/tips_self_improve_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class TipsSelfImproveRepositoryImpl with ConnectivityMixin implements TipsSelfImproveRepository {
  final TipsSelfImproveDatasource datasource;

  @override
  final Connectivity connectivity;

  const TipsSelfImproveRepositoryImpl({
    required this.datasource,
    required this.connectivity,
  });

  @override
  Future<Either<Failure, String>> generateResponseTipsSelfImprove({
    required String content,
    required LoggedInUserInfo userInfo,
  }) async {
    if (await isInConnection()) {
      try {
        final result =
            await datasource.generateResponseTipsSelfImprove(content: content, userInfo: userInfo);
        if (result?.isEmpty ?? true) {
          return const Left(Failure('Cannot generate response'));
        }
        return Right(result!);
      } catch (e, _) {
        debugPrint(e.toString());
        return Left(Failure(e.toString()));
      }
    }
    return const Left(NoConnection());
  }
}
