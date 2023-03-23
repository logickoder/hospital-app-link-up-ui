import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../common/data/models/user.dart';
import '../common/widgets/resources.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({Key? key}) : super(key: key);

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
        IconButton(
          icon: const Icon(Icons.notifications_outlined),
          onPressed: () {},
        ),
      ],
    );
  }
}
