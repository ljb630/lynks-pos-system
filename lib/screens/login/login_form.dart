import 'package:flutter/material.dart';
import 'package:lynks_pos_system/routes/routes.dart';
import 'package:lynks_pos_system/screens/login/input_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(40),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            InputField(
                controller: emailController,
                hintText: "example@gmail.com",
                obscureText: false),
            const SizedBox(height: 16),
            InputField(
                controller: passwordController,
                hintText: "@#*%",
                obscureText: true),
            const SizedBox(height: 50),
            Container(
              width: double.infinity,
              height: 48,
              decoration: BoxDecoration(
                color: Colors.red.shade800,
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: TextButton(
                onPressed: () {
                  // Add your sign-in logic here
                  print("${emailController.text} ${passwordController.text}");
                  Navigator.pushNamed(context, homeScreenRoute);
                },
                child: const Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
