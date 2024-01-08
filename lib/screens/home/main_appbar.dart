import 'package:flutter/material.dart';
import 'package:lynks_pos_system/routes/routes.dart';
import 'package:lynks_pos_system/util/constants.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  bool isMenuScreen = false;
  MainAppBar({
    super.key,
    this.isMenuScreen = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            isMenuScreen ? "Menus" : 'Tables',
            style: const TextStyle(fontSize: 20.0),
          ),
          Text(
            isMenuScreen ? "$totalMenuItems items" : "$totalTables tables",
            style: const TextStyle(fontSize: 10.0),
          ),
        ],
      ),
      leading: Visibility(
        visible: isMenuScreen,
        child: GestureDetector(
            onTap: (() {
              Navigator.pop(context);
            }),
            child: const Icon(Icons.arrow_back)),
      ),
      backgroundColor: darkBlue,
      foregroundColor: Colors.white,
      toolbarHeight: 100,
      actions: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(58, 72, 220, 1)),
            onPressed: () {
              Navigator.pushNamed(context, currentOrdersScreenRoute);
            },
            child: const Text('orders', style: TextStyle(color: Colors.white))),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(99, 79, 187, 1)),
              onPressed: () {
                Navigator.pushNamed(context, customersScreenRoute);
              },
              child: const Text('customers',
                  style: TextStyle(color: Colors.white))),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight((kToolbarHeight));
}
