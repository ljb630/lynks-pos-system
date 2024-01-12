import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lynks_pos_system/controllers/selected_table.dart';
import 'package:lynks_pos_system/controllers/table_toggle_controller.dart';
import 'package:lynks_pos_system/util/constants.dart';
import 'package:lynks_pos_system/util/responsiveness.dart';

class ItemsLayout extends StatefulWidget {
  final int selected;
  const ItemsLayout({super.key, required this.selected});

  @override
  State<ItemsLayout> createState() => _ItemsLayoutState();
}

class _ItemsLayoutState extends State<ItemsLayout> {
  @override
  Widget build(BuildContext context) {
    // SelectedTableController selectedTableController = Get.find();
    TabbleToggleController controller = Get.find();

    return SizedBox(
      height: 500,
      // padding: const EdgeInsets.all(10),

      child: widget.selected == -1
          ? const Text("select item")
          : GridView.count(
              crossAxisCount: ResponsiveWidget.isSmallScreen(context)
                  ? 1
                  : ResponsiveWidget.isMediumScreen(context)
                      ? 3
                      : 4,
              childAspectRatio: 1.6,
              mainAxisSpacing: 7,
              crossAxisSpacing: 7,
              padding: const EdgeInsets.all(10),
              children: List.generate(
                menuSubItems[menuItems[widget.selected]]!.length,
                (index) {
                  final String name =
                      menuSubItems[menuItems[widget.selected]]![index]["name"];
                  final double price =
                      menuSubItems[menuItems[widget.selected]]![index]
                              ["price"] +
                          0.0;
                  return Container(
                    // padding: const EdgeInsets.all(10),
                    color: const Color.fromARGB(149, 97, 101, 115),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  name,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.clip,
                                  ),
                                ),
                                Text(
                                  price.toString(),
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white60),
                                ),
                                const Spacer(),
                                const Text(
                                  "Orders → Kitchen",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Obx(
                            () => Container(
                                // margin: const EdgeInsets.all(8),
                                alignment: Alignment.topLeft,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                      color: deepDarkBlue,
                                      onPressed: () {
                                        controller.addItemQuantityByName(
                                            name, price);
                                      },
                                      icon: const Icon(
                                        Icons.add,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      "${controller.getItemQuantityByName(name)}",
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white60),
                                    ),
                                    IconButton(
                                      color: deepDarkBlue,
                                      onPressed: () {
                                        controller
                                            .decreaseItemQuantityByName(name);
                                      },
                                      icon: const Icon(
                                        Icons.remove,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                )),
                          )
                        ],
                      ),
                    ),
                  );
                },
              )),
    );
  }
}
