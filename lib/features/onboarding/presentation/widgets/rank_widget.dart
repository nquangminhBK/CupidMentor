import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RankWidget extends ConsumerWidget {
  const RankWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      height: 50,
      child: Center(
        child: Text(
          title,
          style: context.textTheme.titleSmall,
        ),
      ),
    );
  }
}
