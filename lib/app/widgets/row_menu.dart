import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../extensions.dart';
import '../resources.dart';

class RowMenu extends ConsumerStatefulWidget {
  final String? initial;
  final List<String> items;
  final ValueChanged<String>? onItemChanged;

  const RowMenu({
    Key? key,
    this.initial,
    required this.items,
    this.onItemChanged,
  }) : super(key: key);

  @override
  ConsumerState<RowMenu> createState() => _RowMenuState();
}

class _RowMenuState extends ConsumerState<RowMenu> {
  late final _item = StateProvider.autoDispose<String>(
    (ref) => widget.initial ?? widget.items.first,
  );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final selectedItem = ref.watch(_item);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: widget.items.map((item) {
        return InkWell(
          onTap: () {
            ref.read(_item.notifier).state = item;
            widget.onItemChanged?.call(item);
          },
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.small),
            child: IntrinsicWidth(
              child: Column(
                children: [
                  Text(
                    item.capitalize,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: item == selectedItem
                          ? theme.colorScheme.primary
                          : null,
                    ),
                  ),
                  Divider(
                    thickness: 2,
                    color: item == selectedItem
                        ? theme.colorScheme.primary
                        : Colors.transparent,
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
