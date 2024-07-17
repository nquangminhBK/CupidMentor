import 'package:cupid_mentor/core/core_entity/content_response.dart';
import 'package:cupid_mentor/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class TipsDateSpotRepository {
  Future<Either<Failure, bool>> addTipsDateSpot({
    required String occasionId,
    required ContentResponse content,
  });

  Future<Either<Failure, List<ContentResponse>>> getListTipsDateSpot({required String occasionId});
}
