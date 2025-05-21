import 'package:flutter/material.dart';

class ThemeSettings {
  static final Color seedColor = const Color(0xFF4FC3F7);

  final TextTheme _lightTextTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    displayMedium: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w600,
      color: Colors.black87,
    ),
    titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
    bodyMedium: TextStyle(fontSize: 16, color: Colors.black87),
    labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
  );

  final TextTheme _darkTextTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    displayMedium: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w600,
      color: Colors.white70,
    ),
    titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
    bodyMedium: TextStyle(fontSize: 16, color: Colors.white70),
    labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
  );

  final ElevatedButtonThemeData _elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      textStyle: const TextStyle(fontWeight: FontWeight.w600),
      elevation: 4,
    ),
  );

  TextTheme get lightTextTheme => _lightTextTheme;

  TextTheme get darkTextTheme => _darkTextTheme;

  ElevatedButtonThemeData get elevatedButtonTheme => _elevatedButtonTheme;
}
