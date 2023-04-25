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
              padding: const EdgeInsets.all(AppPadding.normal),
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
          )
        ],
      ),
    );
  }
}
