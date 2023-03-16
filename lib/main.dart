import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:roadwatch_navarra/screens/main_screen.dart';
import 'app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Establece la orientación preferida del dispositivo como retrato
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lista de carreteras',
      theme: AppTheme.lightTheme(),
      darkTheme: AppTheme.darkTheme(),
      home: const MainScreen(),
    );
  }
}
