import 'package:cupid_mentor/core/widgets/vertical_space.dart';
import 'package:cupid_mentor/features/profile/presentation/widgets/item_info.dart';
import 'package:flutter/material.dart';

class RelationshipStatus extends StatelessWidget {
  const RelationshipStatus(
      {super.key, required this.status, required this.onTapEditPartnerProfile});

  final String status;
  final Function() onTapEditPartnerProfile;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const VerticalSpace(size: 16),
        ItemInfo(
          title: 'Relationship status',
          value: status,
          onTap: onTapEditPartnerProfile,
        ),
      ],
    );
  }
}
