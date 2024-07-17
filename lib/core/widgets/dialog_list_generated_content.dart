import 'package:cupid_mentor/core/core_entity/content_response.dart';
import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/navigation/navigation_service.dart';
import 'package:cupid_mentor/core/widgets/animated_button.dart';
import 'package:cupid_mentor/core/widgets/icon_close_button.dart';
import 'package:cupid_mentor/core/widgets/page_indicator.dart';
import 'package:cupid_mentor/core/widgets/vertical_space.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DialogListGeneratedContent extends ConsumerStatefulWidget {
  const DialogListGeneratedContent({
    super.key,
    required this.contents,
    required this.onTapCreateNewOne,
  });

  final List<ContentResponse> contents;
  final Future<ContentResponse?> Function() onTapCreateNewOne;

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
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ref.currentAppColor.screenBackgroundColor,
        ),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(24),
        width: double.infinity,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: IconCloseButton(
                onPress: () {
                  NavigationService.instance.pop();
                },
              ),
            ),
            Expanded(
              child: PageView(
                controller: pageController,
                children: [
                  ...currentContents.map((e) => Markdown(data: e.content)),
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
      ),
    );
  }
}
