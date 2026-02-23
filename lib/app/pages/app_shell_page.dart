import 'package:flutter/material.dart';

import '../../features/dashboard/presentation/pages/dashboard_page.dart';
import '../../features/payments/presentation/pages/payments_page.dart';
import '../../features/profile/presentation/pages/profile_page.dart';
import '../theme/app_colors.dart';
import '../widgets/app_bottom_nav_bar.dart';
import '../../shared/widgets/glass/glow_blob.dart';

class AppShellPage extends StatefulWidget {
  const AppShellPage({super.key});

  @override
  State<AppShellPage> createState() => _AppShellPageState();
}

class _AppShellPageState extends State<AppShellPage> {
  int _currentIndex = 0;

  static const List<Widget> _pages = [
    DashboardPage(),
    PaymentsPage(),
    ProfilePage(),
  ];

  void _onItemSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final glassSurfaceStrong = AppColors.glassSurfaceStrong(brightness);
    final glassBorder = AppColors.glassBorder(brightness);
    final glassShadow = AppColors.glassShadow(brightness);
    final textSecondary = AppColors.textSecondary(brightness);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.bgTop(brightness),
                  AppColors.bgMid(brightness),
                  AppColors.bgBottom(brightness),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: const [0.0, 0.45, 1.0],
              ),
            ),
          ),
          Positioned(
            top: -120,
            left: -70,
            child: GlowBlob(
              size: 280,
              color: AppColors.glowBlue(brightness),
            ),
          ),
          Positioned(
            top: 210,
            right: -95,
            child: GlowBlob(
              size: 260,
              color: AppColors.glowPink(brightness),
            ),
          ),
          Positioned(
            bottom: 90,
            left: -60,
            child: GlowBlob(
              size: 220,
              color: AppColors.glowMint(brightness),
            ),
          ),
          TweenAnimationBuilder<double>(
            key: ValueKey<int>(_currentIndex),
            tween: Tween<double>(begin: 0, end: 1),
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOutCubic,
            child: _pages[_currentIndex],
            builder: (context, value, child) {
              final offsetY = (1 - value) * 10;
              return Opacity(
                opacity: value,
                child: Transform.translate(
                  offset: Offset(0, offsetY),
                  child: child,
                ),
              );
            },
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: 18,
            child: SafeArea(
              top: false,
              child: AppBottomNavBar(
                currentIndex: _currentIndex,
                onItemSelected: _onItemSelected,
                surfaceColor: glassSurfaceStrong,
                borderColor: glassBorder,
                shadowColor: glassShadow,
                textSecondary: textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
