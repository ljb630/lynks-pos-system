import 'package:flutter/material.dart';
import 'package:lynks_pos_system/home.dart';
import 'package:lynks_pos_system/screens/home/main.dart';
import 'package:lynks_pos_system/screens/login/main.dart';

const String initialRoute = '/';
const String loginScreenRoute = '/login';
const String homeScreenRoute = '/home';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case initialRoute:
      return MaterialPageRoute(builder: (context) => const Home());
    case loginScreenRoute:
      return MaterialPageRoute(builder: (context) => const LoginScreen());
    case homeScreenRoute:
      return MaterialPageRoute(builder: (context) => const HomeScreen());

    default:
      throw const FormatException('Route not found!');
  }
}
