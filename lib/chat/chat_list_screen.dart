import 'package:flutter/material.dart';

import '../app/data/models/chat.dart';
import '../app/resources.dart';
import '../app/widgets/row_menu.dart';
import '../app/widgets/search.dart';
import '../app/widgets/top_bar.dart';
import 'chat_list_item.dart';

final _menu = [
  'communities',
  'chats',
  'groups',
  'calls',
];

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBar(title: 'Chat'),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.normal,
                vertical: AppPadding.medium,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Search(hint: 'Search'),
                  const SizedBox(height: AppPadding.normal),
                  RowMenu(
                    items: _menu,
                    initial: _menu[1],
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(child: Divider(thickness: 0.5)),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: AppPadding.medium,
                    horizontal: AppPadding.normal,
                  ),
                  child: ChatListItem(testChats[index]),
                );
              },
              childCount: testChats.length,
            ),
          ),
          const SliverToBoxAdapter(child: Divider(thickness: 0.5)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: AppPadding.extraLarge,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.lock_outline),
                  const SizedBox(width: AppPadding.medium),
                  FittedBox(
                    child: RichText(
                      text: TextSpan(
                        text: 'Your personal messages are',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: const Color(0xFF626671),
                            ),
                        children: [
                          const TextSpan(text: ' '),
                          TextSpan(
                            text: 'end-to-end encrypted',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
