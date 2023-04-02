class Appointment {
  final int doctorId, hospitalId;
  final DateTime time;
  final Duration duration;

  Appointment({
    required this.doctorId,
    required this.hospitalId,
    required this.time,
    required this.duration,
  });
}

final testAppointments = [
  Appointment(
    doctorId: 0,
    hospitalId: 0,
    time: DateTime.now().add(const Duration(hours: 1)),
    duration: const Duration(hours: 1, minutes: 30),
  ),
];
