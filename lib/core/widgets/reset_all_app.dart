import 'package:flutter/material.dart';

class ResetAllApp extends StatefulWidget {
  const ResetAllApp({super.key, required this.child});

  final Widget child;

  static void restartApp(BuildContext context) {
    //NavigationService.instance.resetNavigatorKey();
    context.findAncestorStateOfType<_ResetAllAppState>()?.restartApp();
  }

  @override
  State<ResetAllApp> createState() => _ResetAllAppState();
}

class _ResetAllAppState extends State<ResetAllApp> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child,
    );
  }
}
