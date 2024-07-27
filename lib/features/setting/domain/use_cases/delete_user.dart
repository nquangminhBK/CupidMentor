import 'package:cupid_mentor/core/errors/api_failure.dart';
import 'package:cupid_mentor/core/usecases/usecase.dart';
import 'package:cupid_mentor/features/auth/domain/repositories/authentication_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

final deleteUserUseCaseProvider = Provider<DeleteUser>((ref) {
  return GetIt.I<DeleteUser>();
});

class DeleteUser implements UseCase<bool, NoParams> {
  final AuthenticationRepository repository;

  const DeleteUser({required this.repository});

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await repository.deleteUser();
  }
}
