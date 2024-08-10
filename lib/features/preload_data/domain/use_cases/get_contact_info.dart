import 'package:cupid_mentor/core/errors/api_failure.dart';
import 'package:cupid_mentor/core/usecases/usecase.dart';
import 'package:cupid_mentor/features/preload_data/domain/entities/contact_info.dart';
import 'package:cupid_mentor/features/preload_data/domain/repositories/preload_data_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

final getContactInfoProvider = Provider<GetContactInfo>((ref) {
  return GetIt.I<GetContactInfo>();
});

class GetContactInfo implements UseCase<ContactInfo, NoParams> {
  final PreloadDataRepository repository;

  const GetContactInfo({required this.repository});

  @override
  Future<Either<Failure, ContactInfo>> call(NoParams params) async {
    return await repository.getContactInfo();
  }
}
