import 'package:flutter/material.dart';
import 'package:lynks_pos_system/screens/home/layout.dart';
import 'package:lynks_pos_system/screens/home/sidebar/main.dart';
import 'package:lynks_pos_system/util/responsiveness.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: ResponsiveWidget(
        smallScreen: Layout(),
        mediumScreen: Row(
          children: [
            Expanded(
              flex: 10,
              child: Layout(),
            ),
            Expanded(
              flex: 4,
              child: SideBar(),
            ),
          ],
        ),
        largeScreen: Row(
          children: [
            Expanded(
              flex: 10,
              child: Layout(),
            ),
            Expanded(
              flex: 4,
              child: SideBar(),
            ),
          ],
        ),
      ),
    );
  }
}
