import 'package:cupid_mentor/core/errors/api_failure.dart';
import 'package:cupid_mentor/core/usecases/usecase.dart';
import 'package:cupid_mentor/features/tips_gift/domain/repository/tips_gift_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

final deleteTipsGiftUseCaseProvider = Provider<DeleteTipsGift>((ref) {
  return GetIt.I<DeleteTipsGift>();
});

class DeleteTipsGift implements UseCase<bool, DeleteTipsGiftParam> {
  final TipsGiftRepository repository;

  const DeleteTipsGift({required this.repository});

  @override
  Future<Either<Failure, bool>> call(DeleteTipsGiftParam params) async {
    return await repository.deleteTipGift(
      occasionId: params.occasionId,
      contentId: params.contentId,
    );
  }
}

class DeleteTipsGiftParam {
  final String occasionId;
  final String contentId;

  const DeleteTipsGiftParam({required this.occasionId, required this.contentId});
}
