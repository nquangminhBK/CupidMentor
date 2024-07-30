import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/widgets/page_indicator.dart';
import 'package:cupid_mentor/core/widgets/vertical_space.dart';
import 'package:cupid_mentor/features/home/presentation/widgets/tip_date_spot_introduce_widget.dart';
import 'package:cupid_mentor/features/home/presentation/widgets/tip_gift_introduce_widget.dart';
import 'package:cupid_mentor/features/home/presentation/widgets/tip_replying_introduce_widget.dart';
import 'package:cupid_mentor/features/home/presentation/widgets/tip_self_improvement_introduce_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DialogIntroduceOverall extends ConsumerStatefulWidget {
  const DialogIntroduceOverall({
    super.key,
  });

  @override
  ConsumerState<DialogIntroduceOverall> createState() => _DialogIntroduceOverallState();
}

class _DialogIntroduceOverallState extends ConsumerState<DialogIntroduceOverall> {
  int currentIndex = 0;
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 480,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VerticalSpace(size: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              '${context.l10n.featureIntroduction}:',
              style: context.textTheme.headlineSmall!.copyWith(
                fontSize: 20,
                height: 1.5,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          const VerticalSpace(size: 12),
          Expanded(
            child: IntrinsicHeight(
              child: PageView(
                controller: pageController,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                children: const [
                  TipReplyingIntroduceWidget(
                    showTopText: false,
                  ),
                  TipSelfImprovementIntroduceWidget(
                    showTopText: false,
                  ),
                  TipGiftIntroduceWidget(
                    showTopText: false,
                  ),
                  TipDateSpotIntroduceWidget(
                    showTopText: false,
                  ),
                ],
              ),
            ),
          ),
          PageIndicator(
            totalCount: 4,
            currentIndex: currentIndex,
          ),
        ],
      ),
    );
  }
}
