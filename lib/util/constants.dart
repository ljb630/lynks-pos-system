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

const Map<String, List<Map<String, dynamic>>> menuSubItems = {
  "Starter": [
    {"name": "Paneer Tikka", "price": 100},
    {"name": "Paneer Chilli", "price": 100},
    {"name": "Paneer Manchurian", "price": 100},
    {"name": "Paneer Pakoda", "price": 100},
    {"name": "Chicken 65", "price": 300},
  ],
  "Main Course": [
    {"name": "Paneer Tikka Masala", "price": 100},
    {"name": "Paneer Butter Masala", "price": 100},
    {"name": "Paneer Kadai", "price": 100},
    {"name": "Paneer Bhurji", "price": 100},
    {"name": "Chicken Tikka Masala", "price": 300},
  ],
  "Dessert": [
    {"name": "Gulab Jamun", "price": 130},
    {"name": "Rasgulla", "price": 100},
    {"name": "Rasmalai", "price": 120},
    {"name": "Kheer", "price": 100},
    {"name": "Ice Cream", "price": 100},
  ],
  "Drinks": [
    {"name": "Coke", "price": 100},
    {"name": "Pepsi", "price": 100},
    {"name": "Sprite", "price": 100},
    {"name": "Fanta", "price": 100},
    {"name": "Thumbs Up", "price": 100},
  ],
  "Beverages": [
    {"name": "Tea", "price": 100},
    {"name": "Coffee", "price": 100},
    {"name": "Hot Chocolate", "price": 100},
    {"name": "Milk", "price": 100},
    {"name": "Lassi", "price": 100},
  ],
  "Snacks": [
    {"name": "Samosa", "price": 100},
    {"name": "Kachori", "price": 100},
    {"name": "Pakoda", "price": 100},
    {"name": "Bread Pakoda", "price": 100},
    {"name": "Bread Roll", "price": 100},
  ],
  "Soups": [
    {"name": "Tomato Soup", "price": 100},
    {"name": "Sweet Corn Soup", "price": 100},
    {"name": "Hot and Sour Soup", "price": 100},
    {"name": "Manchow Soup", "price": 100},
    {"name": "Chicken Soup", "price": 100},
  ],
  "Salads": [
    {"name": "Green Salad", "price": 100},
    {"name": "Fruit Salad", "price": 100},
    {"name": "Chicken Salad", "price": 100},
    {"name": "Egg Salad", "price": 100},
    {"name": "Potato Salad", "price": 100},
  ],
};

//Colors for the app
const Color deepDarkBlue = Color.fromRGBO(10, 16, 44, 1);
const Color darkBlue = Color.fromRGBO(5, 10, 25, 1);
