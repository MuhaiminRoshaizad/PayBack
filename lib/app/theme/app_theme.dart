import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_typography.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData light() {
    return _build(Brightness.light);
  }

  static ThemeData dark() {
    return _build(Brightness.dark);
  }

  static ThemeData _build(Brightness brightness) {
    final textPrimary = AppColors.textPrimary(brightness);
    final textTheme = AppTypography.textTheme(primaryText: textPrimary);

    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.accent,
      brightness: brightness,
      primary: AppColors.accent,
    ).copyWith(
      error: AppColors.danger,
      onPrimary: Colors.white,
      onSurface: textPrimary,
      outlineVariant: AppColors.glassBorder(brightness),
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      textTheme: textTheme,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        foregroundColor: textPrimary,
        titleTextStyle: textTheme.titleMedium,
      ),
      cardColor: AppColors.glassSurfaceStrong(brightness),
      dividerColor: AppColors.glassBorder(brightness),
      iconTheme: IconThemeData(color: textPrimary),
    );
  }
}
