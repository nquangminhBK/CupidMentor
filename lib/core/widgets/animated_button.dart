import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnimatedButton extends ConsumerStatefulWidget {
  final Function onPress;
  final Color? color;
  final Widget? child;
  final BorderRadiusGeometry? borderRadius;
  final Duration? duration;
  final double? scaleSize;
  final EdgeInsets? padding;
  final double? borderSize;
  final Color? borderColor;
  final Function? onLongPress;

  const AnimatedButton({
    required this.onPress,
    this.color,
    this.onLongPress,
    required this.child,
    this.duration,
    this.borderRadius,
    this.borderColor,
    this.scaleSize,
    this.borderSize,
    this.padding,
    super.key,
  });

  @override
  ConsumerState createState() => AnimatedButtonState();
}

class AnimatedButtonState extends ConsumerState<AnimatedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: widget.duration ?? const Duration(milliseconds: 100),
      vsync: this,
    );
    _animation = Tween<double>(begin: 1, end: widget.scaleSize ?? 0.97).animate(_controller);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => ScaleTransition(
        scale: _animation,
        child: GestureDetector(
          child: Container(
            padding: widget.padding ?? EdgeInsets.zero,
            decoration: BoxDecoration(
              border: widget.borderSize != null
                  ? Border.all(width: widget.borderSize!, color: widget.borderColor ?? Colors.black)
                  : null,
              borderRadius: widget.borderRadius ??
                  BorderRadius.circular(
                    10,
                  ),
              color: widget.color ?? Colors.transparent,
            ),
            child: Center(
              child: widget.child,
            ),
          ),
          onTap: () {
            _controller.forward().whenComplete(() {
              _controller.reverse().whenComplete(() {
                try {
                  widget.onPress();
                } catch (e) {
                  debugPrint('error when click animated clickable widget: $e');
                }
              });
            });
          },
          onLongPress: () {
            widget.onLongPress?.call();
          },
        ),
      );
}
