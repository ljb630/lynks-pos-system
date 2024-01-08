import 'package:flutter/material.dart';
import 'package:lynks_pos_system/screens/current_orders/main.dart';
import 'package:lynks_pos_system/screens/customers/main.dart';
import 'package:lynks_pos_system/screens/home/main.dart';
import 'package:lynks_pos_system/screens/login/main.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const LoginScreen();
  }
}
