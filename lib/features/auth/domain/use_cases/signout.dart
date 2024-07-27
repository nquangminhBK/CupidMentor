import 'package:cupid_mentor/core/errors/api_failure.dart';
import 'package:cupid_mentor/core/usecases/usecase.dart';
import 'package:cupid_mentor/features/auth/domain/repositories/authentication_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

final logoutUseCaseProvider = Provider<LogoutUseCase>((ref) {
  return GetIt.I<LogoutUseCase>();
});

class LogoutUseCase implements UseCase<bool, NoParams> {
  final AuthenticationRepository repository;

  const LogoutUseCase({required this.repository});

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await repository.signOut();
  }
}
