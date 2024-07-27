import 'package:cupid_mentor/core/core_entity/content_response.dart';
import 'package:cupid_mentor/core/errors/api_failure.dart';
import 'package:cupid_mentor/core/usecases/usecase.dart';
import 'package:cupid_mentor/features/tip_date_spots/domain/repository/tip_date_spot_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

final getTipsDateSpotUseCaseProvider = Provider<GetTipsDateSpot>((ref) {
  return GetIt.I<GetTipsDateSpot>();
});

class GetTipsDateSpot implements UseCase<List<ContentResponse>, GetTipsDateSpotParam> {
  final TipsDateSpotRepository repository;

  const GetTipsDateSpot({required this.repository});

  @override
  Future<Either<Failure, List<ContentResponse>>> call(GetTipsDateSpotParam params) async {
    return await repository.getListTipsDateSpot(occasionId: params.occasionId);
  }
}

class GetTipsDateSpotParam {
  final String occasionId;

  const GetTipsDateSpotParam({required this.occasionId});
}
