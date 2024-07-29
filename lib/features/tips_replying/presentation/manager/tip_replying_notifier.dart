import 'dart:async';

import 'package:cupid_mentor/core/core_use_cases/generate_ai_content.dart';
import 'package:cupid_mentor/core/errors/ui_failures.dart';
import 'package:cupid_mentor/core/usecases/usecase.dart';
import 'package:cupid_mentor/core/utils/generate_ai_context.dart';
import 'package:cupid_mentor/features/setting/domain/use_cases/get_user_info.dart';
import 'package:cupid_mentor/features/tips_replying/domain/use_cases/add_message.dart';
import 'package:cupid_mentor/features/tips_replying/domain/use_cases/delete_conversation.dart';
import 'package:cupid_mentor/features/tips_replying/domain/use_cases/get_message.dart';
import 'package:cupid_mentor/features/tips_replying/presentation/manager/tip_replying_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:firebase_vertexai/firebase_vertexai.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:uuid/uuid.dart';

part 'tip_replying_notifier.g.dart';

@riverpod
class TipsReplyingNotifier extends _$TipsReplyingNotifier {
  @override
  TipsReplyingState build() {
    return TipsReplyingState.initial();
  }

  GetTipsReplying get getTipsReplying => ref.read(getTipsReplyingUseCaseProvider);

  AddTipsReplying get addTipsReplying => ref.read(addTipsReplyingUseCaseProvider);

  GenerateAIContent get generateAIContent => ref.read(generateAIContentUseCaseProvider);

  GetUserInfo get getUserInfo => ref.read(getUserInfoUseCaseProvider);

  DeleteConversation get deleteConversation => ref.read(deleteConversationUseCaseProvider);

  Future<void> loadFirstPage() async {
    await _loadMessage(lastMsgId: '');
  }

  Future<void> loadNextPage() async {
    final lastMsgId = state.content.last.id;
    await _loadMessage(lastMsgId: lastMsgId);
  }

  Future<void> _loadMessage({required String lastMsgId}) async {
    final response = await getTipsReplying(GetTipsReplyingParam(lastMsgId: lastMsgId));
    response.fold((error) {}, (messages) {
      final currentMsg = state.content;
      state = state.copyWith(content: [...currentMsg, ...messages]);
    });
  }

  Future<void> addMessage({required types.Message message}) async {
    final currentMsg = state.content;
    state = state.copyWith(
      content: [
        message,
        ...currentMsg,
      ],
    );
    unawaited(addTipsReplying(AddTipsReplyingParam(message: message)));
  }

  Future<void> deleteMessage() async {
    state = state.copyWith(loading: true);
    final response = await deleteConversation(NoParams());
    response.fold((error) {
      state = state.copyWith(loading: false);
    }, (result) {
      state = state.copyWith(content: [], loading: false);
    });
  }

  Future<void> generateAiContent(
    String message,
    BuildContext context,
  ) async {
    await addMessage(
      message: types.TextMessage(
        author: const types.User(id: 'you'),
        id: (const Uuid()).v4(),
        createdAt: DateTime.now().millisecondsSinceEpoch,
        text: message,
      ),
    );
    final userInfo = (await getUserInfo(NoParams())).getOrElse(() => null);
    if (userInfo != null && context.mounted) {
      final aiContent = AIContext(userInfo: userInfo, context: context).tipsReplying(message);
      debugPrint(aiContent);
      state = state.copyWith(loading: true);
      final aiMDText =
          (await generateAIContent(GenerateAIContentParam(contents: [Content.text(aiContent)])))
              .getOrElse(() => '');
      state = state.copyWith(loading: false);
      if (aiMDText.isNotEmpty) {
        await addMessage(
          message: types.TextMessage(
            author: const types.User(id: 'cupid-mentor'),
            id: (const Uuid()).v4(),
            createdAt: DateTime.now().millisecondsSinceEpoch,
            text: aiMDText,
          ),
        );
      } else {
        if (context.mounted) {
          state = state.copyWith(errorOrSuccess: Left(AIGeneratedFailedError()));
        }
      }
    }
  }
}
