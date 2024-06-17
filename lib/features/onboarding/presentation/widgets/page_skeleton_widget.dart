import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/widgets/vertical_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PageSkeletonWidget extends ConsumerWidget {
  const PageSkeletonWidget(
      {super.key, required this.title, required this.description, required this.children});

  final String title;
  final String description;
  final List<Widget> children;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox.expand(
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: context.textTheme.titleLarge!.copyWith(fontSize: 30),
              ),
              const VerticalSpace(size: 24),
              Text(
                description,
                style: context.textTheme.bodyLarge,
              ),
              const VerticalSpace(size: 24),
              ...children,
            ],
          ),
        ),
      ),
    );
  }
}
