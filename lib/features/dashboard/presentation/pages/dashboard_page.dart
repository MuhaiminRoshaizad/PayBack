import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../shared/widgets/glass/glass_icon_button.dart';
import '../../../../shared/widgets/glass/glass_panel.dart';
import '../../../../shared/theme/glass_tokens.dart';
import '../widgets/dashboard_metric_row.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final brightness = Theme.of(context).brightness;
    final textPrimary = AppColors.textPrimary(brightness);
    final textSecondary = AppColors.textSecondary(brightness);
    final glassSurface = AppColors.glassSurface(brightness);
    final glassSurfaceStrong = AppColors.glassSurfaceStrong(brightness);
    final glassBorder = AppColors.glassBorder(brightness);
    final glassShadow = AppColors.glassShadow(brightness);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 14, 16, 120),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'PayBack',
                  style: textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: textPrimary,
                  ),
                ),
                const Spacer(),
                GlassIconButton(
                  icon: Icons.notifications_none,
                  surfaceColor: glassSurface,
                  borderColor: glassBorder,
                  iconColor: textPrimary,
                ),
              ],
            ),
            const SizedBox(height: 18),
            GlassPanel(
              borderRadius: GlassTokens.cardBorderRadius(),
              blur: GlassTokens.cardImageFilter(),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [glassSurfaceStrong, glassSurface],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: GlassTokens.cardBorderRadius(),
                  border: Border.all(color: glassBorder, width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: glassShadow,
                      blurRadius: 32,
                      offset: const Offset(0, 12),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Remaining Balance',
                      style: textTheme.labelLarge?.copyWith(
                        color: textSecondary.withValues(alpha: 0.86),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'RM 4,500',
                      style: textTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.w900,
                        letterSpacing: -0.45,
                      ),
                    ),
                    const SizedBox(height: 18),
                    DashboardMetricRow(
                      label: 'Total Paid',
                      value: 'RM 500',
                      valueColor: AppColors.success,
                      textSecondary: textSecondary,
                    ),
                    const SizedBox(height: 12),
                    DashboardMetricRow(
                      label: 'Monthly Target',
                      value: 'RM 500',
                      valueColor: textPrimary,
                      textSecondary: textSecondary,
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
