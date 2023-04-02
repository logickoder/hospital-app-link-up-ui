import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../common/data/models/appointment.dart';
import '../common/data/models/doctor.dart';
import '../common/data/models/hospital.dart';
import '../common/resources.dart';

class AppointmentItem extends StatelessWidget {
  const AppointmentItem(this.appointment, {Key? key}) : super(key: key);

  final Appointment appointment;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final doctor = testDoctors[appointment.doctorId];
    return Card(
      color: theme.textTheme.bodyMedium?.color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppPadding.small,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.normal),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: doctor.image,
                    fit: BoxFit.cover,
                    height: 40,
                    width: 40,
                  ),
                ),
                const SizedBox(width: AppPadding.normal),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doctor.name,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                        fontFamily: AppFonts.titleFamily,
                        color: theme.colorScheme.onPrimary,
                      ),
                    ),
                    const SizedBox(height: AppPadding.small),
                    Text(
                      doctor.type,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onPrimary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: AppPadding.large),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    theme.textTheme.bodyMedium?.color ?? Colors.black,
                    const Color(0x00A8ADBB),
                  ],
                  stops: const [0.0, 1.0],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(AppPadding.small),
              ),
              padding: const EdgeInsets.symmetric(
                vertical: AppPadding.medium,
                horizontal: AppPadding.extraLarge,
              ),
              child: _details(context),
            )
          ],
        ),
      ),
    );
  }

  Widget _detail({
    required IconData icon,
    required String text,
    required BuildContext context,
  }) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Icon(icon, color: theme.colorScheme.onPrimary),
        const SizedBox(width: AppPadding.medium),
        Expanded(
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
              fontFamily: AppFonts.titleFamily,
              color: theme.colorScheme.onPrimary,
            ),
          ),
        ),
      ],
    );
  }

  Widget _details(BuildContext context) {
    final startTime = TimeOfDay.fromDateTime(appointment.time);
    final endTime = TimeOfDay.fromDateTime(
      appointment.time.add(
        appointment.duration,
      ),
    );
    return Column(
      children: [
        _detail(
          icon: Icons.timer_outlined,
          text: '${startTime.format(context)} - ${endTime.format(context)}',
          context: context,
        ),
        const SizedBox(height: AppPadding.medium),
        _detail(
          icon: Icons.calendar_month_outlined,
          text: DateFormat.yMMMMd().format(appointment.time),
          context: context,
        ),
        const SizedBox(height: AppPadding.medium),
        _detail(
          icon: Icons.location_on_outlined,
          text: testHospitals[appointment.hospitalId].name,
          context: context,
        ),
      ],
    );
  }
}
