import 'package:cupid_mentor/core/core_entity/content_response.dart';
import 'package:cupid_mentor/core/errors/api_failure.dart';
import 'package:dartz/dartz.dart';

abstract class TipsSelfImprovementRepository {
  Future<Either<Failure, bool>> addTipsSelfImprovement({
    required String selfImprovementId,
    required ContentResponse content,
  });

  Future<Either<Failure, bool>> deleteTipsSelfImprovement({
    required String selfImprovementId,
    required String contentId,
  });

  Future<Either<Failure, List<ContentResponse>>> getListTipsSelfImprovement({
    required String selfImprovementId,
  });
}
