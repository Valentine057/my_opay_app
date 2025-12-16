import 'package:flutter/material.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(const OPayApp());
}

class OPayApp extends StatelessWidget {
  const OPayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OPay Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF00C853),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF00C853)),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF00C853),
          foregroundColor: Colors.white,
        ),
      ),
      home: const MainScreen(),
    );
  }
}
