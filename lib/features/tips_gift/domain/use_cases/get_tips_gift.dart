import 'package:cupid_mentor/core/core_entity/content_response.dart';
import 'package:cupid_mentor/core/errors/failure.dart';
import 'package:cupid_mentor/core/usecases/usecase.dart';
import 'package:cupid_mentor/features/tips_gift/domain/repository/tips_gift_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

final getTipsGiftUseCaseProvider = Provider<GetTipsGift>((ref) {
  return GetIt.I<GetTipsGift>();
});

class GetTipsGift implements UseCase<List<ContentResponse>, GetTipsGiftParam> {
  final TipsGiftRepository repository;

  const GetTipsGift({required this.repository});

  @override
  Future<Either<Failure, List<ContentResponse>>> call(GetTipsGiftParam params) async {
    return await repository.getListTipsGift(occasionId: params.occasionId);
  }
}

class GetTipsGiftParam {
  final String occasionId;

  const GetTipsGiftParam({required this.occasionId});
}
