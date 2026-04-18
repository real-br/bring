import 'package:flutter/material.dart';

class BringTheme {
  static const primary = Color(0xFFAA2C32);
  static const primaryContainer = Color(0xFFFF7574);
  static const secondary = Color(0xFFFED000);
  static const tertiary = Color(0xFF7543A7);
  static const surface = Color(0xFFFFF4F4);
  static const onSurface = Color(0xFF4C212B);
  static const surfaceContainer = Color(0xFFFFE1E5);
  static const surfaceContainerLow = Color(0xFFFFECEE);
  static const surfaceContainerHigh = Color(0xFFFFD9DF);
  static const outline = Color(0xFFA06772);
  static const onSurfaceVariant = Color(0xFF814C57);

  static ThemeData get theme => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.light(
      primary: primary,
      primaryContainer: primaryContainer,
      secondary: secondary,
      tertiary: tertiary,
      surface: surface,
      onSurface: onSurface,
      outline: outline,
      onSurfaceVariant: onSurfaceVariant,
      surfaceContainerLow: surfaceContainerLow,
      surfaceContainerHigh: surfaceContainerHigh,
    ),
    scaffoldBackgroundColor: surface,
    appBarTheme: const AppBarTheme(
      backgroundColor: surface,
      foregroundColor: onSurface,
      elevation: 0,
    ),
    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 8,
      shadowColor: const Color(0xFF4C212B).withValues(alpha: 0.15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: primary,
      unselectedItemColor: outline,
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: primary,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: surfaceContainerLow,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: secondary.withValues(alpha: 0.2),
      labelStyle: const TextStyle(
        color: onSurface,
        fontWeight: FontWeight.w600,
        fontSize: 11,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      side: BorderSide.none,
    ),
  );
}
