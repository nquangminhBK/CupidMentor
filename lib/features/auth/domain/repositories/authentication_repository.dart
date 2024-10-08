import 'package:cupid_mentor/core/errors/api_failure.dart';
import 'package:cupid_mentor/features/auth/domain/entities/user_info.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, bool>> signIn();

  Future<Either<Failure, bool>> signOut();

  Future<Either<Failure, LoggedInUserInfo?>> getUserInfo();

  Either<Failure, bool> needLogin();

  Either<Failure, User> getCurrentUser();

  Future<Either<Failure, bool>> deleteUser();
}
