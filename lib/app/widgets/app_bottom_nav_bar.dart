import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../../shared/widgets/glass/glass_panel.dart';
import '../../shared/theme/glass_tokens.dart';

class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.pageValue,
    required this.onItemSelected,
    required this.surfaceColor,
    required this.borderColor,
    required this.shadowColor,
    required this.textSecondary,
  });

  final int currentIndex;
  final double pageValue;
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
        child: LayoutBuilder(
          builder: (context, constraints) {
            final segmentWidth = constraints.maxWidth / _items.length;
            final baseIndicatorWidth = segmentWidth - 12;
            final clampedPage = pageValue.clamp(
              0.0,
              (_items.length - 1).toDouble(),
            );
            final localFrac = (clampedPage - clampedPage.floorToDouble()).abs();
            final stretchT = (1 - ((localFrac - 0.5).abs() * 2)).clamp(0.0, 1.0);
            final stretch = 1 + (0.14 * stretchT);
            final indicatorWidth = baseIndicatorWidth * stretch;
            final baseLeft = (segmentWidth * clampedPage) + 6;
            final indicatorLeft = baseLeft - ((indicatorWidth - baseIndicatorWidth) / 2);

            return Stack(
              children: [
                Positioned(
                  left: indicatorLeft,
                  top: 8,
                  width: indicatorWidth,
                  height: 56,
                  child: TweenAnimationBuilder<double>(
                    tween: Tween<double>(begin: 0, end: stretchT),
                    duration: const Duration(milliseconds: 180),
                    curve: Curves.easeOutCubic,
                    builder: (context, value, _) {
                      return DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.24),
                            width: 0.8,
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.white.withValues(alpha: 0.34 + (value * 0.06)),
                              surfaceColor.withValues(alpha: 0.78),
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withValues(alpha: 0.08 + (value * 0.05)),
                              blurRadius: 18,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            margin: const EdgeInsets.only(top: 3),
                            height: 1.1,
                            width: indicatorWidth * 0.62,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(999),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.white.withValues(alpha: 0),
                                  Colors.white.withValues(alpha: 0.55),
                                  Colors.white.withValues(alpha: 0),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  children: List.generate(_items.length, (index) {
                    final item = _items[index];
                    return Expanded(
                      child: _GlassNavItem(
                        icon: item.icon,
                        label: item.label,
                        active: currentIndex == index,
                        textStyle: textTheme.labelLarge,
                        textSecondary: textSecondary,
                        onTap: () => onItemSelected(index),
                      ),
                    );
                  }),
                ),
              ],
            );
          },
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
    required this.onTap,
    this.active = false,
    this.textStyle,
  });

  final IconData icon;
  final String label;
  final Color textSecondary;
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
          color: Colors.transparent,
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
