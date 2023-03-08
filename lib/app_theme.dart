import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme() {
    ColorScheme scheme =
        ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 255, 196, 0));

    return ThemeData(colorScheme: scheme, useMaterial3: true);
  }

  static ThemeData darkTheme() {
    ColorScheme scheme = ColorScheme.fromSeed(
        seedColor: const Color.fromARGB(255, 17, 0, 255),
        brightness: Brightness.dark);

    return ThemeData(
        colorScheme: scheme,
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.black);
  }
}
