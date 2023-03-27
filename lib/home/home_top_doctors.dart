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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.normal),
          child: Text(
            'Top Doctors',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w500,
              fontFamily: AppFonts.titleFamily,
            ),
          ),
        ),
        const SizedBox(height: AppPadding.normal),
        Container(
          height: 320,
          padding: const EdgeInsets.only(left: AppPadding.normal),
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
        const SizedBox(height: AppPadding.small),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.normal),
          child: TextButton.icon(
            onPressed: () => {},
            style: TextButton.styleFrom(
              foregroundColor: theme.colorScheme.primary,
            ),
            icon: Text(
              'View all doctors',
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
