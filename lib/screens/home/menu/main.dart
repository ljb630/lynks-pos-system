import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lynks_pos_system/controllers/table_toggle_controller.dart';
import 'package:lynks_pos_system/routes/routes.dart';
import 'package:lynks_pos_system/screens/home/main_appbar.dart';
import 'package:lynks_pos_system/screens/home/menu/items_layout.dart';
import 'package:lynks_pos_system/screens/home/sidebar/main.dart';
import 'package:lynks_pos_system/util/constants.dart';
import 'package:lynks_pos_system/util/responsiveness.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({
    super.key,
  });

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int selected = -1;
  TabbleToggleController controller = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 400,
            child: GridView.count(
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
                        setState(() {
                          if (selected == index) {
                            selected = -1;
                            return;
                          }
                          selected = index;
                        });
                      },
                      child: Container(
                        // padding: const EdgeInsets.all(10),
                        color: Colors
                            .primaries[(index * 5) % Colors.primaries.length]
                            .shade600,
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
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
                            const Spacer(),
                            Visibility(
                              visible: index == selected,
                              child: Container(
                                height: double.maxFinite,
                                padding: const EdgeInsets.all(20),
                                color: Colors
                                    .primaries[
                                        (index * 5) % Colors.primaries.length]
                                    .shade400,
                                child: const Center(
                                  child: FaIcon(
                                    FontAwesomeIcons.angleDown,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                )),
          ),
          ItemsLayout(selected: selected)
        ],
      ),
    );
  }
}
