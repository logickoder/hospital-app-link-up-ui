import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../common/resources.dart';
import '../common/utils/extensions.dart';

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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.normal),
          child: Text(
            'Top searches',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w500,
              fontFamily: AppFonts.titleFamily,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.normal,
            vertical: AppPadding.large,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _TopSearches.values.map((item) {
              return InkWell(
                onTap: () => ref.read(_topSearch.notifier).state = item,
                child: Padding(
                  padding: const EdgeInsets.all(AppPadding.small),
                  child: Text(
                    item.name.capitalize,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: item == search ? theme.colorScheme.primary : null,
                      decoration:
                          item == search ? TextDecoration.underline : null,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        SizedBox(
          height: 80,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              final item = _items[index];
              return Padding(
                padding: EdgeInsets.only(
                  right: index < _items.length - 1
                      ? AppPadding.extraLarge
                      : AppPadding.normal,
                  left: index == 0 ? AppPadding.normal : 0,
                ),
                child: Column(
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
                ),
              );
            },
            itemCount: _items.length,
          ),
        ),
        const SizedBox(height: AppPadding.small),
        Padding(
          padding: const EdgeInsets.only(left: AppPadding.normal),
          child: TextButton.icon(
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
        ),
      ],
    );
  }
}
