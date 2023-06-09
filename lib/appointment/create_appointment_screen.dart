import 'package:flutter/material.dart';

import '../app/resources.dart';
import '../app/widgets/button.dart';
import '../app/widgets/input.dart';
import '../app/widgets/top_bar.dart';
import 'appointment_tile.dart';

class CreateAppointmentScreen extends StatelessWidget {
  const CreateAppointmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: const TopBar(title: 'APPOINTMENT'),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          AppointmentTiles(),
          Padding(
            padding: const EdgeInsets.all(AppPadding.normal),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Expanded(
                      child: Input(
                        label: 'Select time',
                        trailing: Icon(Icons.access_time_outlined),
                      ),
                    ),
                    SizedBox(width: AppPadding.medium),
                    Expanded(
                      child: Input(
                        label: 'Select date',
                        trailing: Icon(Icons.calendar_month_outlined),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: AppPadding.normal,
                  ),
                  child: Text(
                    'Add Payment Information',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontFamily: AppFonts.titleFamily,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Input(label: "Card Holder's Name"),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: AppPadding.normal,
                  ),
                  child: Input(label: "Card Number"),
                ),
                const Row(
                  children: [
                    Expanded(
                      child: Input(
                        label: 'Card Expiry Date',
                        trailing: Icon(Icons.calendar_month_outlined),
                      ),
                    ),
                    SizedBox(width: AppPadding.medium),
                    Expanded(child: Input(label: 'CVV')),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: AppPadding.extraLarge,
                  ),
                  child: Button(
                    text: 'Proceed',
                    onClick: () => Navigator.pop(context),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: RichText(
                    text: TextSpan(
                      text: 'By adding payment information, you agree to the',
                      style: theme.textTheme.bodySmall,
                      children: [
                        const TextSpan(text: '\n'),
                        TextSpan(
                          text: 'Terms & Conditions',
                          style: TextStyle(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: AppPadding.extraLarge),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
