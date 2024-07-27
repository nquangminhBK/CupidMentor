import 'package:cupid_mentor/core/errors/api_failure.dart';
import 'package:cupid_mentor/core/usecases/usecase.dart';
import 'package:cupid_mentor/features/auth/domain/repositories/authentication_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

final getCurrentUserUseCaseProvider = Provider<GetCurrentUser>((ref) {
  return GetIt.I<GetCurrentUser>();
});

class GetCurrentUser implements UseCase<User, NoParams> {
  final AuthenticationRepository repository;

  const GetCurrentUser({required this.repository});

  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return repository.getCurrentUser();
  }
}
