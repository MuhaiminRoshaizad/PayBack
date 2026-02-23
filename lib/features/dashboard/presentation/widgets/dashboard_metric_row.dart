import 'package:flutter/material.dart';

class DashboardMetricRow extends StatelessWidget {
  const DashboardMetricRow({
    super.key,
    required this.label,
    required this.value,
    required this.textSecondary,
    required this.valueColor,
  });

  final String label;
  final String value;
  final Color textSecondary;
  final Color valueColor;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: textTheme.bodyLarge?.copyWith(color: textSecondary),
        ),
        Text(
          value,
          style: textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w600,
            color: valueColor,
          ),
        ),
      ],
    );
  }
}
