import 'package:dicoding_flutter/pages/opet.dart';
import 'package:dicoding_flutter/pages/pulu.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const PuluApp());
}

class PuluApp extends StatelessWidget {
  const PuluApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pulu',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const PuluPage(),
      routes: {
        'pulu': (context) => const PuluPage(),
        'opet': (context) => const OpetPage()
      },
    );
  }
}
