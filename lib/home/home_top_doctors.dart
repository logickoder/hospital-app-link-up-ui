import 'package:flutter/material.dart';

import '../common/data/models/doctor.dart';
import '../common/widgets/doctor_item.dart';
import '../common/widgets/resources.dart';

class HomeTopDoctors extends StatelessWidget {
  const HomeTopDoctors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Top Doctors',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: AppPadding.normal),
        SizedBox(
          height: 320,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (_, __) => const SizedBox(
              width: AppPadding.normal,
            ),
            itemBuilder: (_, index) => DoctorItem(
              doctor: testDoctors[index],
            ),
            itemCount: testDoctors.length,
          ),
        ),
        const SizedBox(height: AppPadding.large),
        Row(
          children: [
            Text(
              'View all doctors',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: theme.colorScheme.primary,
              ),
            ),
            Icon(
              Icons.arrow_right_alt_outlined,
              color: theme.colorScheme.primary,
            ),
          ],
        )
      ],
    );
  }
}
