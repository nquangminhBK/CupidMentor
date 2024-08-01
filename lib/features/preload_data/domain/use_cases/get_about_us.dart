import 'package:cupid_mentor/core/core_object/localization_content.dart';
import 'package:cupid_mentor/core/errors/api_failure.dart';
import 'package:cupid_mentor/core/usecases/usecase.dart';
import 'package:cupid_mentor/features/preload_data/domain/repositories/preload_data_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

final getAboutUsProvider = Provider<GetAboutUs>((ref) {
  return GetIt.I<GetAboutUs>();
});

class GetAboutUs implements UseCase<LocalizationContent, NoParams> {
  final PreloadDataRepository repository;

  const GetAboutUs({required this.repository});

  @override
  Future<Either<Failure, LocalizationContent>> call(NoParams params) async {
    return await repository.getAboutUs();
  }
}
