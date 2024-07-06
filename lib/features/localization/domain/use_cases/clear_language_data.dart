import 'package:cupid_mentor/core/errors/failure.dart';
import 'package:cupid_mentor/core/usecases/usecase.dart';
import 'package:cupid_mentor/features/localization/domain/repository/localization_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

final clearLanguageDataUseCaseProvider = Provider<ClearLanguageData>((ref) {
  return GetIt.I<ClearLanguageData>();
});

class ClearLanguageData implements UseCase<bool, NoParams> {
  final LocalizationRepository repository;

  const ClearLanguageData({required this.repository});

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await repository.clearLanguageData();
  }
}
