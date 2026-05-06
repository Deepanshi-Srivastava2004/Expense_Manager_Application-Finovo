import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'src/features/screens/navbar.dart';
import 'src/core/theme/app_theme.dart';

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

      theme: AppTheme.darkTheme,

      home: const MyNavBar(),
    );
  }
}
