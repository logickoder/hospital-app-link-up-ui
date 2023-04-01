import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../common/resources.dart';

class AppointmentTileModel {
  AppointmentTileModel({
    required this.title,
    required this.icon,
    required this.amount,
  });

  final String title;
  final IconData icon;
  final int amount;
}

class AppointmentTile extends StatelessWidget {
  const AppointmentTile({
    Key? key,
    required this.model,
    this.active = false,
  }) : super(key: key);

  final AppointmentTileModel model;
  final bool active;

  static final currency = NumberFormat.currency(
    locale: "en_NG",
    symbol: "NGN",
  );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor =
        active ? theme.colorScheme.onPrimary : theme.colorScheme.inverseSurface;

    return Card(
      color: active ? const Color(0xFF5573C1) : theme.colorScheme.onPrimary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.medium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color:
                    active ? const Color(0xFF6F8BD3) : const Color(0xFFE7EDFF),
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(AppPadding.small),
              child: Icon(
                model.icon,
                color: textColor,
              ),
            ),
            const Spacer(),
            Text(
              model.title,
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w500,
                fontFamily: AppFonts.titleFamily,
                color: textColor,
              ),
            ),
            const SizedBox(height: AppPadding.medium),
            Text(
              currency.format(model.amount),
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
                fontFamily: AppFonts.titleFamily,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppointmentTiles extends ConsumerWidget {
  AppointmentTiles({Key? key}) : super(key: key);

  static final _tiles = [
    AppointmentTileModel(
      title: 'Virtual Appointment',
      amount: 4000,
      icon: Icons.laptop_outlined,
    ),
    AppointmentTileModel(
      title: 'Hospital Visit',
      amount: 3000,
      icon: Icons.local_hospital_outlined,
    ),
    AppointmentTileModel(
      title: 'Home Visit',
      amount: 8000,
      icon: Icons.home_outlined,
    ),
  ];

  final _selectedTile = StateProvider<int?>((ref) => null);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(_selectedTile);

    return SizedBox(
      height: 170,
      child: ListView.builder(
        itemExtent: 200,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: _tiles.length,
        itemBuilder: (_, index) => Padding(
          padding: EdgeInsets.only(
            left: index == 0 ? AppPadding.normal : 0,
            right: AppPadding.normal,
          ),
          child: InkWell(
            onTap: () => ref.read(_selectedTile.notifier).state = index,
            child: AppointmentTile(
              model: _tiles[index],
              active: index == selected,
            ),
          ),
        ),
      ),
    );
  }
}
