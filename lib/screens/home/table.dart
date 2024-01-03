import 'package:flutter/material.dart';
import 'package:restaurant_pos/screens/home/table_section.dart';
import 'package:restaurant_pos/util/constants.dart';

class TableLayout extends StatefulWidget {
  const TableLayout({super.key});

  @override
  State<TableLayout> createState() => _TableLayoutState();
}

class _TableLayoutState extends State<TableLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBlue,
      appBar: tableAppBar(),
      body: const TableSection(),
    );
  }

  AppBar tableAppBar() {
    return AppBar(
      title: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tables',
            style: TextStyle(fontSize: 20.0),
          ),
          Text(
            "$totalTables tables",
            style: TextStyle(fontSize: 10.0),
          ),
        ],
      ),
      leading: const Icon(Icons.arrow_back),
      backgroundColor: darkBlue,
      foregroundColor: Colors.white,
      toolbarHeight: 100,
      actions: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(58, 72, 220, 1)),
            onPressed: () {},
            child: const Text('orders', style: TextStyle(color: Colors.white))),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(99, 79, 187, 1)),
              onPressed: () {},
              child: const Text('customers',
                  style: TextStyle(color: Colors.white))),
        ),
      ],
    );
  }
}
