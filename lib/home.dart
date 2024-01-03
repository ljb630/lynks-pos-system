import 'package:flutter/material.dart';
import 'package:restaurant_pos/screens/home/main.dart';
import 'package:restaurant_pos/screens/login/main.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const HomeScreen();
  }
}
