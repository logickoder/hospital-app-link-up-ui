import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../app/resources.dart';
import '../app/utils/extensions.dart';
import '../app/widgets/row_menu.dart';

final _items = [
  'cardiology',
  'optometry',
  'dentistry',
  'oncology',
  'neurology'
];

final _topSearches = [
  'all',
  'specialities',
  'procedures',
  'conditions',
];

final _topSearch = StateProvider.autoDispose((ref) => _topSearches.first);

class HomeTopSearches extends StatelessWidget {
  const HomeTopSearches({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
          padding: const EdgeInsets.all(AppPadding.normal),
          child: Consumer(
            builder: (_, ref, __) {
              return RowMenu(
                initial: ref.read(_topSearch),
                items: _topSearches,
                onItemChanged: (String value) {
                  ref.read(_topSearch.notifier).state = value;
                },
              );
            },
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
            icon: Consumer(
              builder: (_, ref, __) {
                final search = ref.watch(_topSearch);
                return Text(
                  'View ${search == _topSearches.first ? search : 'all $search'}',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: theme.colorScheme.primary,
                  ),
                );
              },
            ),
            label: const Icon(Icons.arrow_right_alt_outlined),
          ),
        ),
      ],
    );
  }
}
