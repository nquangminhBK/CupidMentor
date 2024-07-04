import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PageGeneralWidget extends ConsumerWidget {
  const PageGeneralWidget({
    super.key,
    required this.image,
    required this.textBg,
    required this.title,
    required this.description,
  });

  final Widget image;
  final Widget textBg;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: image,
          ),
        ),
        SizedBox(
          height: 72,
          child: Stack(
            children: [
              Align(alignment: Alignment.topCenter, child: textBg),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    title,
                    style: context.textTheme.titleLarge?.copyWith(
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
          child: Text(
            description,
            style: context.textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }
}
