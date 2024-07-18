import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DialogMarkdownContent extends ConsumerWidget {
  const DialogMarkdownContent({super.key, required this.content});

  final String content;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ref.currentAppColor.screenBackgroundColor,
        ),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(horizontal: 24),
        width: double.infinity,
        child: Markdown(data: content),
      ),
    );
  }
}
