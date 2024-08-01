import 'package:cupid_mentor/core/core_object/localization_content.dart';
import 'package:cupid_mentor/core/errors/api_failure.dart';
import 'package:cupid_mentor/core/usecases/usecase.dart';
import 'package:cupid_mentor/features/preload_data/domain/repositories/preload_data_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

final getHobbiesProvider = Provider<GetHobbies>((ref) {
  return GetIt.I<GetHobbies>();
});

class GetHobbies implements UseCase<List<LocalizationContent>, NoParams> {
  final PreloadDataRepository repository;

  const GetHobbies({required this.repository});

  @override
  Future<Either<Failure, List<LocalizationContent>>> call(NoParams params) async {
    return await repository.getHobbies();
  }
}
