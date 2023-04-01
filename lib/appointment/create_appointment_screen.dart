import 'package:flutter/material.dart';

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
        ],
      ),
    );
  }
}
