import 'package:cupid_mentor/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class SplashRepositories {
  Either<Failure, bool> needShowShowcase();

  Future<Either<Failure, bool>> needOnboarding();
}
