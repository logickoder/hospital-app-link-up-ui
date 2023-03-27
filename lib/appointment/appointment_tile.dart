import 'package:flutter/material.dart';

import '../common/widgets/resources.dart';

class AppointmentTile extends StatelessWidget {
  const AppointmentTile({
    Key? key,
    required this.title,
    required this.icon,
    required this.amount,
    this.isSelected = false,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final int amount;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isSelected ? const Color(0xFF678FF5) : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.medium),
        child: Column(),
      ),
    );
  }
}
