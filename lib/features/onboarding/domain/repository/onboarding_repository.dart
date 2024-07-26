import 'package:cupid_mentor/core/errors/failure.dart';
import 'package:cupid_mentor/features/auth/domain/entities/user_info.dart';
import 'package:dartz/dartz.dart';

abstract class OnboardingRepository {
  Future<Either<Failure, bool>> saveUserInfo(LoggedInUserInfo userInfo);
}
