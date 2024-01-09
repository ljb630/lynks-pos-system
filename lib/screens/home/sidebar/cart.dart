import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lynks_pos_system/controllers/selected_table.dart';
import 'package:lynks_pos_system/controllers/table_toggle_controller.dart';
import 'package:lynks_pos_system/models/order_modal.dart';
import 'package:lynks_pos_system/screens/home/sidebar/empty_cart.dart';
import 'package:lynks_pos_system/util/constants.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  TabbleToggleController toggleController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (toggleController.isTable.value) {
        return const EmptyCart();
      } else {
        print("changeo");
        return toggleController.isOrderEmpty()
            ? const EmptyCart()
            : ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount:
                    toggleController.selectedCustomer.value.orders.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 50,
                    color: deepDarkBlue,
                    child: Center(
                        child: Text(toggleController
                            .selectedCustomer.value.orders[index].itemName)),
                  );
                },
              );
      }
    });
  }
}
