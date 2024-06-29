import 'package:cupid_mentor/core/errors/failure.dart';
import 'package:cupid_mentor/features/auth/domain/entities/crush_info.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, bool>> signIn();

  Future<Either<Failure, bool>> signOut();

  Future<Either<Failure, UserInfo>> getUserInfo();

  Future<Either<Failure, CrushInfo>> getCrushInfo();
}