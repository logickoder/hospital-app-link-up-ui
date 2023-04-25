import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../app/data/models/notification.dart' as model;
import '../app/resources.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem(this.notification, {Key? key}) : super(key: key);

  final model.Notification notification;

  @override
  Widget build(BuildContext context) {
    const rowItemColor = Color(0xFFB3C7FA);
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFD3DEFC)),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(AppPadding.medium),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: rowItemColor,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(AppPadding.small),
                child: Text(
                  notification.sender[0].toUpperCase(),
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontFamily: AppFonts.titleFamily,
                  ),
                ),
              ),
              _dateText(context),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    backgroundColor: rowItemColor,
                    padding: const EdgeInsets.all(AppPadding.small),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppPadding.small),
                    )),
                child: Text(
                  'View',
                  style: theme.textTheme.labelMedium?.copyWith(
                    fontFamily: AppFonts.titleFamily,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppPadding.normal),
          Text(notification.content)
        ],
      ),
    );
  }

  Widget _dateText(BuildContext context) {
    final date = notification.time;
    final dateDifference = date.difference(DateTime.now());
    String top;
    if (dateDifference.inDays == 0) {
      top = 'Today';
    } else if (dateDifference.inDays == 1) {
      top = 'Yesterday';
    } else {
      top = DateFormat('dd-MM-yyyy').format(date);
    }
    String bottom = TimeOfDay.fromDateTime(date).format(context);
    return Text(
      '$top\n$bottom',
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontFamily: AppFonts.titleFamily,
          ),
      textAlign: TextAlign.center,
    );
  }
}
