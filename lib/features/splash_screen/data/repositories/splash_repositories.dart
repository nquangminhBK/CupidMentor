import 'package:cupid_mentor/core/errors/api_failure.dart';
import 'package:cupid_mentor/features/auth/data/data_sources/authentication_remote_datasource.dart';
import 'package:cupid_mentor/features/splash_screen/data/data_sources/splash_datasource.dart';
import 'package:cupid_mentor/features/splash_screen/domain/repositories/splash_repositories.dart';
import 'package:dartz/dartz.dart';

class SplashRepositoriesImpl implements SplashRepositories {
  final SplashDatasource splashDatasource;
  final AuthenticationRemoteDatasource authenticationRemoteDatasource;

  const SplashRepositoriesImpl({
    required this.splashDatasource,
    required this.authenticationRemoteDatasource,
  });

  @override
  Either<Failure, bool> needShowShowcase() {
    final isFirstTime = splashDatasource.isFirstTime();
    if (isFirstTime) {
      return const Right(true);
    } else {
      return const Right(false);
    }
  }

  @override
  Future<Either<Failure, bool>> needOnboarding() async {
    final userInfo = await authenticationRemoteDatasource.getUserInfo();
    if (userInfo == null) return const Right(true);
    return const Right(false);
  }

  @override
  Either<Failure, bool> updateShowCase() {
    splashDatasource.updateFirstTime();
    return const Right(true);
  }
}
