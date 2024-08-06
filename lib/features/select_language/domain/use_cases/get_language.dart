import 'package:cupid_mentor/core/constants/localization_const.dart';
import 'package:cupid_mentor/core/errors/api_failure.dart';
import 'package:cupid_mentor/core/usecases/usecase.dart';
import 'package:cupid_mentor/features/select_language/domain/repository/localization_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

final getLanguageUseCaseProvider = Provider<GetLanguage>((ref) {
  return GetIt.I<GetLanguage>();
});

class GetLanguage implements UseCase<LocalizationEnum?, NoParams> {
  final LocalizationRepository repository;

  const GetLanguage({required this.repository});

  @override
  Future<Either<Failure, LocalizationEnum?>> call(NoParams params) async {
    return await repository.getLanguage();
  }
}
