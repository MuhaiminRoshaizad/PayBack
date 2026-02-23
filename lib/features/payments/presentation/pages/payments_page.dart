import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';

class PaymentsPage extends StatelessWidget {
  const PaymentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final textPrimary = AppColors.textPrimary(brightness);
    final textSecondary = AppColors.textSecondary(brightness);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 18, 20, 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Payments',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: textPrimary,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Payment history UI goes here',
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(color: textSecondary),
            ),
          ],
        ),
      ),
    );
  }
}
