import 'package:cupid_mentor/core/errors/failure.dart';
import 'package:cupid_mentor/core/usecases/usecase.dart';
import 'package:cupid_mentor/features/auth/domain/repositories/authentication_repository.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase implements UseCase<bool, NoParams> {
  final AuthenticationRepository repository;

  const LoginUseCase({required this.repository});

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await repository.signIn();
  }
}
