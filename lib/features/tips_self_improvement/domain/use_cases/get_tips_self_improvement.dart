import 'package:cupid_mentor/core/core_entity/content_response.dart';
import 'package:cupid_mentor/core/errors/api_failure.dart';
import 'package:cupid_mentor/core/usecases/usecase.dart';
import 'package:cupid_mentor/features/tips_self_improvement/domain/repository/tips_self_improvement_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

final getTipsSelfImprovementUseCaseProvider = Provider<GetTipsSelfImprovement>((ref) {
  return GetIt.I<GetTipsSelfImprovement>();
});

class GetTipsSelfImprovement
    implements UseCase<List<ContentResponse>, GetTipsSelfImprovementParam> {
  final TipsSelfImprovementRepository repository;

  const GetTipsSelfImprovement({required this.repository});

  @override
  Future<Either<Failure, List<ContentResponse>>> call(GetTipsSelfImprovementParam params) async {
    return await repository.getListTipsSelfImprovement(selfImprovementId: params.selfImprovementId);
  }
}

class GetTipsSelfImprovementParam {
  final String selfImprovementId;

  const GetTipsSelfImprovementParam({required this.selfImprovementId});
}
