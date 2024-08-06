import 'package:cupid_mentor/core/errors/api_failure.dart';
import 'package:dartz/dartz.dart';

abstract class SplashRepositories {
  Either<Failure, bool> needShowShowcase();

  Either<Failure, bool> updateShowCase();

  Future<Either<Failure, bool>> needOnboarding();
}
