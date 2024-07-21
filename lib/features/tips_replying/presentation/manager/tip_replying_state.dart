import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tip_replying_state.freezed.dart';

@freezed
abstract class TipsReplyingState with _$TipsReplyingState {
  const TipsReplyingState._();

  const factory TipsReplyingState({
    required List<Message> content,
    bool? loading,
    String? error,
  }) = _TipsReplyingState;

  factory TipsReplyingState.initial() => const TipsReplyingState(content: []);
}
