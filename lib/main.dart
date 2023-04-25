import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Hospital Link Up',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Helvetica',
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF1B57F0),
            onPrimary: const Color(0xFFF6F9FF),
          ),
          textTheme: textTheme(context),
        ),
        routes: AppRoutes.routes,
      ),
    );
  }

  TextTheme textTheme(BuildContext context) {
    const color = Color(0xFF02050D);
    return Theme.of(context).textTheme.apply(
          bodyColor: color,
          displayColor: color,
        );
  }
}
