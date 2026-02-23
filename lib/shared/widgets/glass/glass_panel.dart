import 'dart:ui';

import 'package:flutter/material.dart';

class GlassPanel extends StatelessWidget {
  const GlassPanel({
    super.key,
    required this.borderRadius,
    required this.blur,
    required this.child,
  });

  final BorderRadius borderRadius;
  final ImageFilter blur;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: BackdropFilter(
        filter: blur,
        child: child,
      ),
    );
  }
}
