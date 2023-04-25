import 'package:flutter/material.dart';

import '../app/data/models/hospital.dart';
import 'hospital_details.dart';
import 'hospital_details_app_bar.dart';

class HospitalDetailsScreen extends StatelessWidget {
  const HospitalDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hospital =
        testHospitals[ModalRoute.of(context)?.settings.arguments as int];
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          HospitalDetailsAppBar(hospital: hospital),
          SliverToBoxAdapter(child: HospitalDetails(hospital: hospital)),
        ],
      ),
    );
  }
}
