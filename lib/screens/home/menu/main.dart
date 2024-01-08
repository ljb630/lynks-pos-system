import 'package:flutter/material.dart';
import 'package:lynks_pos_system/routes/routes.dart';
import 'package:lynks_pos_system/screens/home/main_appbar.dart';
import 'package:lynks_pos_system/screens/home/sidebar/main.dart';
import 'package:lynks_pos_system/util/constants.dart';
import 'package:lynks_pos_system/util/responsiveness.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return const ItemsLayout();
  }
}

class ItemsLayout extends StatelessWidget {
  const ItemsLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: ResponsiveWidget.isSmallScreen(context)
            ? 2
            : ResponsiveWidget.isMediumScreen(context)
                ? 3
                : 4,
        childAspectRatio: 1.6,
        mainAxisSpacing: 7,
        crossAxisSpacing: 7,
        padding: const EdgeInsets.all(10),
        children: List.generate(
          totalMenuItems,
          (index) {
            return GestureDetector(
              onTap: () {
                // Navigator.pushNamed(context, tableLayoutRoute);
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                color: Colors
                    .primaries[(index * 5) % Colors.primaries.length].shade600,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      menuItems[index],
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    const Text("10 items")
                  ],
                ),
              ),
            );
          },
        ));
  }
}
