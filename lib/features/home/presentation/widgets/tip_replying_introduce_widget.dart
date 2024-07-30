import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/features/home/presentation/widgets/base_introduce_widget.dart';
import 'package:cupid_mentor/features/home/presentation/widgets/chat_now_widget.dart';
import 'package:flutter/material.dart';

class TipReplyingIntroduceWidget extends StatelessWidget {
  const TipReplyingIntroduceWidget({super.key, this.showTopText = true});

  final bool showTopText;

  @override
  Widget build(BuildContext context) {
    return BaseIntroduceWidget(
      widget: const ChatNowWidget(
        showInfoIcon: false,
      ),
      title: context.l10n.tipReplyDialogInstructionTitle,
      description: context.l10n.tipReplyDialogInstructionDescription,
      showTopText: showTopText,
    );
  }
}
