import 'package:flutter/material.dart';
import 'package:lynks_pos_system/home.dart';
import 'package:lynks_pos_system/screens/current_orders/main.dart';
import 'package:lynks_pos_system/screens/customers/main.dart';
import 'package:lynks_pos_system/screens/home/main.dart';
import 'package:lynks_pos_system/screens/home/menu/main.dart';
import 'package:lynks_pos_system/screens/home/table/table.dart';
import 'package:lynks_pos_system/screens/login/main.dart';

const String initialRoute = '/';
const String loginScreenRoute = '/login';
const String homeScreenRoute = '/home';
const String currentOrdersScreenRoute = '/current_orders';
const String customersScreenRoute = '/customers';

const String tableLayoutRoute = '/table';
const String menuScreenRoute = '/menu';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case initialRoute:
      return MaterialPageRoute(builder: (context) => const Home());
    case loginScreenRoute:
      return MaterialPageRoute(builder: (context) => const LoginScreen());
    case homeScreenRoute:
      return MaterialPageRoute(builder: (context) => const HomeScreen());
    case currentOrdersScreenRoute:
      return MaterialPageRoute(
          builder: (context) => const CurrentOrdersScreen());
    case customersScreenRoute:
      return MaterialPageRoute(builder: (context) => const CustomerScreen());

    default:
      throw const FormatException('Route not found!');
  }
}
