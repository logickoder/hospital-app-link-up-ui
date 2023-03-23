import 'package:flutter/material.dart';

import 'dashboard/dashboard.dart';
import 'hospital_detail/hospital_details_screen.dart';

class AppRoutes {
  static const dashboard = '/';
  static const hospitalDetails = '/hospital';

  static Map<String, Widget Function(BuildContext)> get routes => {
        dashboard: (_) => const Dashboard(),
        hospitalDetails: (_) => const HospitalDetailsScreen(),
      };
}
