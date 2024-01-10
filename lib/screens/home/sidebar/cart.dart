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
        List<OrderModel> orders =
            toggleController.selectedCustomer.value.orders;

        return toggleController.isOrderEmpty()
            ? const EmptyCart()
            : ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: orders.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 2),
                    height: 80,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: const Color.fromARGB(149, 97, 101, 115)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${index + 1}. ${orders[index].itemName}",
                              style: const TextStyle(fontSize: 16),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: (() {
                                    toggleController.decreaseItemQuantityByName(
                                        orders[index].itemName);
                                  }),
                                  icon: const Icon(Icons.remove),
                                  color: Colors.white,
                                  iconSize: 16,
                                ),
                                Text(
                                  orders[index].quantity.toString(),
                                  style: const TextStyle(fontSize: 16),
                                ),
                                IconButton(
                                  onPressed: (() {
                                    toggleController.addItemQuantityByName(
                                        orders[index].itemName,
                                        orders[index].price);
                                  }),
                                  icon: const Icon(Icons.add),
                                  color: Colors.white,
                                  iconSize: 16,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Text(
                          orders[index].price.toString(),
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  );
                },
              );
      }
    });
  }
}
