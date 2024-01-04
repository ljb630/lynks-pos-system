import 'package:flutter/material.dart';
import 'package:lynks_pos_system/util/constants.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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

  @override
  Size get preferredSize => const Size.fromHeight((kToolbarHeight));
}
