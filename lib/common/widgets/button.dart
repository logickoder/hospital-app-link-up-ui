import 'package:flutter/material.dart';

import '../resources.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    required this.text,
    required this.onClick,
  }) : super(key: key);

  final String text;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        style: FilledButton.styleFrom(
          padding: const EdgeInsets.all(AppPadding.normal),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: Theme.of(context).textTheme.bodyLarge,
        ),
        onPressed: onClick,
        child: Text(text),
      ),
    );
  }
}
