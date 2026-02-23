import 'dart:ui';

import 'package:flutter/material.dart';

class GlassTokens {
  const GlassTokens._();

  static const double cardRadius = 24;
  static const double controlRadius = 20;

  static const double cardBlur = 24;
  static const double controlBlur = 20;

  static BorderRadius cardBorderRadius() {
    return BorderRadius.circular(cardRadius);
  }

  static BorderRadius controlBorderRadius() {
    return BorderRadius.circular(controlRadius);
  }

  static ImageFilter cardImageFilter() {
    return ImageFilter.blur(sigmaX: cardBlur, sigmaY: cardBlur);
  }

  static ImageFilter controlImageFilter() {
    return ImageFilter.blur(sigmaX: controlBlur, sigmaY: controlBlur);
  }
}
