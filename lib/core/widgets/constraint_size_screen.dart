import 'package:cupid_mentor/core/constants/screen_size.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConstraintSizeScreen extends ConsumerStatefulWidget {
  const ConstraintSizeScreen({
    super.key,
    required this.child,
    this.emptyBackgroundColor,
  });

  final Widget child;
  final Color? emptyBackgroundColor;

  @override
  ConsumerState<ConstraintSizeScreen> createState() => _ConstraintSizeScreenState();
}

class _ConstraintSizeScreenState extends ConsumerState<ConstraintSizeScreen> {
  late final _verticalController = ScrollController();
  late final _horizontalController = ScrollController();

  @override
  void dispose() {
    _verticalController.dispose();
    _horizontalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.emptyBackgroundColor ?? ref.currentAppColor.screenBackgroundColor,
      child: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final shouldScrollVertical = constraints.maxHeight <= ScreenSize.minHeight;
            var contentHeight = shouldScrollVertical ? ScreenSize.minHeight : constraints.maxHeight;
            final verticalPhysics = shouldScrollVertical
                ? const AlwaysScrollableScrollPhysics()
                : const NeverScrollableScrollPhysics();

            final shouldScrollHorizontal = constraints.maxWidth <= ScreenSize.minWidth;
            var contentWidth = shouldScrollHorizontal ? ScreenSize.minWidth : constraints.maxWidth;
            final horizontalPhysics = shouldScrollHorizontal
                ? const AlwaysScrollableScrollPhysics()
                : const NeverScrollableScrollPhysics();

            if (contentWidth > ScreenSize.maxWidth) {
              contentWidth = ScreenSize.maxWidth;
            }
            if (contentHeight > ScreenSize.maxHeight) {
              contentHeight = ScreenSize.maxHeight;
            }
            return Scrollbar(
              controller: _verticalController,
              thumbVisibility: shouldScrollVertical,
              child: SingleChildScrollView(
                controller: _verticalController,
                scrollDirection: Axis.vertical,
                physics: verticalPhysics,
                child: Scrollbar(
                  interactive: true,
                  controller: _horizontalController,
                  thumbVisibility: shouldScrollHorizontal,
                  child: SingleChildScrollView(
                    controller: _horizontalController,
                    scrollDirection: Axis.horizontal,
                    physics: horizontalPhysics,
                    child: UnconstrainedBox(
                      child: SizedBox(
                        height: contentHeight,
                        width: contentWidth,
                        child: Center(child: widget.child),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
