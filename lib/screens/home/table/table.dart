import 'package:flutter/material.dart';
import 'package:lynks_pos_system/screens/home/main_appbar.dart';
import 'package:lynks_pos_system/screens/home/sidebar/main.dart';
import 'package:lynks_pos_system/screens/home/table/table_section.dart';
import 'package:lynks_pos_system/util/constants.dart';

class TableLayout extends StatefulWidget {
  const TableLayout({super.key});

  @override
  State<TableLayout> createState() => _TableLayoutState();
}

class _TableLayoutState extends State<TableLayout> {
  @override
  Widget build(BuildContext context) {
    return const TableSection();
  }
}
