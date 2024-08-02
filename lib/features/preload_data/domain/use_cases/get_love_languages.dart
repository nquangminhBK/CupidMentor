import 'package:cupid_mentor/core/errors/api_failure.dart';
import 'package:cupid_mentor/core/usecases/usecase.dart';
import 'package:cupid_mentor/features/preload_data/domain/entities/content_with_description.dart';
import 'package:cupid_mentor/features/preload_data/domain/repositories/preload_data_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

final getLoveLanguagesProvider = Provider<GetLoveLanguages>((ref) {
  return GetIt.I<GetLoveLanguages>();
});

class GetLoveLanguages implements UseCase<List<ContentWithDescription>, NoParams> {
  final PreloadDataRepository repository;

  const GetLoveLanguages({required this.repository});

  @override
  Future<Either<Failure, List<ContentWithDescription>>> call(NoParams params) async {
    return await repository.getLoveLanguages();
  }
}
