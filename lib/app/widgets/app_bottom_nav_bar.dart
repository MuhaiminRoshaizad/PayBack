import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/glass_tokens.dart';
import '../../shared/widgets/glass/glass_panel.dart';

class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onItemSelected,
    required this.surfaceColor,
    required this.borderColor,
    required this.shadowColor,
    required this.textSecondary,
  });

  final int currentIndex;
  final ValueChanged<int> onItemSelected;
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
          children: List.generate(_items.length, (index) {
            final item = _items[index];
            return Expanded(
              child: _GlassNavItem(
                icon: item.icon,
                label: item.label,
                active: currentIndex == index,
                textStyle: textTheme.labelLarge,
                textSecondary: textSecondary,
                activeSurface: surfaceColor,
                onTap: () => onItemSelected(index),
              ),
            );
          }),
        ),
      ),
    );
  }
}

const List<_NavItemData> _items = [
  _NavItemData(icon: Icons.home_rounded, label: 'Home'),
  _NavItemData(icon: Icons.receipt_long_rounded, label: 'Payments'),
  _NavItemData(icon: Icons.person_rounded, label: 'Profile'),
];

class _NavItemData {
  const _NavItemData({required this.icon, required this.label});

  final IconData icon;
  final String label;
}

class _GlassNavItem extends StatelessWidget {
  const _GlassNavItem({
    required this.icon,
    required this.label,
    required this.textSecondary,
    required this.activeSurface,
    required this.onTap,
    this.active = false,
    this.textStyle,
  });

  final IconData icon;
  final String label;
  final Color textSecondary;
  final Color activeSurface;
  final VoidCallback onTap;
  final bool active;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final activeColor = AppColors.accent;
    final inactiveColor = textSecondary;
    final color = active ? activeColor : inactiveColor;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 280),
        curve: Curves.easeOutCubic,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
        decoration: BoxDecoration(
          color: active ? activeSurface : Colors.transparent,
          borderRadius: BorderRadius.circular(18),
        ),
        child: AnimatedScale(
          duration: const Duration(milliseconds: 240),
          curve: Curves.easeOutCubic,
          scale: active ? 1.0 : 0.96,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 20, color: color),
              const SizedBox(height: 4),
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 220),
                curve: Curves.easeOutCubic,
                style:
                    (textStyle ??
                            Theme.of(context).textTheme.labelLarge ??
                            const TextStyle(fontSize: 13))
                        .copyWith(
                          color: color,
                          fontWeight:
                              active ? FontWeight.w700 : FontWeight.w500,
                        ),
                child: Text(label),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
