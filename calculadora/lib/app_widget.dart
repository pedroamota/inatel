import 'package:flutter/material.dart';
import 'pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          background: Colors.grey[900],
          seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const Home(title: 'Calculator'),
    );
  }
}