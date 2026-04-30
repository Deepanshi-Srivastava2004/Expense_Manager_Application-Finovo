import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'features/input/input_screen.dart';

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
      home: const InputScreen(),
    );
  }
}
