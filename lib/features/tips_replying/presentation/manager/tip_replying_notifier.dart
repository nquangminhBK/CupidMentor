import 'dart:async';

import 'package:cupid_mentor/core/core_use_cases/generate_ai_content.dart';
import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/usecases/usecase.dart';
import 'package:cupid_mentor/core/utils/generate_ai_context.dart';
import 'package:cupid_mentor/features/setting/domain/use_cases/get_user_info.dart';
import 'package:cupid_mentor/features/tips_replying/domain/use_cases/add_message.dart';
import 'package:cupid_mentor/features/tips_replying/domain/use_cases/get_message.dart';
import 'package:cupid_mentor/features/tips_replying/presentation/manager/tip_replying_state.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
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

  Future<void> loadFirstPage() async {
    await _loadMessage(lastMsgId: '');
  }

  Future<void> loadNextPage() async {
    final lastMsgId = state.content.last.id;
    debugPrint("minh check $lastMsgId");
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
    state = state.copyWith(content: [
      message,
      ...currentMsg,
    ]);
    unawaited(addTipsReplying(AddTipsReplyingParam(message: message)));
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
      final aiMDText =
          (await generateAIContent(GenerateAIContentParam(contents: [Content.text(aiContent)])))
              .getOrElse(() => '');
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
          state = state.copyWith(error: context.l10n.generateFailed);
        }
      }
    }
  }
}
