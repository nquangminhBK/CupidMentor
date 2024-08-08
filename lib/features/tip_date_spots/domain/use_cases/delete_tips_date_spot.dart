import 'package:cupid_mentor/core/errors/api_failure.dart';
import 'package:cupid_mentor/core/usecases/usecase.dart';
import 'package:cupid_mentor/features/tip_date_spots/domain/repository/tip_date_spot_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

final deleteTipsDateSpotUseCaseProvider = Provider<DeleteTipsDateSpot>((ref) {
  return GetIt.I<DeleteTipsDateSpot>();
});

class DeleteTipsDateSpot implements UseCase<bool, DeleteTipsDateSpotParam> {
  final TipsDateSpotRepository repository;

  const DeleteTipsDateSpot({required this.repository});

  @override
  Future<Either<Failure, bool>> call(DeleteTipsDateSpotParam params) async {
    return await repository.deleteTipDateSpot(
        occasionId: params.occasionId, contentId: params.contentId,);
  }
}

class DeleteTipsDateSpotParam {
  final String occasionId;
  final String contentId;

  const DeleteTipsDateSpotParam({required this.occasionId, required this.contentId});
}
