import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();

  static const Color _bgTopLight = Color(0xFFE3ECFF);
  static const Color _bgMidLight = Color(0xFFEFF4FF);
  static const Color _bgBottomLight = Color(0xFFF6FAFF);
  static const Color _glowBlueLight = Color(0x804DA3FF);
  static const Color _glowPinkLight = Color(0x66FF96BD);
  static const Color _glowMintLight = Color(0x6654E6C6);

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

  static const Color _glassSurfaceLight = Color.fromRGBO(255, 255, 255, 0.22);
  static const Color _glassSurfaceStrongLight = Color.fromRGBO(
    255,
    255,
    255,
    0.34,
  );
  static const Color _glassBorderLight = Color.fromRGBO(255, 255, 255, 0.40);
  static const Color _glassShadowLight = Color.fromRGBO(15, 23, 42, 0.14);

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
