import 'package:cupid_mentor/core/errors/failure.dart';
import 'package:cupid_mentor/core/usecases/usecase.dart';
import 'package:cupid_mentor/features/auth/domain/repositories/authentication_repository.dart';
import 'package:cupid_mentor/features/splash_screen/domain/repositories/splash_repositories.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

final checkNeedOnboardingUseCaseProvider = Provider<CheckNeedOnboarding>((ref) {
  return GetIt.I<CheckNeedOnboarding>();
});

class CheckNeedOnboarding implements UseCase<bool, NoParams> {
  final SplashRepositories repository;

  const CheckNeedOnboarding({required this.repository});

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return repository.needOnboarding();
  }
}
