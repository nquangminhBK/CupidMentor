import 'package:cupid_mentor/core/errors/api_failure.dart';
import 'package:cupid_mentor/core/usecases/usecase.dart';
import 'package:cupid_mentor/features/splash_screen/domain/repositories/splash_repositories.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

final updateShowCaseUseCaseProvider = Provider<UpdateShowCase>((ref) {
  return GetIt.I<UpdateShowCase>();
});

class UpdateShowCase implements UseCase<bool, NoParams> {
  final SplashRepositories repository;

  const UpdateShowCase({required this.repository});

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return repository.updateShowCase();
  }
}
