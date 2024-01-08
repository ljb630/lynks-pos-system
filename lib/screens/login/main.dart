import 'package:flutter/material.dart';
import 'package:lynks_pos_system/screens/login/graphic.dart';
import 'package:lynks_pos_system/screens/login/login_form.dart';
import 'package:lynks_pos_system/util/responsiveness.dart';

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
      child: ResponsiveWidget(
        smallScreen: LoginForm(),
        mediumScreen: Row(
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
        largeScreen: Row(
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
      ),
    ));
  }
}
