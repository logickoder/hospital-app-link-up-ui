class Notification {
  const Notification({
    required this.sender,
    required this.content,
    required this.time,
  });

  final String sender, content;
  final DateTime time;
}

final testNotifications = [
  Notification(
    sender: 'Jennifer',
    content:
        'Your appointment with National Hospital Abuja has been accepted! You’ll be connected to a doctor in 5mins.',
    time: DateTime.now().copyWith(hour: 10, minute: 0),
  ),
  Notification(
    sender: 'Miracle',
    content:
        'Your virtual appointment with National Hospital Abuja was successfully booked.',
    time: DateTime.now().copyWith(hour: 9, minute: 41),
  ),
  Notification(
    sender: 'Grace',
    content:
        'Holy Rosary Clinic Abuja recently registered their facility; check it out!',
    time: DateTime.now().subtract(const Duration(days: 15)).copyWith(
          hour: 14,
          minute: 32,
        ),
  ),
  Notification(
    sender: 'Jennifer',
    content: 'You have an appointment coming up by 1pm with Dr. Jane Agu.',
    time: DateTime.now().subtract(const Duration(days: 15)).copyWith(
          hour: 12,
          minute: 05,
        ),
  ),
];
