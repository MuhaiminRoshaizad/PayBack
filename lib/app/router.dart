import 'package:flutter/material.dart';

import 'pages/app_shell_page.dart';

class AppRouter {
  const AppRouter._();

  static const String dashboard = '/';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case dashboard:
      default:
        return MaterialPageRoute<void>(
          builder: (_) => const AppShellPage(),
          settings: settings,
        );
    }
  }
}
