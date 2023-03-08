import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme() {
    ColorScheme scheme =
        ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 255, 145, 0));

    return ThemeData(colorScheme: scheme, useMaterial3: true);
  }

  static ThemeData darkTheme() {
    ColorScheme scheme = ColorScheme.fromSeed(
        seedColor: Color.fromARGB(255, 0, 174, 255),
        brightness: Brightness.dark);

    return ThemeData(
        colorScheme: scheme,
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.black);
  }
}
