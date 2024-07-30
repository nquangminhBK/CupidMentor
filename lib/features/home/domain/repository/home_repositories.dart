import 'package:cupid_mentor/core/errors/api_failure.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepositories {
  Either<Failure, bool> needShowIntroduction();
}
