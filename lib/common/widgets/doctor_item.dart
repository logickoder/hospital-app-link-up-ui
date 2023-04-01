import 'package:flutter/material.dart';

import '../data/models/doctor.dart';
import '../resources.dart';
import 'image.dart';
import 'rating.dart';

class DoctorItem extends StatelessWidget {
  final Doctor doctor;

  const DoctorItem({
    Key? key,
    required this.doctor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSizes.vertScrollWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          HomePageImage(image: doctor.image, size: AppSizes.vertScrollWidth),
          const SizedBox(height: AppPadding.medium),
          Text(
            doctor.name,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontFamily: AppFonts.titleFamily,
                ),
          ),
          const SizedBox(height: AppPadding.small),
          Text(doctor.hospital, maxLines: 1),
          const SizedBox(height: AppPadding.small),
          Text(doctor.type, maxLines: 1),
          const SizedBox(height: AppPadding.small),
          Row(
            children: [
              Text(doctor.rating.toStringAsFixed(1)),
              const SizedBox(width: AppPadding.medium),
              Rating(rating: doctor.rating),
            ],
          ),
        ],
      ),
    );
  }
}
