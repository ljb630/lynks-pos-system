import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lynks_pos_system/controllers/selected_table.dart';
import 'package:lynks_pos_system/controllers/table_toggle_controller.dart';
import 'package:lynks_pos_system/routes/routes.dart';
import 'package:lynks_pos_system/util/constants.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MainAppBar({required Key key})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _MainAppBarState createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print(_selectedTableController.customerDetails.value);
  }

  @override
  Widget build(BuildContext context) {
    final TabbleToggleController controller = Get.find();

    // final SelectedTableController selectedTableController = Get.find();
    return Obx(() => AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                controller.isTable.value ? "Table" : 'Menu',
                style: const TextStyle(fontSize: 20.0),
              ),
              Text(
                controller.isTable.value
                    ? "$totalTables tables"
                    : "$totalMenuItems items",
                style: const TextStyle(fontSize: 10.0),
              ),
            ],
          ),
          leading: Visibility(
            visible: !controller.isTable.value,
            child: GestureDetector(
              onTap: () {
                controller.bakcToTable();
              },
              child: const Icon(Icons.arrow_back),
            ),
          ),
          backgroundColor: darkBlue,
          foregroundColor: Colors.white,
          toolbarHeight: 100,
          actions: [
            !controller.isTable.value
                ? Container(
                    margin: const EdgeInsets.only(right: 10),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(10),
                    //   color: const Color.fromARGB(255, 75, 83, 96),
                    // ),
                    child: Text(controller.getCustomerName()))
                : const Text(""),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(58, 72, 220, 1),
              ),
              onPressed: () {
                Navigator.pushNamed(context, currentOrdersScreenRoute);
              },
              child: const Text(
                'orders',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(99, 79, 187, 1),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, customersScreenRoute);
                },
                child: const Text(
                  'customers',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight((kToolbarHeight));
}
