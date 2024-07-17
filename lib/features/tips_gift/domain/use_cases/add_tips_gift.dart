import 'package:cupid_mentor/core/core_entity/content_response.dart';
import 'package:cupid_mentor/core/errors/failure.dart';
import 'package:cupid_mentor/core/usecases/usecase.dart';
import 'package:cupid_mentor/features/tips_gift/domain/repository/tips_gift_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

final addTipsGiftUseCaseProvider = Provider<AddTipsGift>((ref) {
  return GetIt.I<AddTipsGift>();
});

class AddTipsGift implements UseCase<bool, AddTipsGiftParam> {
  final TipsGiftRepository repository;

  const AddTipsGift({required this.repository});

  @override
  Future<Either<Failure, bool>> call(AddTipsGiftParam params) async {
    return await repository.addTipsGift(occasionId: params.occasionId, content: params.content);
  }
}

class AddTipsGiftParam {
  final String occasionId;
  final ContentResponse content;

  const AddTipsGiftParam({required this.occasionId, required this.content});
}
