import 'package:flutter/material.dart';

const int totalTables = 16;

const int totalMenuItems = 8;

const List<String> menuItems = [
  "Starter",
  "Main Course",
  "Dessert",
  "Drinks",
  "Beverages",
  "Snacks",
  "Soups",
  "Salads"
];
//Colors for the app
const Color deepDarkBlue = Color.fromRGBO(10, 16, 44, 1);
const Color darkBlue = Color.fromRGBO(5, 10, 25, 1);

GlobalKey<NavigatorState> pageKey = GlobalKey();
