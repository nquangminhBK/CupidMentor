import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cupid_mentor/core/errors/failure.dart';
import 'package:cupid_mentor/core/utils/mixin/connectivity_mixin.dart';
import 'package:cupid_mentor/features/tips_replying/data/data_sources/tip_replying_datasource.dart';
import 'package:cupid_mentor/features/tips_replying/domain/repository/tip_replying_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class TipsReplyingRepositoryImpl with ConnectivityMixin implements TipsReplyingRepository {
  final TipsReplyingDatasource datasource;

  const TipsReplyingRepositoryImpl({required this.datasource, required this.connectivity});

  @override
  final Connectivity connectivity;

  @override
  Future<Either<Failure, bool>> addMessage({required types.Message message}) async {
    if (await isInConnection()) {
      try {
        final result = await datasource.addMessage(
          message: message,
        );

        return Right(result);
      } catch (e, _) {
        debugPrint(e.toString());
        return Left(Failure(e.toString()));
      }
    }
    return const Left(NoConnection());
  }

  @override
  Future<Either<Failure, List<types.Message>>> getMessage({required String lastMsgId}) async {
    if (await isInConnection()) {
      try {
        final result = await datasource.getMessages(lastMsgId: lastMsgId);

        return Right(result);
      } catch (e, _) {
        debugPrint(e.toString());
        return Left(Failure(e.toString()));
      }
    }
    return const Left(NoConnection());
  }
}
