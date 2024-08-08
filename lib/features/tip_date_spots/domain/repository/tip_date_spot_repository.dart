import 'package:cupid_mentor/core/core_entity/content_response.dart';
import 'package:cupid_mentor/core/errors/api_failure.dart';
import 'package:dartz/dartz.dart';

abstract class TipsDateSpotRepository {
  Future<Either<Failure, bool>> addTipsDateSpot({
    required String occasionId,
    required ContentResponse content,
  });

  Future<Either<Failure, bool>> deleteTipDateSpot({
    required String occasionId,
    required String contentId,
  });

  Future<Either<Failure, List<ContentResponse>>> getListTipsDateSpot({required String occasionId});
}
