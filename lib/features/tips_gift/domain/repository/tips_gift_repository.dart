import 'package:cupid_mentor/core/core_entity/content_response.dart';
import 'package:cupid_mentor/core/errors/api_failure.dart';
import 'package:dartz/dartz.dart';

abstract class TipsGiftRepository {
  Future<Either<Failure, bool>> addTipsGift({
    required String occasionId,
    required ContentResponse content,
  });

  Future<Either<Failure, List<ContentResponse>>> getListTipsGift({required String occasionId});
}
