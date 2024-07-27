import 'package:cupid_mentor/core/errors/api_failure.dart';
import 'package:cupid_mentor/core/usecases/usecase.dart';
import 'package:cupid_mentor/features/tips_replying/domain/repository/tip_replying_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

final getTipsReplyingUseCaseProvider = Provider<GetTipsReplying>((ref) {
  return GetIt.I<GetTipsReplying>();
});

class GetTipsReplying implements UseCase<List<types.Message>, GetTipsReplyingParam> {
  final TipsReplyingRepository repository;

  const GetTipsReplying({required this.repository});

  @override
  Future<Either<Failure, List<types.Message>>> call(GetTipsReplyingParam params) async {
    return await repository.getMessage(lastMsgId: params.lastMsgId);
  }
}

class GetTipsReplyingParam {
  final String lastMsgId;

  const GetTipsReplyingParam({
    required this.lastMsgId,
  });
}
