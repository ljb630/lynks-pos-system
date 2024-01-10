import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lynks_pos_system/controllers/table_toggle_controller.dart';
import 'package:lynks_pos_system/screens/home/main_appbar.dart';
import 'package:lynks_pos_system/screens/home/menu/main.dart';
import 'package:lynks_pos_system/screens/home/table/table.dart';
import 'package:lynks_pos_system/util/constants.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  final TabbleToggleController _toggleController = Get.find();
  final key = const Key("Layout");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MainAppBar(key: key),
        backgroundColor: deepDarkBlue,
        body: Obx(
          () => Container(
              child: _toggleController.isTable.value
                  ? const TableLayout()
                  : const MenuScreen()),
        ));
  }
}
