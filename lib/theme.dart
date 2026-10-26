import 'package:flutter/material.dart';

/// StudyPulse colors and typography.
class AppTheme {
  static const primary = Color(0xFF3B5BDB);
  static const accent = Color(0xFFF59F00);
  static const danger = Color(0xFFE03131);

  static ThemeData light() => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: primary),
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          bodyMedium: TextStyle(fontSize: 15),
        ),
      );

  static ThemeData dark() => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: primary, brightness: Brightness.dark),
      );
}
