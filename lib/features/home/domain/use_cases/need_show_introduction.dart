import 'package:cupid_mentor/core/errors/api_failure.dart';
import 'package:cupid_mentor/core/usecases/usecase.dart';
import 'package:cupid_mentor/features/home/domain/repository/home_repositories.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

final checkNeedShowIntroductionUseCaseProvider = Provider<CheckNeedShowIntroduction>((ref) {
  return GetIt.I<CheckNeedShowIntroduction>();
});

class CheckNeedShowIntroduction implements UseCase<bool, NoParams> {
  final HomeRepositories repository;

  const CheckNeedShowIntroduction({required this.repository});

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return repository.needShowIntroduction();
  }
}
