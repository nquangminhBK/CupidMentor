import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cupid_mentor/core/errors/failure.dart';
import 'package:cupid_mentor/core/utils/mixin/connectivity_mixin.dart';
import 'package:cupid_mentor/features/auth/domain/entities/user_info.dart';
import 'package:cupid_mentor/features/onboarding/data/data_sources/onboarding_datasource.dart';
import 'package:cupid_mentor/features/onboarding/domain/repository/onboarding_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class OnboardingRepositoryImpl with ConnectivityMixin implements OnboardingRepository {
  final OnboardingDatasource datasource;

  @override
  final Connectivity connectivity;

  const OnboardingRepositoryImpl({
    required this.datasource,
    required this.connectivity,
  });

  @override
  Future<Either<Failure, bool>> saveUserInfo(String userId, LoggedInUserInfo userInfo) async {
    if (await isInConnection()) {
      try {
        final result = await datasource.saveUserInfo(userId, userInfo.toModel);
        return Right(result);
      } catch (e, _) {
        debugPrint(e.toString());
        return Left(Failure(e.toString()));
      }
    }
    return const Left(NoConnection());
  }
}
