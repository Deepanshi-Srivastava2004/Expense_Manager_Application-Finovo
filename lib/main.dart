import 'features/widgets/Navbar.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
<<<<<<< HEAD
import 'src/features/screens/input_screen.dart';
=======
// import 'features/widgets/input_screen.dart';
>>>>>>> 673811807a20f9bc435b3c8706e77de979648358

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
