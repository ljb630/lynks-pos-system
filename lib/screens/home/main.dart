import 'package:flutter/material.dart';
import 'package:restaurant_pos/screens/home/sidebar/main.dart';
import 'package:restaurant_pos/screens/home/table.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          flex: 10,
          child: TableLayout(),
        ),
        Expanded(
          flex: 4,
          child: SideBar(),
        ),
      ],
    );
  }
}
