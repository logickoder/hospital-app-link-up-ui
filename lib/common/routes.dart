import 'package:flutter/material.dart';

import '../appointment/create_appointment_screen.dart';
import '../dashboard/dashboard_screen.dart';
import '../hospital_detail/hospital_details_screen.dart';
import '../notifications/notifications_screen.dart';

class AppRoutes {
  static const dashboard = '/';
  static const createAppointment = '/appointments/create';
  static const hospitalDetails = '/hospital';
  static const notifications = '/notifications';

  static Map<String, Widget Function(BuildContext)> get routes => {
        dashboard: (_) => const DashboardScreen(),
        createAppointment: (_) => const CreateAppointmentScreen(),
        hospitalDetails: (_) => const HospitalDetailsScreen(),
        notifications: (_) => const NotificationsScreen(),
      };
}
