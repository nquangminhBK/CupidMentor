import 'package:cupid_mentor/core/constants/localization_const.dart';
import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/navigation/navigation_service.dart';
import 'package:cupid_mentor/core/utils/loading_utils.dart';
import 'package:cupid_mentor/core/widgets/dialog_confirm.dart';
import 'package:cupid_mentor/core/widgets/my_app_bar.dart';
import 'package:cupid_mentor/features/localization/presentation/manager/localization_notifier.dart';
import 'package:cupid_mentor/features/tips_replying/presentation/manager/tip_replying_notifier.dart';
import 'package:cupid_mentor/features/tips_replying/presentation/widgets/chat_l10n.dart';
import 'package:cupid_mentor/features/tips_replying/presentation/widgets/chat_theme.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:open_filex/open_filex.dart';

class TipsReplyingMessageScreen extends ConsumerStatefulWidget {
  const TipsReplyingMessageScreen({super.key});

  @override
  ConsumerState<TipsReplyingMessageScreen> createState() => _TipsReplyingMessageScreenState();
}

class _TipsReplyingMessageScreenState extends ConsumerState<TipsReplyingMessageScreen> {
  final _user = const types.User(
    id: 'you',
  );

  @override
  void initState() {
    super.initState();
    ref.read(tipsReplyingNotifierProvider.notifier).loadFirstPage();
  }

  // void _handleAttachmentPressed() {
  //   showModalBottomSheet<void>(
  //     context: context,
  //     builder: (BuildContext context) => SafeArea(
  //       child: SizedBox(
  //         height: 144,
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.stretch,
  //           children: <Widget>[
  //             TextButton(
  //               onPressed: () {
  //                 Navigator.pop(context);
  //                 _handleImageSelection();
  //               },
  //               child: const Align(
  //                 alignment: AlignmentDirectional.centerStart,
  //                 child: Text('Photo'),
  //               ),
  //             ),
  //             TextButton(
  //               onPressed: () {
  //                 Navigator.pop(context);
  //                 _handleFileSelection();
  //               },
  //               child: const Align(
  //                 alignment: AlignmentDirectional.centerStart,
  //                 child: Text('File'),
  //               ),
  //             ),
  //             TextButton(
  //               onPressed: () => Navigator.pop(context),
  //               child: const Align(
  //                 alignment: AlignmentDirectional.centerStart,
  //                 child: Text('Cancel'),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // void _handleFileSelection() async {
  //   final result = await FilePicker.platform.pickFiles(
  //     type: FileType.any,
  //   );
  //
  //   if (result != null && result.files.single.path != null) {
  //     final message = types.FileMessage(
  //       author: _user,
  //       createdAt: DateTime.now().millisecondsSinceEpoch,
  //       id: const Uuid().v4(),
  //       mimeType: lookupMimeType(result.files.single.path!),
  //       name: result.files.single.name,
  //       size: result.files.single.size,
  //       uri: result.files.single.path!,
  //     );
  //
  //     _addMessage(message);
  //   }
  // }
  //
  // void _handleImageSelection() async {
  //   final result = await ImagePicker().pickImage(
  //     imageQuality: 70,
  //     maxWidth: 1440,
  //     source: ImageSource.gallery,
  //   );
  //
  //   if (result != null) {
  //     final bytes = await result.readAsBytes();
  //     final image = await decodeImageFromList(bytes);
  //
  //     final message = types.ImageMessage(
  //       author: _user,
  //       createdAt: DateTime.now().millisecondsSinceEpoch,
  //       height: image.height.toDouble(),
  //       id: const Uuid().v4(),
  //       name: result.name,
  //       size: bytes.length,
  //       uri: result.path,
  //       width: image.width.toDouble(),
  //     );
  //
  //     _addMessage(message);
  //   }
  // }

  Future<void> _handleMessageTap(BuildContext _, types.Message message) async {
    if (message is types.FileMessage) {
      var localPath = message.uri;

      if (message.uri.startsWith('http')) {}

      await OpenFilex.open(localPath);
    }
  }

  // void _handlePreviewDataFetched(
  //   types.TextMessage message,
  //   types.PreviewData previewData,
  // ) {
  //   final index = _messages.indexWhere((element) => element.id == message.id);
  //   final updatedMessage = (_messages[index] as types.TextMessage).copyWith(
  //     previewData: previewData,
  //   );
  //
  //   setState(() {
  //     _messages[index] = updatedMessage;
  //   });
  // }

  Future<void> _handleSendPressed(types.PartialText message) async {
    await ref.read(tipsReplyingNotifierProvider.notifier).generateAiContent(message.text, context);
  }

  @override
  Widget build(BuildContext context) {
    final currentLanguage = ref.read(localizationNotifierProvider).lang;
    final messages = ref.watch(tipsReplyingNotifierProvider).content;
    ref.listen(tipsReplyingNotifierProvider, (previous, next) {
      if (previous?.loading != next.loading && next.loading == true) {
        LoadingUtils.showLoading(message: context.l10n.generating);
      } else {
        LoadingUtils.hideLoading();
      }
    });
    return Container(
      color: context.theme.scaffoldBackgroundColor,
      child: Scaffold(
        appBar: MyAppBar.myAppBar(
          title: context.l10n.tipsReplyingTitle,
          ref: ref,
          context: context,
          actionButton: {
            Icons.delete_outline_rounded: () {
              showDialog(
                context: context,
                builder: (context) {
                  return DialogConfirm(
                    onPositiveButtonExecute: () {
                      ref.read(tipsReplyingNotifierProvider.notifier).deleteMessage();
                      NavigationService.instance.pop();
                    },
                    message: 'Are you sure you want to delete this conversation?',
                    titlePositiveButton: 'Yes',
                    title: 'Dialog Confirmation',
                    icon: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: ref.currentAppColor.buttonBackgroundColor,
                      ),
                      child: const Icon(
                        Icons.delete_outline_rounded,
                        color: Colors.red,
                        size: 30,
                      ),
                    ),
                  );
                },
              );
            },
          },
        ),
        body: Chat(
          theme: ref.currentTheme == ThemeMode.light ? cupidMentorLightColor : cupidMentorDarkColor,
          l10n: currentLanguage == LocalizationEnum.vietnamese
              ? const ChatL10nVi()
              : (currentLanguage == LocalizationEnum.japanese
                  ? const ChatL10nJa()
                  : const ChatL10nEn()),
          messages: messages,
          onAttachmentPressed: null,
          onMessageTap: _handleMessageTap,
          onSendPressed: _handleSendPressed,
          onEndReached: () async {
            await ref.read(tipsReplyingNotifierProvider.notifier).loadNextPage();
          },
          showUserAvatars: false,
          user: _user,
          textMessageBuilder: (message, {required messageWidth, required showName}) {
            if (message.author.id == 'you') {
              return TextMessage(
                emojiEnlargementBehavior: EmojiEnlargementBehavior.multi,
                hideBackgroundOnEmojiMessages: true,
                message: message,
                showName: false,
                usePreviewData: true,
              );
            }
            return Markdown(
              data: message.text,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              selectable: true,
              styleSheet: MarkdownStyleSheet.fromTheme(context.theme),
            );
          },
        ),
      ),
    );
  }
}
