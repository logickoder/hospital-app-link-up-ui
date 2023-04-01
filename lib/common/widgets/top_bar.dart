import 'package:flutter/material.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  const TopBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppBar(
      title: Text(
        title,
        style: theme.textTheme.headlineSmall?.copyWith(
          fontWeight: FontWeight.w500,
        ),
      ),
      backgroundColor: theme.scaffoldBackgroundColor,
      foregroundColor: theme.textTheme.bodyLarge?.color,
      centerTitle: true,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 56);
}
