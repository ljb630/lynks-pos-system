import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lynks_pos_system/controllers/table_toggle_controller.dart';
import 'package:lynks_pos_system/screens/home/sidebar/cart.dart';
import 'package:lynks_pos_system/screens/home/sidebar/custom_text_button.dart';
import 'package:lynks_pos_system/screens/home/sidebar/empty_cart.dart';
import 'package:lynks_pos_system/util/constants.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  TabbleToggleController toggleController = Get.find();

  @override
  Widget build(BuildContext context) {
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
                  child: const Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Table',
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                            Text("Customer Name",
                                style: TextStyle(fontSize: 12))
                          ],
                        ),
                      ),
                      FaIcon(FontAwesomeIcons.angleDown,
                          color: Colors.white, size: 20),
                      SizedBox(width: 20),
                      FaIcon(FontAwesomeIcons.trashCan,
                          color: Colors.white, size: 20),
                      SizedBox(width: 20),
                      FaIcon(FontAwesomeIcons.penToSquare,
                          color: Colors.white, size: 20),
                    ],
                  )),
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
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    Text("Tax5.25",
                                        style:
                                            TextStyle(color: Colors.white60)),
                                    Spacer(),
                                    Text("0.00",
                                        style:
                                            TextStyle(color: Colors.white60)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("Subtotal",
                                        style:
                                            TextStyle(color: Colors.white60)),
                                    Spacer(),
                                    Text("0.00",
                                        style:
                                            TextStyle(color: Colors.white60)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("Total",
                                        style:
                                            TextStyle(color: Colors.white60)),
                                    Spacer(),
                                    Text("0.00",
                                        style:
                                            TextStyle(color: Colors.white60)),
                                  ],
                                )
                              ],
                            )),
                      ),
                      const Row(
                        children: <Widget>[
                          Expanded(
                            child: CustomTextButton(
                              text: "KOT",
                              color: Color.fromRGBO(85, 91, 101, 1),
                            ),
                          ),
                          Expanded(
                            child: CustomTextButton(
                                text: "Place Order",
                                color: Color.fromRGBO(85, 91, 101, 1)),
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
