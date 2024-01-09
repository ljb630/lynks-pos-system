import 'package:flutter/material.dart';
import 'package:lynks_pos_system/home.dart';
import 'package:lynks_pos_system/routes/routes.dart';
import 'package:lynks_pos_system/util/init_controllers.dart' as init;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lynks POS System',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: generateRoute,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        textTheme: Typography().white,
      ),
      home: const Home(),
    );
  }
}
