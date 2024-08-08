import 'package:cupid_mentor/core/errors/api_failure.dart';
import 'package:cupid_mentor/core/usecases/usecase.dart';
import 'package:cupid_mentor/features/tips_self_improvement/domain/repository/tips_self_improvement_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

final deleteTipsSelfImprovementUseCaseProvider = Provider<DeleteTipsSelfImprovement>((ref) {
  return GetIt.I<DeleteTipsSelfImprovement>();
});

class DeleteTipsSelfImprovement implements UseCase<bool, DeleteTipsSelfImprovementParam> {
  final TipsSelfImprovementRepository repository;

  const DeleteTipsSelfImprovement({required this.repository});

  @override
  Future<Either<Failure, bool>> call(DeleteTipsSelfImprovementParam params) async {
    return await repository.deleteTipsSelfImprovement(
        selfImprovementId: params.selfImprovementId, contentId: params.contentId,);
  }
}

class DeleteTipsSelfImprovementParam {
  final String selfImprovementId;
  final String contentId;

  const DeleteTipsSelfImprovementParam({required this.selfImprovementId, required this.contentId});
}
