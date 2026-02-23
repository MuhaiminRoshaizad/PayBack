import 'package:flutter/material.dart';

import '../../theme/glass_tokens.dart';
import 'glass_panel.dart';

class GlassIconButton extends StatelessWidget {
  const GlassIconButton({
    super.key,
    required this.icon,
    required this.surfaceColor,
    required this.borderColor,
    required this.iconColor,
  });

  final IconData icon;
  final Color surfaceColor;
  final Color borderColor;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return GlassPanel(
      borderRadius: GlassTokens.controlBorderRadius(),
      blur: GlassTokens.controlImageFilter(),
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          color: surfaceColor,
          borderRadius: GlassTokens.controlBorderRadius(),
          border: Border.all(color: borderColor, width: 1),
        ),
        child: Icon(icon, size: 21, color: iconColor),
      ),
    );
  }
}
