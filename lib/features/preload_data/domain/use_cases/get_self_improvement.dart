import 'package:cupid_mentor/core/core_object/localization_content.dart';
import 'package:cupid_mentor/core/errors/api_failure.dart';
import 'package:cupid_mentor/core/usecases/usecase.dart';
import 'package:cupid_mentor/features/preload_data/domain/entities/content_with_description.dart';
import 'package:cupid_mentor/features/preload_data/domain/entities/content_with_image.dart';
import 'package:cupid_mentor/features/preload_data/domain/entities/self_improvement_entity.dart';
import 'package:cupid_mentor/features/preload_data/domain/repositories/preload_data_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

final getSelfImprovementsProvider = Provider<GetSelfImprovements>((ref) {
  return GetIt.I<GetSelfImprovements>();
});

class GetSelfImprovements implements UseCase<List<SelfImprovementEntity>, NoParams> {
  final PreloadDataRepository repository;

  const GetSelfImprovements({required this.repository});

  @override
  Future<Either<Failure, List<SelfImprovementEntity>>> call(NoParams params) {
    return repository.getSelfImprovements();
  }
}
