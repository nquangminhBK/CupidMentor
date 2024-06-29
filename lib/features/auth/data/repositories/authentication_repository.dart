import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cupid_mentor/core/errors/failure.dart';
import 'package:cupid_mentor/core/utils/mixin/connectivity_mixin.dart';
import 'package:cupid_mentor/features/auth/data/datasources/authentication_local_datasource.dart';
import 'package:cupid_mentor/features/auth/data/datasources/authentication_remote_datasource.dart';
import 'package:cupid_mentor/features/auth/domain/entities/crush_info.dart';
import 'package:cupid_mentor/features/auth/domain/repositories/authentication_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
  Future<Either<Failure, CrushInfo>> getCrushInfo() {
// TODO: implement getCrushInfo
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserInfo>> getUserInfo() {
// TODO: implement getUserInfo
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> signIn() async {
    final currentUser = remoteDatasource.getCurrentUser();
    if (currentUser != null) return const Right(true);
    if (await isInConnection()) {
      try {
        final user = await remoteDatasource.signIn();
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
}