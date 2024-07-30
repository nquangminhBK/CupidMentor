import 'package:flutter_chat_ui/flutter_chat_ui.dart';

class ChatL10nVi extends ChatL10n {
  const ChatL10nVi({
    super.and = 'và',
    super.emptyChatPlaceholder = 'Chưa có tin nhắn nào ở đây',
    super.inputPlaceholder = 'Nhập tin nhắn của đối phương gửi cho bạn',
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
    super.inputPlaceholder = '相手から送られてきたメッセージを入力してください',
    super.isTyping = '入力中...',
    super.others = '他の人',
    super.sendButtonAccessibilityLabel = '送信',
    super.unreadMessagesLabel = '未読メッセージ',
    super.attachmentButtonAccessibilityLabel = 'メディアを送信',
    super.fileButtonAccessibilityLabel = 'ファイル',
  });
}

class ChatL10nEnOverride extends ChatL10n {
  const ChatL10nEnOverride({
    super.and = 'and',
    super.attachmentButtonAccessibilityLabel = 'Send media',
    super.emptyChatPlaceholder = 'No messages here yet',
    super.fileButtonAccessibilityLabel = 'File',
    super.inputPlaceholder = 'Enter the message your partner sent you',
    super.isTyping = 'is typing...',
    super.others = 'others',
    super.sendButtonAccessibilityLabel = 'Send',
    super.unreadMessagesLabel = 'Unread messages',
  });
}
