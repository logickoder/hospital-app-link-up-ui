import 'package:flutter/material.dart';

import '../app/data/models/appointment.dart';
import '../app/resources.dart';
import '../app/widgets/button.dart';
import '../app/widgets/top_bar.dart';
import 'appointment_item.dart';
import 'appointment_tile.dart';

class AppointmentsScreen extends StatelessWidget {
  const AppointmentsScreen({
    Key? key,
    required this.bookAppointment,
  }) : super(key: key);

  final VoidCallback bookAppointment;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: const TopBar(title: 'APPOINTMENTS'),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(child: AppointmentTiles()),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.medium),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'My Appointments',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontFamily: AppFonts.titleFamily,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(width: AppPadding.medium),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'View All',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Padding(
                padding: const EdgeInsets.only(
                  bottom: AppPadding.normal,
                  left: AppPadding.normal,
                  right: AppPadding.normal,
                ),
                child: AppointmentItem(testAppointments[index]),
              ),
              childCount: testAppointments.length,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: AppPadding.extraLarge,
                horizontal: AppPadding.normal,
              ),
              child: Button(
                text: 'Book an appointment',
                onClick: bookAppointment,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
