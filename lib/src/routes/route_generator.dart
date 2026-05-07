import 'package:finovo/src/features/widgets/main_layout.dart';
import 'package:flutter/material.dart';
import '../features/screens/dashboard.dart';
import '../features/screens/history_page.dart';
import '../features/screens/input_screen.dart';
// import '../features/widgets/navbar.dart';
import 'app_routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.dashboard:
        return MaterialPageRoute(
          builder: (_) => const MainLayout(child: DashboardPage()),
        );

      case AppRoutes.history:
        return MaterialPageRoute(
          builder: (_) => const MainLayout(child: HistoryPage()),
        );

      case AppRoutes.input:
        return MaterialPageRoute(
          builder: (_) => const MainLayout(child: InputScreen()),
        );

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Page not found'))),
        );
    }
  }
}
