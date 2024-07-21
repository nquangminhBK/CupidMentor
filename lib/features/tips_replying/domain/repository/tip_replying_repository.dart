import 'package:cupid_mentor/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

abstract class TipsReplyingRepository {
  Future<Either<Failure, List<types.Message>>> getMessage({required String lastMsgId});

  Future<Either<Failure, bool>> addMessage({required types.Message message});

  Future<Either<Failure, bool>> deleteConversation();
}
