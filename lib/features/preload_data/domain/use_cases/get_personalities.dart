import 'package:cupid_mentor/core/core_object/localization_content.dart';
import 'package:cupid_mentor/core/errors/api_failure.dart';
import 'package:cupid_mentor/core/usecases/usecase.dart';
import 'package:cupid_mentor/features/preload_data/domain/repositories/preload_data_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

final getPersonalitiesProvider = Provider<GetPersonalities>((ref) {
  return GetIt.I<GetPersonalities>();
});

class GetPersonalities implements UseCase<List<LocalizationContent>, NoParams> {
  final PreloadDataRepository repository;

  const GetPersonalities({required this.repository});

  @override
  Future<Either<Failure, List<LocalizationContent>>> call(NoParams params) async {
    return await repository.getPersonalities();
  }
}
