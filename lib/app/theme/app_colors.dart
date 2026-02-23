import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();

  static const Color _bgTopLight = Color(0xFFDDE9FF);
  static const Color _bgMidLight = Color(0xFFECF2FF);
  static const Color _bgBottomLight = Color(0xFFF4F8FF);
  static const Color _glowBlueLight = Color(0x664DA3FF);
  static const Color _glowPinkLight = Color(0x4DFF96BD);
  static const Color _glowMintLight = Color(0x4D54E6C6);

  static const Color _bgTopDark = Color(0xFF0C1221);
  static const Color _bgMidDark = Color(0xFF111A2E);
  static const Color _bgBottomDark = Color(0xFF0A0F1C);
  static const Color _glowBlueDark = Color(0x663F6EFF);
  static const Color _glowPinkDark = Color(0x5CF05FA6);
  static const Color _glowMintDark = Color(0x5448CBAE);

  static const Color textPrimaryLight = Color(0xFF0F172A);
  static const Color textSecondaryLight = Color(0xFF475569);
  static const Color textPrimaryDark = Color(0xFFE8EEFF);
  static const Color textSecondaryDark = Color(0xFFA8B3CF);

  static const Color accent = Color(0xFF2F6BFF);
  static const Color success = Color(0xFF16A34A);
  static const Color warning = Color(0xFFD97706);
  static const Color danger = Color(0xFFDC2626);

  static const Color _glassSurfaceLight = Color.fromRGBO(255, 255, 255, 0.30);
  static const Color _glassSurfaceStrongLight = Color.fromRGBO(
    255,
    255,
    255,
    0.48,
  );
  static const Color _glassBorderLight = Color.fromRGBO(255, 255, 255, 0.58);
  static const Color _glassShadowLight = Color.fromRGBO(15, 23, 42, 0.12);

  static const Color _glassSurfaceDark = Color.fromRGBO(255, 255, 255, 0.08);
  static const Color _glassSurfaceStrongDark = Color.fromRGBO(255, 255, 255, 0.14);
  static const Color _glassBorderDark = Color.fromRGBO(255, 255, 255, 0.16);
  static const Color _glassShadowDark = Color.fromRGBO(0, 0, 0, 0.34);

  static Color bgTop(Brightness brightness) {
    return brightness == Brightness.dark ? _bgTopDark : _bgTopLight;
  }

  static Color bgMid(Brightness brightness) {
    return brightness == Brightness.dark ? _bgMidDark : _bgMidLight;
  }

  static Color bgBottom(Brightness brightness) {
    return brightness == Brightness.dark ? _bgBottomDark : _bgBottomLight;
  }

  static Color glowBlue(Brightness brightness) {
    return brightness == Brightness.dark ? _glowBlueDark : _glowBlueLight;
  }

  static Color glowPink(Brightness brightness) {
    return brightness == Brightness.dark ? _glowPinkDark : _glowPinkLight;
  }

  static Color glowMint(Brightness brightness) {
    return brightness == Brightness.dark ? _glowMintDark : _glowMintLight;
  }

  static Color textPrimary(Brightness brightness) {
    return brightness == Brightness.dark ? textPrimaryDark : textPrimaryLight;
  }

  static Color textSecondary(Brightness brightness) {
    return brightness == Brightness.dark ? textSecondaryDark : textSecondaryLight;
  }

  static Color glassSurface(Brightness brightness) {
    return brightness == Brightness.dark ? _glassSurfaceDark : _glassSurfaceLight;
  }

  static Color glassSurfaceStrong(Brightness brightness) {
    return brightness == Brightness.dark
        ? _glassSurfaceStrongDark
        : _glassSurfaceStrongLight;
  }

  static Color glassBorder(Brightness brightness) {
    return brightness == Brightness.dark ? _glassBorderDark : _glassBorderLight;
  }

  static Color glassShadow(Brightness brightness) {
    return brightness == Brightness.dark ? _glassShadowDark : _glassShadowLight;
  }
}
