import 'package:flutter/material.dart';

class AdaptiveScreen extends StatelessWidget {
  const AdaptiveScreen({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) => Container(
        child: child,
      );
}
