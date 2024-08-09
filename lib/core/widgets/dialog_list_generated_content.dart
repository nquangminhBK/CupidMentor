import 'dart:async';

import 'package:cupid_mentor/core/core_entity/content_response.dart';
import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/widgets/animated_button.dart';
import 'package:cupid_mentor/core/widgets/base_dialog.dart';
import 'package:cupid_mentor/core/widgets/dialog_confirm.dart';
import 'package:cupid_mentor/core/widgets/horizontal_space.dart';
import 'package:cupid_mentor/core/widgets/page_indicator.dart';
import 'package:cupid_mentor/core/widgets/vertical_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DialogListGeneratedContent extends ConsumerStatefulWidget {
  const DialogListGeneratedContent({
    super.key,
    required this.contents,
    required this.onTapCreateNewOne,
    required this.onTapDelete,
  });

  final List<ContentResponse> contents;
  final Future<ContentResponse?> Function() onTapCreateNewOne;
  final Future<bool> Function(String) onTapDelete;

  @override
  ConsumerState<DialogListGeneratedContent> createState() => _DialogListGeneratedContentState();
}

class _DialogListGeneratedContentState extends ConsumerState<DialogListGeneratedContent> {
  List<ContentResponse> currentContents = [];

  @override
  void initState() {
    currentContents = widget.contents;
    super.initState();
  }

  int currentPage = 0;
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      child: Column(
        children: [
          Expanded(
            child: PageView(
              controller: pageController,
              children: [
                ...currentContents.map(
                  (e) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(child: Markdown(data: e.content)),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: 200,
                          height: 50,
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: AnimatedButton(
                            color: ref.currentAppColor.buttonBackgroundColor,
                            borderRadius: BorderRadius.circular(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  context.l10n.delete,
                                ),
                                const HorizontalSpace(size: 8),
                                const Icon(
                                  Icons.delete_outline_rounded,
                                  size: 16,
                                ),
                              ],
                            ),
                            onPress: () async {
                              final result = await showDialog(
                                context: context,
                                builder: (context) {
                                  return DialogConfirm(
                                    onPositiveButtonExecute: () async {
                                      final result = await widget.onTapDelete(e.id);
                                      if (result) {
                                        if (context.mounted) Navigator.of(context).pop(true);
                                        setState(() {});
                                      } else {
                                        if (context.mounted) Navigator.of(context).pop(false);
                                      }
                                    },
                                    message: context.l10n.deleteTipsConfirmTitle,
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
                              if (result != null && !(result as bool)) {
                                if (context.mounted) Navigator.of(context).pop();
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    height: 50,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: AnimatedButton(
                      color: ref.currentAppColor.buttonBackgroundColor,
                      borderRadius: BorderRadius.circular(8),
                      child: Text(
                        context.l10n.generateANewOne,
                      ),
                      onPress: () async {
                        final newSuggestion = await widget.onTapCreateNewOne();
                        if (newSuggestion != null) {
                          setState(() {});
                        } else {
                          if (context.mounted) Navigator.of(context).pop();
                        }
                      },
                    ),
                  ),
                ),
              ],
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
            ),
          ),
          const VerticalSpace(size: 16),
          PageIndicator(
            totalCount: currentContents.length + 1,
            currentIndex: currentPage,
          ),
        ],
      ),
    );
  }
}
