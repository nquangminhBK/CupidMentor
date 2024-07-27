import 'package:cupid_mentor/core/core_entity/content_response.dart';
import 'package:cupid_mentor/core/errors/api_failure.dart';
import 'package:cupid_mentor/core/usecases/usecase.dart';
import 'package:cupid_mentor/features/tip_date_spots/domain/repository/tip_date_spot_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

final addTipsDateSpotUseCaseProvider = Provider<AddTipsDateSpot>((ref) {
  return GetIt.I<AddTipsDateSpot>();
});

class AddTipsDateSpot implements UseCase<bool, AddTipsDateSpotParam> {
  final TipsDateSpotRepository repository;

  const AddTipsDateSpot({required this.repository});

  @override
  Future<Either<Failure, bool>> call(AddTipsDateSpotParam params) async {
    return await repository.addTipsDateSpot(occasionId: params.occasionId, content: params.content);
  }
}

class AddTipsDateSpotParam {
  final String occasionId;
  final ContentResponse content;

  const AddTipsDateSpotParam({required this.occasionId, required this.content});
}
