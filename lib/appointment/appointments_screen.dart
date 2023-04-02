import 'package:flutter/material.dart';

import '../common/resources.dart';
import '../common/widgets/button.dart';
import '../common/widgets/top_bar.dart';
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
      body: Column(
        children: [
          AppointmentTiles(),
          Padding(
            padding: const EdgeInsets.all(AppPadding.normal),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
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
                    Text(
                      'View All',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: AppPadding.extraLarge,
                  ),
                  child: Button(
                    text: 'Book an appointment',
                    onClick: bookAppointment,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
