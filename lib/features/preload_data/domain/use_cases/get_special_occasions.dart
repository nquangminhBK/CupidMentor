import 'package:cupid_mentor/core/errors/api_failure.dart';
import 'package:cupid_mentor/core/usecases/usecase.dart';
import 'package:cupid_mentor/features/preload_data/domain/entities/content_with_image.dart';
import 'package:cupid_mentor/features/preload_data/domain/repositories/preload_data_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

final getSpecialOccasionsProvider = Provider<GetSpecialOccasions>((ref) {
  return GetIt.I<GetSpecialOccasions>();
});

class GetSpecialOccasions implements UseCase<List<ContentWithImage>, NoParams> {
  final PreloadDataRepository repository;

  const GetSpecialOccasions({required this.repository});

  @override
  Future<Either<Failure, List<ContentWithImage>>> call(NoParams params) async {
    return await repository.getSpecialOccasions();
  }
}
