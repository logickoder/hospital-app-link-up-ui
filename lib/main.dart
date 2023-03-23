import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'common/widgets/resources.dart';
import 'routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Mboalab Advanced',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Helvetica',
          colorScheme: const ColorScheme.light(
            primary: Color(0xFF1B57F0),
          ),
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: AppColors.text,
                displayColor: AppColors.text,
              ),
        ),
        routes: AppRoutes.routes,
      ),
    );
  }
}
