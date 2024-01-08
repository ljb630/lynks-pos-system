import 'package:flutter/material.dart';
import 'package:lynks_pos_system/routes/routes.dart';
import 'package:lynks_pos_system/screens/home/main_appbar.dart';
import 'package:lynks_pos_system/screens/home/menu/main.dart';
import 'package:lynks_pos_system/screens/home/sidebar/main.dart';
import 'package:lynks_pos_system/screens/home/table/table.dart';
import 'package:lynks_pos_system/util/constants.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  var keyOne = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      backgroundColor: deepDarkBlue,
      body: PopScope(
        // canPop: true,
        child: Navigator(
          key: pageKey,
          onGenerateRoute: (routeSettings) {
            Widget page;
            switch (routeSettings.name) {
              case tableLayoutRoute:
                page = const TableLayout();
                break;
              case menuScreenRoute:
                page = const MenuScreen();
                break;
              default:
                page = const TableLayout();
            }
            return MaterialPageRoute(builder: ((context) => page));
          },
          initialRoute: tableLayoutRoute,
        ),
      ),
    );
  }
}
