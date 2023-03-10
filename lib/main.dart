import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

//TODO: Cambiar package para APK
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de carreteras',
      theme: AppTheme.lightTheme(),
      darkTheme: AppTheme.darkTheme(),
      home: const HomeScreen(),
    );
  }
}
