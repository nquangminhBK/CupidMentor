import 'package:cupid_mentor/core/constants/localization_const.dart';
import 'package:cupid_mentor/core/errors/api_failure.dart';
import 'package:cupid_mentor/core/usecases/usecase.dart';
import 'package:cupid_mentor/features/select_language/domain/repository/localization_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

final setLanguageUseCaseProvider = Provider<SetLanguage>((ref) {
  return GetIt.I<SetLanguage>();
});

class SetLanguage implements UseCase<bool, SetLanguageParam> {
  final LocalizationRepository repository;

  const SetLanguage({required this.repository});

  @override
  Future<Either<Failure, bool>> call(SetLanguageParam params) async {
    return await repository.setLanguage(params.lang);
  }
}

class SetLanguageParam {
  final LocalizationEnum lang;

  const SetLanguageParam({required this.lang});
}
