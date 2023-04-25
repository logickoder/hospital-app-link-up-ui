import 'package:flutter/material.dart';

import '../app/resources.dart';
import '../app/widgets/rating.dart';

class HospitalDetailsTitle extends StatelessWidget {
  const HospitalDetailsTitle(
      {Key? key, required this.name, required this.ratings})
      : super(key: key);

  final String name;
  final List<double> ratings;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final rating = ratings.reduce((a, b) => a + b) / ratings.length;

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppPadding.extraLarge),
          topRight: Radius.circular(AppPadding.extraLarge),
        ),
      ),
      padding: const EdgeInsets.all(AppPadding.normal),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            name,
            maxLines: 1,
            textAlign: TextAlign.center,
            style: theme.textTheme.headlineSmall?.copyWith(
              color: theme.colorScheme.onPrimary,
              fontWeight: FontWeight.w500,
              fontFamily: AppFonts.titleFamily,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Rating(rating: rating),
              const SizedBox(width: AppPadding.medium),
              Text(
                '${ratings.length} Google reviews',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onPrimary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
