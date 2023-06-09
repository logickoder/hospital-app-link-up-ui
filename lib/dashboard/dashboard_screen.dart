import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../appointment/appointments_screen.dart';
import '../chat/chat_list_screen.dart';
import '../home/home_screen.dart';
import '../search/search_screen.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  static final _pageIndexProvider = StateProvider.autoDispose((ref) => 0);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final index = ref.watch(_pageIndexProvider);

    return Scaffold(
      body: IndexedStack(
        index: index,
        children: [
          HomeScreen(
            goToSearch: () => ref.read(_pageIndexProvider.notifier).state = 1,
          ),
          const SearchScreen(),
          AppointmentsScreen(
            bookAppointment: () =>
                ref.read(_pageIndexProvider.notifier).state = 1,
          ),
          const ChatListScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined),
            label: 'Appointment',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.email_outlined),
            label: 'Chat',
          ),
        ],
        currentIndex: index,
        selectedItemColor: theme.colorScheme.primary,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        onTap: (value) => ref.read(_pageIndexProvider.notifier).state = value,
      ),
    );
  }
}
