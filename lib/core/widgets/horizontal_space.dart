import 'package:flutter/material.dart';

class HorizontalSpace extends StatelessWidget {
  const HorizontalSpace({super.key, required this.size});

  final double size;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: size,
      );
}
