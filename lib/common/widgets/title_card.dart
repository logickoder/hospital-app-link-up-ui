import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../data/models/user.dart';
import 'resources.dart';

class TitleCard extends StatelessWidget {
  const TitleCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        ClipOval(
          child: CachedNetworkImage(
            imageUrl: testUser.avatar,
            fit: BoxFit.cover,
            height: 50,
            width: 50,
          ),
        ),
        const SizedBox(width: AppPadding.small),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${testUser.name},',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w500,
                fontFamily: AppFonts.titleFamily,
              ),
            ),
            const SizedBox(height: AppPadding.small),
            Text(
              'How are you feeling today?',
              style: theme.textTheme.titleMedium,
            ),
          ],
        ),
        const Spacer(),
        Stack(
          children: [
            IconButton(
              icon: const Icon(Icons.notifications_outlined),
              onPressed: () {},
            ),
            Positioned(
              top: 10.0,
              right: 10.0,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFE02D3C),
                  shape: BoxShape.circle,
                ),
                width: AppPadding.small,
                height: AppPadding.small,
              ),
            )
          ],
        ),
      ],
    );
  }
}
