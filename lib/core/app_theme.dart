import 'package:flutter/material.dart';

class AppPalette {
  static const Color primary = Color(0xFFB93938);
  static const Color onPrimary = Color(0xFFFFFFFF);

  static const Color secondary = Color(0xFFD65A59);
  static const Color onSecondary = Color(0xFFFFFFFF);

  static const Color tertiary = Color(0xFFFFC1B8);
  static const Color onTertiary = Color(0xFF1E1E1E);

  static const Color background = Color(0xFFFFF4F3);
  static const Color onBackground = Color(0xFF2A1717);

  static const Color surface = Color(0xFFFFFFFF);
  static const Color onSurface = Color(0xFF2A1717);

  static const Color error = Color(0xFFD32F2F);
  static const Color onError = Color(0xFFFFFFFF);

  static const Color outline = Color(0xFFD8B6B4);
  static const Color shadow = Color(0x1F000000);
}

class AppTheme {
  static final ColorScheme lightColorScheme = const ColorScheme(
    brightness: Brightness.light,
    primary: AppPalette.primary,
    onPrimary: AppPalette.onPrimary,
    secondary: AppPalette.secondary,
    onSecondary: AppPalette.onSecondary,
    tertiary: AppPalette.tertiary,
    onTertiary: AppPalette.onTertiary,
    error: AppPalette.error,
    onError: AppPalette.onError,
    surface: AppPalette.surface,
    onSurface: AppPalette.onSurface,
  );

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: lightColorScheme,
    scaffoldBackgroundColor: AppPalette.background,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppPalette.background,
      foregroundColor: AppPalette.onBackground,
      elevation: 0,
      centerTitle: true,
    ),
    cardTheme: CardThemeData(
      color: AppPalette.surface,
      elevation: 2,
      shadowColor: AppPalette.shadow,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
    dividerColor: AppPalette.outline,
  );
}
