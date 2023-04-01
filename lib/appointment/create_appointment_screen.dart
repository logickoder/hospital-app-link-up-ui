import 'package:flutter/material.dart';

import '../common/resources.dart';
import '../common/widgets/input.dart';
import '../common/widgets/top_bar.dart';
import 'appointment_tile.dart';

class CreateAppointmentScreen extends StatelessWidget {
  const CreateAppointmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBar(title: 'APPOINTMENT'),
      body: ListView(
        shrinkWrap: true,
        children: [
          AppointmentTiles(),
          Padding(
            padding: const EdgeInsets.all(AppPadding.normal),
            child: Column(
              children: [
                Row(
                  children: const [
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
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
