import 'package:cupid_mentor/core/core_entity/content_response.dart';
import 'package:cupid_mentor/core/errors/api_failure.dart';
import 'package:cupid_mentor/core/usecases/usecase.dart';
import 'package:cupid_mentor/features/tips_self_improvement/domain/repository/tips_self_improvement_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

final addTipsSelfImprovementUseCaseProvider = Provider<AddTipsSelfImprovement>((ref) {
  return GetIt.I<AddTipsSelfImprovement>();
});

class AddTipsSelfImprovement implements UseCase<bool, AddTipsSelfImprovementParam> {
  final TipsSelfImprovementRepository repository;

  const AddTipsSelfImprovement({required this.repository});

  @override
  Future<Either<Failure, bool>> call(AddTipsSelfImprovementParam params) async {
    return await repository.addTipsSelfImprovement(
      selfImprovementId: params.selfImprovementId,
      content: params.content,
    );
  }
}

class AddTipsSelfImprovementParam {
  final String selfImprovementId;
  final ContentResponse content;

  const AddTipsSelfImprovementParam({required this.selfImprovementId, required this.content});
}
