import 'package:cupid_mentor/core/errors/failure.dart';
import 'package:cupid_mentor/features/auth/data/datasources/authentication_remote_datasource.dart';
import 'package:cupid_mentor/features/splash_screen/data/data_sources/splash_datasources.dart';
import 'package:cupid_mentor/features/splash_screen/domain/repositories/splash_repositories.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class SplashRepositoriesImpl implements SplashRepositories {
  final SplashDatasource splashDatasource;
  final AuthenticationRemoteDatasource authenticationRemoteDatasource;

  const SplashRepositoriesImpl(
      {required this.splashDatasource, required this.authenticationRemoteDatasource});

  @override
  Either<Failure, bool> needShowShowcase() {
    final isFirstTime = splashDatasource.isFirstTime();
    if (isFirstTime) {
      splashDatasource.updateFirstTime();
      return const Right(true);
    } else {
      return const Right(false);
    }
  }

  @override
  Future<Either<Failure, bool>> needOnboarding() async {
    final currentUser = authenticationRemoteDatasource.getCurrentUser();
    debugPrint("minh check ${currentUser?.uid}");
    final userInfo = await authenticationRemoteDatasource.getUserInfo(currentUser?.uid ?? "");
    if (userInfo == null) return const Right(true);
    return const Right(false);
  }
}
