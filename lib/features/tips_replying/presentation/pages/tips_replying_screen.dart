import 'package:cupid_mentor/core/constants/localization_const.dart';
import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
 
import 'package:cupid_mentor/core/utils/loading_utils.dart';
import 'package:cupid_mentor/core/utils/mixin/after_layout_mixin.dart';
import 'package:cupid_mentor/core/utils/snackbar_service.dart';
import 'package:cupid_mentor/core/widgets/dialog_confirm.dart';
import 'package:cupid_mentor/core/widgets/my_app_bar.dart';
import 'package:cupid_mentor/features/select_language/presentation/manager/localization_notifier.dart';
import 'package:cupid_mentor/features/tips_replying/presentation/manager/tip_replying_notifier.dart';
import 'package:cupid_mentor/features/tips_replying/presentation/widgets/chat_l10n.dart';
import 'package:cupid_mentor/features/tips_replying/presentation/widgets/chat_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TipsReplyingMessageScreen extends ConsumerStatefulWidget {
  const TipsReplyingMessageScreen({super.key});

  @override
  ConsumerState<TipsReplyingMessageScreen> createState() => _TipsReplyingMessageScreenState();
}

class _TipsReplyingMessageScreenState extends ConsumerState<TipsReplyingMessageScreen>
    with AfterLayoutMixin {
  final _user = const types.User(
    id: 'you',
  );

  @override
  void afterFirstLayout(BuildContext context) {
    ref.read(tipsReplyingNotifierProvider.notifier).loadFirstPage();
  }

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
      if (next.errorOrSuccess != null) {
        next.errorOrSuccess!.fold(
          (error) {
            SnackBarService.instance.showErrorSnackBar(
              message: error.getDisplayMessage(context),
              context: context,
            );
          },
          (success) {},
        );
      }
    });
    final showReload = ref.watch(tipsReplyingNotifierProvider).showReload ?? false;
    return Container(
      color: context.theme.scaffoldBackgroundColor,
      child: Scaffold(
        appBar: MyAppBar.myAppBar(
          title: context.l10n.tipsReplyingTitle,
          ref: ref,
          context: context,
          actionButton: showReload
              ? {
                  Icons.refresh: () {
                    ref.read(tipsReplyingNotifierProvider.notifier).loadFirstPage();
                  },
                }
              : {
                  Icons.delete_outline_rounded: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return DialogConfirm(
                          onPositiveButtonExecute: () {
                            ref.read(tipsReplyingNotifierProvider.notifier).deleteMessage();
                            Navigator.of(context).pop();
                          },
                          message: context.l10n.deleteConversationDialogTitle,
                          titlePositiveButton: context.l10n.delete,
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
                  : const ChatL10nEnOverride()),
          messages: messages,
          onAttachmentPressed: null,
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
