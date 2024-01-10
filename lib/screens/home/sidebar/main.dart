import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lynks_pos_system/controllers/customers_controller.dart';
import 'package:lynks_pos_system/controllers/table_toggle_controller.dart';
import 'package:lynks_pos_system/screens/home/sidebar/cart.dart';
import 'package:lynks_pos_system/screens/home/sidebar/custom_text_button.dart';
import 'package:lynks_pos_system/screens/home/sidebar/empty_cart.dart';
import 'package:lynks_pos_system/screens/home/sidebar/place_order_button.dart';
import 'package:lynks_pos_system/util/constants.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  // TabbleToggleController toggleController = Get.find();

  @override
  Widget build(BuildContext context) {
    TabbleToggleController toggleController = Get.find();
    return Scaffold(
        backgroundColor: deepDarkBlue,
        resizeToAvoidBottomInset: false,
        appBar: sideAppBar(),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 60,
                decoration: const BoxDecoration(
                    border: BorderDirectional(bottom: BorderSide())),
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Obx(
                          () => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                toggleController.isTable.value
                                    ? 'Table'
                                    : "Table ${toggleController.selectedCustomer.value.tableNo}",
                                style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                  toggleController.isTable.value
                                      ? 'Customer Name'
                                      : toggleController
                                          .selectedCustomer.value.name
                                          .toString(),
                                  style: const TextStyle(fontSize: 12))
                            ],
                          ),
                        )),
                    const FaIcon(FontAwesomeIcons.angleDown,
                        color: Colors.white, size: 20),
                    const SizedBox(width: 20),
                    const FaIcon(FontAwesomeIcons.trashCan,
                        color: Colors.white, size: 20),
                    const SizedBox(width: 20),
                    const FaIcon(FontAwesomeIcons.penToSquare,
                        color: Colors.white, size: 20),
                  ],
                ),
              ),
              const Expanded(flex: 1, child: Cart()),
              SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: Column(
                    children: [
                      const Row(
                        children: <Widget>[
                          Expanded(
                            child: CustomTextButton(
                                text: "Discount",
                                color: Color.fromRGBO(19, 23, 52, 0.8)),
                          ),
                          Expanded(
                            child: CustomTextButton(
                                text: "Cash",
                                color: Color.fromRGBO(19, 23, 52, 0.8)),
                          ),
                          Expanded(
                            child: CustomTextButton(
                                text: "UPI",
                                color: Color.fromRGBO(19, 23, 52, 0.8)),
                          )
                        ],
                      ),
                      Expanded(
                        child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            child: Obx(() => Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Row(
                                      children: [
                                        Text("Tax5.25",
                                            style: TextStyle(
                                                color: Colors.white60)),
                                        Spacer(),
                                        Text("0.00",
                                            style: TextStyle(
                                                color: Colors.white60)),
                                      ],
                                    ),
                                    const Row(
                                      children: [
                                        Text("Subtotal",
                                            style: TextStyle(
                                                color: Colors.white60)),
                                        Spacer(),
                                        Text("0.00",
                                            style: TextStyle(
                                                color: Colors.white60)),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Text("Total",
                                            style: TextStyle(
                                                color: Colors.white60)),
                                        const Spacer(),
                                        Text(
                                            toggleController
                                                .getTotalPrice()
                                                .toString(),
                                            style: const TextStyle(
                                                color: Colors.white60)),
                                      ],
                                    )
                                  ],
                                ))),
                      ),
                      Row(
                        children: <Widget>[
                          const Expanded(
                            child: CustomTextButton(
                              text: "KOT",
                              color: Color.fromRGBO(85, 91, 101, 1),
                            ),
                          ),
                          Expanded(
                            child: Obx(() {
                              // TabbleToggleController controller = Get.find();
                              bool isEmpty = toggleController.isOrderEmpty();

                              return TextButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0),
                                      side: const BorderSide(color: darkBlue),
                                    )),
                                    backgroundColor: MaterialStateProperty.all<
                                            Color>(
                                        const Color.fromRGBO(85, 91, 101, 1))),
                                child: const Text("Place Order",
                                    style: TextStyle(
                                        color: Colors.white,
                                        overflow: TextOverflow.fade),
                                    softWrap: true),
                                onPressed: () {
                                  if (isEmpty) {
                                    Fluttertoast.showToast(
                                        msg: "Please add items to cart",
                                        toastLength: Toast.LENGTH_LONG,
                                        gravity: ToastGravity.TOP,
                                        timeInSecForIosWeb: 3,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  } else {
                                    CustomersController customersController =
                                        Get.find();

                                    customersController.addCustomer(
                                        toggleController
                                            .selectedCustomer.value);
                                    Fluttertoast.showToast(
                                        msg: "Order Placed Successfully",
                                        toastLength: Toast.LENGTH_LONG,
                                        gravity: ToastGravity.TOP,
                                        timeInSecForIosWeb: 3,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  }
                                  print("Order Placed Successfully");
                                },
                              );
                            }),
                          ),
                        ],
                      ),
                    ],
                  )),
            ],
          ),
        ));
  }

  AppBar sideAppBar() {
    return AppBar(
      backgroundColor: darkBlue,
      // padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      leading: const Center(
        child: FaIcon(FontAwesomeIcons.magnifyingGlass,
            color: Colors.white, size: 20),
      ),

      actions: const [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Example',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              'Checked at 12:30',
              style: TextStyle(fontSize: 10, color: Colors.grey),
            ),
          ],
        ),
        SizedBox(width: 10),
        CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(
              "https://ui-avatars.com/api/?name=Example?bold=true&length=1&rounded=true&color=fff&background=B5013F"),
        )
      ],
    );
  }
}
