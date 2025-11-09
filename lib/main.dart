import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const FinanceMateApp());
}

class FinanceMateApp extends StatelessWidget {
  const FinanceMateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finance Mate',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: const Color(0xFFFDFDFD),
      ),
      home: const SplashScreen(),
    );
  }
}