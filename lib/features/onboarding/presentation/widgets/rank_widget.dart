import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:flutter/cupertino.dart';

class RankWidget extends StatelessWidget {
  const RankWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
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
