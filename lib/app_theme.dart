import 'package:flutter/material.dart';

// lightTheme() y darkTheme() devuelven temas claros y oscuros, respectivamente.
// Con un esquema de color generado a partir del seleccionado (seedColor), y usan Material3 (useMaterial3)
class AppTheme {
  static ThemeData lightTheme() {
    ColorScheme scheme =
        ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 0, 102, 255));

    return ThemeData(colorScheme: scheme, useMaterial3: true);
  }

  static ThemeData darkTheme() {
    ColorScheme scheme = ColorScheme.fromSeed(
        seedColor: const Color.fromARGB(255, 0, 102, 255),
        brightness: Brightness.dark);

    return ThemeData(
        colorScheme: scheme,
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.black);
  }
}
