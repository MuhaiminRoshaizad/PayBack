import 'package:flutter/material.dart';

import '../features/dashboard/presentation/pages/dashboard_page.dart';

class AppRouter {
  const AppRouter._();

  static const String dashboard = '/';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case dashboard:
      default:
        return MaterialPageRoute<void>(
          builder: (_) => const DashboardPage(),
          settings: settings,
        );
    }
  }
}
