import 'package:flutter_chat_ui/flutter_chat_ui.dart';

class ChatL10nVi extends ChatL10n {
  const ChatL10nVi({
    super.and = 'và',
    super.emptyChatPlaceholder = 'Chưa có tin nhắn nào ở đây',
    super.inputPlaceholder = 'Tin nhắn',
    super.isTyping = 'đang nhập...',
    super.others = 'người khác',
    super.sendButtonAccessibilityLabel = 'Gửi',
    super.unreadMessagesLabel = 'Tin nhắn chưa đọc',
    super.attachmentButtonAccessibilityLabel = 'Gửi media',
    super.fileButtonAccessibilityLabel = 'File',
  });
}

class ChatL10nJa extends ChatL10n {
  const ChatL10nJa({
    super.and = 'と',
    super.emptyChatPlaceholder = 'まだメッセージがありません',
    super.inputPlaceholder = 'メッセージ',
    super.isTyping = '入力中...',
    super.others = '他の人',
    super.sendButtonAccessibilityLabel = '送信',
    super.unreadMessagesLabel = '未読メッセージ',
    super.attachmentButtonAccessibilityLabel = 'メディアを送信',
    super.fileButtonAccessibilityLabel = 'ファイル',
  });
}
