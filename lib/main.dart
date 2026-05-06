/*
import 'src/features/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
// import 'src/features/screens/input_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox('transactions');

  runApp(const FinovoApp());
}

class FinovoApp extends StatelessWidget {
  const FinovoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finovo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0F1115),
      ),
      // home: const InputScreen(),
      home: MyNavBar(),
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

// Routes
import 'src/routes/app_routes.dart';
import 'src/routes/route_generator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox('transactions');

  runApp(const FinovoApp());
}

class FinovoApp extends StatelessWidget {
  const FinovoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finovo',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0F1115),
      ),

      // 🔥 NEW ROUTING SYSTEM
      initialRoute: AppRoutes.dashboard,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
