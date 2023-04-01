import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../common/data/models/hospital.dart';
import '../common/resources.dart';
import '../common/routes.dart';
import '../common/widgets/button.dart';

class HospitalDetails extends StatelessWidget {
  HospitalDetails({Key? key, required this.hospital}) : super(key: key);

  final Hospital hospital;

  static final _items = [
    'Overview',
    'Services',
    'Doctors',
    'Awards',
  ];

  final _title = StateProvider.autoDispose((ref) => _items.first);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: theme.colorScheme.primary,
      child: Container(
        decoration: BoxDecoration(
          color: theme.scaffoldBackgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(AppPadding.extraLarge),
            topRight: Radius.circular(AppPadding.extraLarge),
          ),
        ),
        padding: const EdgeInsets.all(AppPadding.extraLarge),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Consumer(builder: (_, ref, __) {
              final title = ref.watch(_title);
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: _items.map((item) {
                  return InkWell(
                    onTap: () => ref.read(_title.notifier).state = item,
                    child: Text(
                      item,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: item == title ? theme.colorScheme.primary : null,
                      ),
                    ),
                  );
                }).toList(),
              );
            }),
            Padding(
              padding: const EdgeInsets.only(
                top: AppPadding.large,
                bottom: AppPadding.medium,
              ),
              child: Text(
                'About Hospital',
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontFamily: AppFonts.titleFamily,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text:
                    'National Hospital Abuja is a hospital located in PMB 425, Garki. Abuja, F.C.T. Nigeria.The hospital was founded under the Family Support Programme initiative and was formally established under Decree 36 of 1999. Abdulsalami Abubakar commissioned the hospital on 22 May 1999... ',
                style: theme.textTheme.bodyMedium,
                children: [
                  TextSpan(
                    text: 'Read more',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppPadding.extraLarge),
            const Padding(
              padding: EdgeInsets.only(bottom: AppPadding.normal),
              child: _HospitalDetailItem(
                icon: Icons.web,
                text: 'https://nationalhospital.gov.ng',
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: AppPadding.normal),
              child: _HospitalDetailItem(
                icon: Icons.location_on,
                text: 'PMB 425, Garki. Abuja, F.C.T. Nigeria.',
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: AppPadding.normal),
              child: _HospitalDetailItem(
                icon: Icons.phone,
                text: '08035808004',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: AppPadding.normal),
              child: _HospitalDetailItem(
                icon: Icons.access_time,
                text:
                    'Open ${hospital.closingTime.hour - hospital.openingTime.hour} hours everyday',
              ),
            ),
            const SizedBox(height: AppPadding.extraLarge),
            Button(
              text: 'Book an appointment',
              onClick: () => Navigator.pushNamed(
                context,
                AppRoutes.createAppointment,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HospitalDetailItem extends StatelessWidget {
  const _HospitalDetailItem({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isUrl = Uri.tryParse(text)?.isAbsolute == true;

    return Row(
      children: [
        Icon(icon),
        const SizedBox(width: AppPadding.medium),
        InkWell(
          onTap: () async {
            await launchUrlString(text);
          },
          child: Text(
            text,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: isUrl ? theme.colorScheme.primary : null,
            ),
          ),
        ),
      ],
    );
  }
}
