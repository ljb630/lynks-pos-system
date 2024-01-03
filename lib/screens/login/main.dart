import 'package:flutter/material.dart';
import 'package:restaurant_pos/screens/login/graphic.dart';
import 'package:restaurant_pos/screens/login/login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SafeArea(
      child: Row(
        children: [
          Expanded(
            flex: 10,
            child: LoginForm(),
          ),
          Expanded(
            flex: 11,
            child: GraphicScreen(),
          ),
        ],
      ),
    ));
  }
}
