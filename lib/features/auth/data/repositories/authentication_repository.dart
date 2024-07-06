import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cupid_mentor/core/errors/failure.dart';
import 'package:cupid_mentor/core/utils/mixin/connectivity_mixin.dart';
import 'package:cupid_mentor/features/auth/data/data_sources/authentication_local_datasource.dart';
import 'package:cupid_mentor/features/auth/data/data_sources/authentication_remote_datasource.dart';
import 'package:cupid_mentor/features/auth/domain/entities/user_info.dart';
import 'package:cupid_mentor/features/auth/domain/repositories/authentication_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthenticationRepositoryImpl with ConnectivityMixin implements AuthenticationRepository {
  final AuthenticationRemoteDatasource remoteDatasource;
  final AuthenticationLocalDatasource localDatasource;

  @override
  final Connectivity connectivity;

  const AuthenticationRepositoryImpl({
    required this.remoteDatasource,
    required this.localDatasource,
    required this.connectivity,
  });

  @override
  Future<Either<Failure, LoggedInUserInfo?>> getUserInfo() async {
    if (await isInConnection()) {
      try {
        final user = await remoteDatasource.getUserInfo();

        return Right(user?.toEntity);
      } catch (e, _) {
        debugPrint(e.toString());
        return Left(Failure(e.toString()));
      }
    }
    return const Left(NoConnection());
  }

  @override
  Future<Either<Failure, bool>> signIn() async {
    final currentUser = remoteDatasource.getCurrentUser();
    if (currentUser != null) return const Right(true);
    if (await isInConnection()) {
      try {
        final user = kIsWeb ? await remoteDatasource.webSignIn() : await remoteDatasource.signIn();
        if (user != null) {
          return const Right(true);
        } else {
          return const Left(
            Failure(
              'Login failed',
            ),
          );
        }
      } catch (e, _) {
        debugPrint(e.toString());
        return Left(Failure(e.toString()));
      }
    }
    return const Left(NoConnection());
  }

  @override
  Future<Either<Failure, bool>> signOut() async {
    if (await isInConnection()) {
      try {
        await remoteDatasource.signOut();
        return const Right(true);
      } catch (e, _) {
        debugPrint(e.toString());
        return Left(Failure(e.toString()));
      }
    }
    return const Left(NoConnection());
  }

  @override
  Either<Failure, bool> needLogin() {
    final user = remoteDatasource.getCurrentUser();
    if (user == null) return const Right(true);
    return const Right(false);
  }

  @override
  Either<Failure, User> getCurrentUser() {
    final user = remoteDatasource.getCurrentUser();
    if (user != null) return Right(user);
    return const Left(Failure('Not found'));
  }
}
