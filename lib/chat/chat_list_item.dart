import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../app/data/models/chat.dart';
import '../app/resources.dart';
import '../app/utils/extensions.dart';

class ChatListItem extends StatelessWidget {
  final Chat chat;

  const ChatListItem(this.chat, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipOval(
          child: CachedNetworkImage(
            imageUrl: chat.image,
            fit: BoxFit.cover,
            height: 50,
            width: 50,
          ),
        ),
        const SizedBox(width: AppPadding.medium),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                chat.name,
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontFamily: AppFonts.titleFamily,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: AppPadding.small),
              Text(
                chat.isTyping ? 'Typing...' : chat.message,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: chat.isTyping ? theme.colorScheme.primary : null,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: AppPadding.extraLarge),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              chat.time.formatted,
              style: theme.textTheme.bodySmall,
            ),
            if (chat.unread > 0) ...{
              const SizedBox(height: AppPadding.small),
              Container(
                padding: const EdgeInsets.all(AppPadding.small / 2),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  chat.unread.toString(),
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
              ),
            }
          ],
        ),
      ],
    );
  }
}
