import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';

void main() => runApp(
      MaterialApp(
        title: 'Mboalab Advanced',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Helvetica',
          colorScheme: const ColorScheme.light(
            primary: Color(0xFF1B57F0),
          ),
        ),
        home: const ProviderScope(child: App()),
      ),
    );
