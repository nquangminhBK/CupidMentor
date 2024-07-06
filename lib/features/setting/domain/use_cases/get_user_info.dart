import 'package:cupid_mentor/core/errors/failure.dart';
import 'package:cupid_mentor/core/usecases/usecase.dart';
import 'package:cupid_mentor/features/auth/domain/entities/user_info.dart';
import 'package:cupid_mentor/features/auth/domain/repositories/authentication_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

final getUserInfoUseCaseProvider = Provider<GetUserInfo>((ref) {
  return GetIt.I<GetUserInfo>();
});

class GetUserInfo implements UseCase<LoggedInUserInfo?, NoParams> {
  final AuthenticationRepository repository;

  const GetUserInfo({required this.repository});

  @override
  Future<Either<Failure, LoggedInUserInfo?>> call(NoParams params) async {
    return await repository.getUserInfo();
  }
}
