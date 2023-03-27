import 'package:flutter/material.dart';

import 'appointment/create_appointment_screen.dart';
import 'dashboard/dashboard_screen.dart';
import 'hospital_detail/hospital_details_screen.dart';

class AppRoutes {
  static const dashboard = '/';
  static const hospitalDetails = '/hospital';
  static const createAppointment = '/appointments/create';

  static Map<String, Widget Function(BuildContext)> get routes => {
        dashboard: (_) => const DashboardScreen(),
        hospitalDetails: (_) => const HospitalDetailsScreen(),
        createAppointment: (_) => const CreateAppointmentScreen(),
      };
}
