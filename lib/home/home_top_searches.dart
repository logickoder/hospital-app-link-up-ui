import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../common/utils/extensions.dart';
import '../common/widgets/resources.dart';

enum _TopSearches { all, specialities, procedures, conditions }

class HomeTopSearches extends ConsumerWidget {
  const HomeTopSearches({Key? key}) : super(key: key);

  static final _topSearch = StateProvider.autoDispose(
    (ref) => _TopSearches.all,
  );

  static final _items = [
    'cardiology',
    'optometry',
    'dentistry',
    'oncology',
    'neurology'
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final search = ref.watch(_topSearch);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Top searches',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w500,
            fontFamily: AppFonts.titleFamily,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _TopSearches.values.map((item) {
            return InkWell(
              onTap: () => ref.read(_topSearch.notifier).state = item,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: AppPadding.extraLarge,
                  horizontal: AppPadding.small,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: item == search
                          ? BorderSide(
                              color: theme.colorScheme.primary,
                              width: 2,
                            )
                          : BorderSide.none,
                    ),
                  ),
                  child: Text(
                    item.name.capitalize,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: item == search ? theme.colorScheme.primary : null,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        SizedBox(
          height: 80,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (_, __) => const SizedBox(
              width: AppPadding.extraLarge,
            ),
            itemBuilder: (_, index) {
              final item = _items[index];
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(AppPadding.medium),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF052B8E),
                    ),
                    child: SvgPicture.asset('assets/icons/$item.svg'),
                  ),
                  const SizedBox(height: AppPadding.small),
                  Text(item.capitalize)
                ],
              );
            },
            itemCount: _items.length,
          ),
        ),
        const SizedBox(height: AppPadding.small),
        TextButton.icon(
          onPressed: () => {},
          style: TextButton.styleFrom(
            foregroundColor: theme.colorScheme.primary,
          ),
          icon: Text(
            'View ${search == _TopSearches.all ? search.name : 'all ${search.name}'}',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
              color: theme.colorScheme.primary,
            ),
          ),
          label: const Icon(Icons.arrow_right_alt_outlined),
        ),
      ],
    );
  }
}
