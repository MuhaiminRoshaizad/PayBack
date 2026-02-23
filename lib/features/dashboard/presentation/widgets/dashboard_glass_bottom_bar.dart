import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/glass_tokens.dart';
import '../../../../shared/widgets/glass/glass_panel.dart';

class DashboardGlassBottomBar extends StatelessWidget {
  const DashboardGlassBottomBar({
    super.key,
    required this.surfaceColor,
    required this.borderColor,
    required this.shadowColor,
    required this.textSecondary,
  });

  final Color surfaceColor;
  final Color borderColor;
  final Color shadowColor;
  final Color textSecondary;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GlassPanel(
      borderRadius: BorderRadius.circular(28),
      blur: GlassTokens.cardImageFilter(),
      child: Container(
        height: 72,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: surfaceColor,
          borderRadius: BorderRadius.circular(28),
          border: Border.all(color: borderColor, width: 1),
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              blurRadius: 32,
              offset: const Offset(0, 12),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: _GlassNavItem(
                icon: Icons.home_rounded,
                label: 'Home',
                active: true,
                textSecondary: textSecondary,
                activeSurface: surfaceColor,
              ),
            ),
            Expanded(
              child: _GlassNavItem(
                icon: Icons.receipt_long_rounded,
                label: 'Payments',
                textStyle: textTheme.labelLarge,
                textSecondary: textSecondary,
                activeSurface: surfaceColor,
              ),
            ),
            Expanded(
              child: _GlassNavItem(
                icon: Icons.person_rounded,
                label: 'Profile',
                textStyle: textTheme.labelLarge,
                textSecondary: textSecondary,
                activeSurface: surfaceColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GlassNavItem extends StatelessWidget {
  const _GlassNavItem({
    required this.icon,
    required this.label,
    required this.textSecondary,
    required this.activeSurface,
    this.active = false,
    this.textStyle,
  });

  final IconData icon;
  final String label;
  final Color textSecondary;
  final Color activeSurface;
  final bool active;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final activeColor = AppColors.accent;
    final inactiveColor = textSecondary;
    final color = active ? activeColor : inactiveColor;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
      decoration: BoxDecoration(
        color: active ? activeSurface : Colors.transparent,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 20, color: color),
          const SizedBox(height: 4),
          Text(
            label,
            style: (textStyle ?? Theme.of(context).textTheme.labelLarge)
                ?.copyWith(color: color),
          ),
        ],
      ),
    );
  }
}
