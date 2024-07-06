import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/widgets/image_network.dart';
import 'package:cupid_mentor/core/widgets/vertical_space.dart';
import 'package:cupid_mentor/features/setting/presentation/manager/setting_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileSection extends ConsumerWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfo = ref.watch(settingNotifierProvider).userInfo;
    final currentAge = DateTime.now().year - (userInfo.birthday.year);
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const VerticalSpace(size: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: ImageNetwork(
              imageUrl: userInfo.avatar,
              width: 80,
              height: 80,
            ),
          ),
          const VerticalSpace(size: 8),
          Text(
            '${userInfo.name}, $currentAge',
            style: context.textTheme.titleLarge,
          ),
          const VerticalSpace(size: 24),
        ],
      ),
    );
  }
}
