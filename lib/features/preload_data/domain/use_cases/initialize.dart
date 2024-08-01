import 'package:cupid_mentor/core/errors/api_failure.dart';
import 'package:cupid_mentor/core/usecases/usecase.dart';
import 'package:cupid_mentor/features/preload_data/domain/repositories/preload_data_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

final initializeRemoteConfigProvider = Provider<InitializeRemoteConfig>((ref) {
  return GetIt.I<InitializeRemoteConfig>();
});

class InitializeRemoteConfig implements UseCase<void, NoParams> {
  final PreloadDataRepository repository;

  const InitializeRemoteConfig({required this.repository});

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await repository.initializeRemoteConfig();
  }
}
