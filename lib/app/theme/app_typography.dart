import 'package:flutter/material.dart';

class AppTypography {
  const AppTypography._();

  static const String _fontFamily = '.SF Pro Text';

  static TextTheme textTheme({required Color primaryText}) {
    const base = TextStyle(
      fontFamily: _fontFamily,
      letterSpacing: -0.2,
      height: 1.25,
    );

    return TextTheme(
      displaySmall: base.copyWith(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: primaryText,
      ),
      headlineSmall: base.copyWith(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: primaryText,
      ),
      titleMedium: base.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: primaryText,
      ),
      bodyLarge: base.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: primaryText,
      ),
      labelLarge: base.copyWith(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: primaryText,
      ),
      labelMedium: base.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: primaryText,
      ),
    );
  }
}
