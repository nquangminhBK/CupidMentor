import 'package:cupid_mentor/core/errors/api_failure.dart';
import 'package:cupid_mentor/core/usecases/usecase.dart';
import 'package:cupid_mentor/features/tips_replying/domain/repository/tip_replying_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:get_it/get_it.dart';
import 'package:riverpod/riverpod.dart';

final addTipsReplyingUseCaseProvider = Provider<AddTipsReplying>((ref) {
  return GetIt.I<AddTipsReplying>();
});

class AddTipsReplying implements UseCase<bool, AddTipsReplyingParam> {
  final TipsReplyingRepository repository;

  const AddTipsReplying({required this.repository});

  @override
  Future<Either<Failure, bool>> call(AddTipsReplyingParam params) async {
    return await repository.addMessage(message: params.message);
  }
}

class AddTipsReplyingParam {
  final types.Message message;

  const AddTipsReplyingParam({
    required this.message,
  });
}
